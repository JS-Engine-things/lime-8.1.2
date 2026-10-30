package lime.tools;

import haxe.macro.Expr;

import hxp.HostArchitecture;

@:forward
enum abstract Architecture(String) to String
{
	var ARM64 = "ARM64";
	var X64 = "X64";

	public static function exists(architecture:String):Bool
	{
		switch (architecture)
		{
			case ARM64, X64:
				return true;
			default:
				return false;
		}
	}

	@:from private static function fromHostArchitecture(hostArchitecture:HostArchitecture):Architecture
	{
		if (hostArchitecture == HostArchitecture.ARM64)
		{
			return ARM64;
		}
		else
		{
			return X64;
		}
	}

	@:from private static function fromString(string:String):Architecture
	{
		if (exists(string))
		{
			return cast string;
		}
		else
		{
			return null;
		}
	}

	/**
		Returns the given `Architecture` if available, or `null` otherwise.
	**/
	public inline function new(name:String)
	{
		this = fromString(name.toUpperCase());
	}

	public inline function is64():Bool
	{
		return this == ARM64 || this == X64;
	}

	public inline function isARM():Bool
	{
		return this.indexOf("ARM") == 0;
	}

	public inline function isX():Bool
	{
		return this == X64;
	}

	public function getConditionName():String
	{
		return switch (this)
		{
			case X64: "x86_64";
			default: this.toLowerCase();
		}
	}

	@:noCompletion public macro function match(self:Expr, expr:Expr):Expr
	{
		return macro switch ($self)
		{
			case $expr:
				true;
			default:
				false;
		};
	}
}