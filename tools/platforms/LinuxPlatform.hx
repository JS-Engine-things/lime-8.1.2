package;

import hxp.HXML;
import hxp.Log;
import hxp.Path;
import hxp.System;

import lime.tools.Architecture;
import lime.tools.AssetHelper;
import lime.tools.CPPHelper;
import lime.tools.HXProject;
import lime.tools.Orientation;
import lime.tools.PlatformTarget;
import lime.tools.ProjectHelper;

import sys.FileSystem;
import sys.io.File;

class LinuxPlatform extends PlatformTarget
{
	private var applicationDirectory:String;
	private var executablePath:String;
	private var isArm:Bool;

	public function new(command:String, _project:HXProject, targetFlags:Map<String, String>)
	{
		super(command, _project, targetFlags);

		// This fork is 64-bit only. Fail early if 32-bit was explicitly requested.
		if (targetFlags.exists("32") || targetFlags.exists("x86") || targetFlags.exists("x86_32"))
		{
			Log.error("32-bit Linux builds are not supported in this fork. Remove the -32 / -x86 flag to build for 64-bit.");
		}

		var defaults:HXProject = createDefaultProject();

		switch (System.hostArchitecture)
		{
			case ARM64:
				defaults.architectures = [ARM64];
			case X64:
				defaults.architectures = [X64];
			default:
				Log.error("This fork only supports 64-bit Linux hosts (x64 or ARM64).");
		}

		defaults.merge(project);

		project = defaults;

		for (excludeArchitecture in project.excludeArchitectures)
		{
			project.architectures.remove(excludeArchitecture);
		}

		for (architecture in project.architectures)
		{
			if (targetFlags.exists("arm64") || architecture == Architecture.ARM64)
			{
				isArm = true;
			}
		}

		targetDirectory = Path.combine(project.app.path, project.config.getString("linux.output-directory", "linux"));
		targetDirectory = StringTools.replace(targetDirectory, "arch64", "64");
		applicationDirectory = targetDirectory + "/bin/";
		executablePath = Path.combine(applicationDirectory, project.app.file);
	}

	public override function build():Void
	{
		var hxml = targetDirectory + "/haxe/" + buildType + ".hxml";

		System.mkdir(targetDirectory);

		for (dependency in project.dependencies)
		{
			if (StringTools.endsWith(dependency.path, ".so"))
			{
				copyIfNewer(dependency.path, applicationDirectory + "/" + Path.withoutDirectory(dependency.path));
			}
			else if (dependency.type != null)
			{
				copyIfNewer(Path.combine(dependency.path, "Linux" + (isArm ? "Arm" : "") + "64/" + dependency.name),
					applicationDirectory + "/" + dependency.name);
			}
			else
			{
				copyIfNewer(Path.combine(dependency.path, "Linux" + (isArm ? "Arm" : "") + "64/" + dependency.name + ".so"),
					applicationDirectory
					+ "/"
					+ dependency.name
					+ ".so");
			}
		}

		for (ndll in project.ndlls)
		{
			ProjectHelper.copyLibrary(project, ndll, "Linux" + (isArm ? "Arm" : "") + "64", "", ".ndll", applicationDirectory, project.debug);
		}

		var haxeArgs:Array<String> = [hxml];
		var flags:Array<String> = [];

		if (isArm)
		{
			haxeArgs.push("-D");
			haxeArgs.push("HXCPP_ARM64");
			flags.push("-DHXCPP_ARM64");
		}
		else
		{
			haxeArgs.push("-D");
			haxeArgs.push("HXCPP_M64");
			flags.push("-DHXCPP_M64");
		}

		System.runCommand("", "haxe", haxeArgs);

		if (noOutput)
			return;

		CPPHelper.compile(project, targetDirectory + "/obj", flags);

		System.copyFile(targetDirectory + "/obj/ApplicationMain" + (project.debug ? "-debug" : ""), executablePath);

		if (System.hostPlatform != WINDOWS)
		{
			System.runCommand("", "chmod", ["755", executablePath]);
		}
	}

	public override function display():Void
	{
		if (project.targetFlags.exists("output-file"))
		{
			Sys.println(executablePath);
		}
		else
		{
			Sys.println(getDisplayHXML().toString());
		}
	}

	private function generateContext():Dynamic
	{
		if (targetFlags.exists('rpi'))
		{
			project.haxedefs.set("rpi", 1);
		}

		var context = project.templateContext;

		context.CPP_DIR = targetDirectory + "/obj";

		return context;
	}

	private override function getDisplayHXML():HXML
	{
		var path = targetDirectory + "/haxe/" + buildType + ".hxml";

		// try to use the existing .hxml file. however, if the project file was
		// modified more recently than the .hxml, then the .hxml cannot be
		// considered valid anymore. it may cause errors in editors like vscode.
		if (FileSystem.exists(path)
			&& (project.projectFilePath == null
				|| !FileSystem.exists(project.projectFilePath)
				|| (FileSystem.stat(path).mtime.getTime() > FileSystem.stat(project.projectFilePath).mtime.getTime())))
		{
			return File.getContent(path);
		}
		else
		{
			var context = project.templateContext;
			var hxml = HXML.fromString(context.HAXE_FLAGS);
			hxml.addClassName(context.APP_MAIN);
			hxml.cpp = "_";
			hxml.noOutput = true;
			return hxml;
		}
	}

	public override function rebuild():Void
	{
		var commands:Array<Array<String>> = [];

		if (project.architectures.indexOf(Architecture.ARM64) != -1 || targetFlags.exists("arm64"))
		{
			commands.push(["-Dlinux", "-DHXCPP_ARM64"]);
		}

		if (project.architectures.indexOf(Architecture.X64) != -1)
		{
			commands.push(["-Dlinux", "-DHXCPP_M64"]);
		}

		CPPHelper.rebuild(project, commands);
	}

	public override function run():Void
	{
		var arguments = additionalArguments.copy();

		if (Log.verbose)
		{
			arguments.push("-verbose");
		}

		if (Std.string(project.target) == Std.string(System.hostPlatform))
		{
			arguments = arguments.concat(["-livereload"]);
			System.runCommand(applicationDirectory, "./" + Path.withoutDirectory(executablePath), arguments);
		}
	}

	public override function update():Void
	{
		AssetHelper.processLibraries(project, targetDirectory);

		if (project.targetFlags.exists("xml"))
		{
			project.haxeflags.push("--xml " + targetDirectory + "/types.xml");
		}

		if (project.targetFlags.exists("json"))
		{
			project.haxeflags.push("--json " + targetDirectory + "/types.json");
		}

		var context = generateContext();
		context.OUTPUT_DIR = targetDirectory;

		System.mkdir(targetDirectory);
		System.mkdir(targetDirectory + "/obj");
		System.mkdir(targetDirectory + "/haxe");
		System.mkdir(applicationDirectory);

		ProjectHelper.recursiveSmartCopyTemplate(project, "haxe", targetDirectory + "/haxe", context);
		ProjectHelper.recursiveSmartCopyTemplate(project, "cpp/hxml", targetDirectory + "/haxe", context);

		copyProjectAssets(applicationDirectory);
	}

	public override function install():Void {}

	public override function trace():Void {}

	public override function uninstall():Void {}
}