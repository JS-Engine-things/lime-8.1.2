package lime._internal.backend.native;

import haxe.io.Bytes;
import lime.graphics.opengl.GLBuffer;
import lime.graphics.opengl.GLFramebuffer;
import lime.graphics.opengl.GLProgram;
import lime.graphics.opengl.GLRenderbuffer;
import lime.graphics.opengl.GLShader;
import lime.graphics.opengl.GLTexture;
import lime.graphics.Image;
import lime.graphics.ImageBuffer;
import lime.math.Rectangle;
import lime.media.openal.ALAuxiliaryEffectSlot;
import lime.utils.DataPointer;
#if lime_cffi
import lime.system.CFFI;
import lime.system.CFFIPointer;
#end
#if cpp
import cpp.Float32;
#end

#if !macro
#if disable_cffi
@:build(lime.system.CFFI.build())
#end
#end
class NativeCFFI
{
	#if (lime_cffi && !macro)
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_application_create():Dynamic;

	@:cffi private static function lime_application_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_application_exec(handle:Dynamic):Int;

	@:cffi private static function lime_application_init(handle:Dynamic):Void;

	@:cffi private static function lime_application_quit(handle:Dynamic):Int;

	@:cffi private static function lime_application_set_frame_rate(handle:Dynamic, value:Float):Void;

	@:cffi private static function lime_application_update(handle:Dynamic):Bool;

	@:cffi private static function lime_audio_load(data:Dynamic, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_audio_load_bytes(data:Dynamic, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_audio_load_file(path:Dynamic, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_bytes_from_data_pointer(data:Float, length:Int, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_bytes_get_data_pointer(data:Dynamic):Float;

	@:cffi private static function lime_bytes_get_data_pointer_offset(data:Dynamic, offset:Int):Float;

	@:cffi private static function lime_bytes_read_file(path:String, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_cffi_get_native_pointer(ptr:Dynamic):Float;

	@:cffi private static function lime_clipboard_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_clipboard_get_text():Dynamic;

	@:cffi private static function lime_clipboard_set_text(text:String):Void;

	@:cffi private static function lime_data_pointer_offset(dataPointer:DataPointer, offset:Int):Float;

	@:cffi private static function lime_deflate_compress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_deflate_decompress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_drop_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_file_dialog_open_directory(title:String, filter:String, defaultPath:String):Dynamic;

	@:cffi private static function lime_file_dialog_open_file(title:String, filter:String, defaultPath:String):Dynamic;

	@:cffi private static function lime_file_dialog_open_files(title:String, filter:String, defaultPath:String):Dynamic;

	@:cffi private static function lime_file_dialog_save_file(title:String, filter:String, defaultPath:String):Dynamic;

	@:cffi private static function lime_file_watcher_create(callback:Dynamic):CFFIPointer;

	@:cffi private static function lime_file_watcher_add_directory(handle:CFFIPointer, path:Dynamic, recursive:Bool):Dynamic;

	@:cffi private static function lime_file_watcher_remove_directory(handle:CFFIPointer, watchID:Dynamic):Void;

	@:cffi private static function lime_file_watcher_update(handle:CFFIPointer):Void;

	@:cffi private static function lime_font_get_ascender(handle:Dynamic):Int;

	@:cffi private static function lime_font_get_descender(handle:Dynamic):Int;

	@:cffi private static function lime_font_get_family_name(handle:Dynamic):Dynamic;

	@:cffi private static function lime_font_get_glyph_index(handle:Dynamic, character:String):Int;

	@:cffi private static function lime_font_get_glyph_indices(handle:Dynamic, characters:String):Dynamic;

	@:cffi private static function lime_font_get_glyph_metrics(handle:Dynamic, index:Int):Dynamic;

	@:cffi private static function lime_font_get_height(handle:Dynamic):Int;

	@:cffi private static function lime_font_get_num_glyphs(handle:Dynamic):Int;

	@:cffi private static function lime_font_get_underline_position(handle:Dynamic):Int;

	@:cffi private static function lime_font_get_underline_thickness(handle:Dynamic):Int;

	@:cffi private static function lime_font_get_units_per_em(handle:Dynamic):Int;

	@:cffi private static function lime_font_load(data:Dynamic):Dynamic;

	@:cffi private static function lime_font_load_bytes(data:Dynamic):Dynamic;

	@:cffi private static function lime_font_load_file(path:Dynamic):Dynamic;

	@:cffi private static function lime_font_outline_decompose(handle:Dynamic, size:Int):Dynamic;

	@:cffi private static function lime_font_render_glyph(handle:Dynamic, index:Int, data:Dynamic):Dynamic;

	@:cffi private static function lime_font_render_glyphs(handle:Dynamic, indices:Dynamic, data:Dynamic):Dynamic;

	@:cffi private static function lime_font_set_size(handle:Dynamic, size:Int):Void;

	@:cffi private static function lime_gamepad_add_mappings(mappings:Dynamic):Void;

	@:cffi private static function lime_gamepad_get_device_guid(id:Int):Dynamic;

	@:cffi private static function lime_gamepad_get_device_name(id:Int):Dynamic;

	@:cffi private static function lime_gamepad_rumble(id:Int, lowFrequencyRumble:Float, highFrequencyRumble:Float, duration:Int):Void;

	@:cffi private static function lime_gamepad_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_gzip_compress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_gzip_decompress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_haptic_vibrate(period:Int, duration:Int):Void;

	@:cffi private static function lime_image_encode(data:Dynamic, type:Int, quality:Int, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_image_load(data:Dynamic, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_image_load_bytes(data:Dynamic, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_image_load_file(path:Dynamic, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_image_data_util_color_transform(image:Dynamic, rect:Dynamic, colorMatrix:Dynamic):Void;

	@:cffi private static function lime_image_data_util_copy_channel(image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic,
		srcChannel:Int, destChannel:Int):Void;

	@:cffi private static function lime_image_data_util_copy_pixels(image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic,
		alphaImage:Dynamic, alphaPoint:Dynamic, mergeAlpha:Bool):Void;

	@:cffi private static function lime_image_data_util_fill_rect(image:Dynamic, rect:Dynamic, rg:Int, ba:Int):Void;

	@:cffi private static function lime_image_data_util_flood_fill(image:Dynamic, x:Int, y:Int, rg:Int, ba:Int):Void;

	@:cffi private static function lime_image_data_util_get_pixels(image:Dynamic, rect:Dynamic, format:Int, bytes:Dynamic):Void;

	@:cffi private static function lime_image_data_util_merge(image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, redMultiplier:Int,
		greenMultiplier:Int, blueMultiplier:Int, alphaMultiplier:Int):Void;

	@:cffi private static function lime_image_data_util_multiply_alpha(image:Dynamic):Void;

	@:cffi private static function lime_image_data_util_resize(image:Dynamic, buffer:Dynamic, width:Int, height:Int):Void;

	@:cffi private static function lime_image_data_util_set_format(image:Dynamic, format:Int):Void;

	@:cffi private static function lime_image_data_util_set_pixels(image:Dynamic, rect:Dynamic, bytes:Dynamic, offset:Int, format:Int, endian:Int):Void;

	@:cffi private static function lime_image_data_util_threshold(image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, operation:Int,
		thresholdRG:Int, thresholdBA:Int, colorRG:Int, colorBA:Int, maskRG:Int, maskBA:Int, copySource:Bool):Int;

	@:cffi private static function lime_image_data_util_unmultiply_alpha(image:Dynamic):Void;

	@:cffi private static function lime_joystick_get_device_guid(id:Int):Dynamic;

	@:cffi private static function lime_joystick_get_device_name(id:Int):Dynamic;

	@:cffi private static function lime_joystick_get_num_axes(id:Int):Int;

	@:cffi private static function lime_joystick_get_num_buttons(id:Int):Int;

	@:cffi private static function lime_joystick_get_num_hats(id:Int):Int;

	@:cffi private static function lime_joystick_get_num_trackballs(id:Int):Int;

	@:cffi private static function lime_joystick_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_jpeg_decode_bytes(data:Dynamic, decodeData:Bool, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_jpeg_decode_file(path:String, decodeData:Bool, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_key_code_from_scan_code(scanCode:Float32):Float32;

	@:cffi private static function lime_key_code_to_scan_code(keyCode:Float32):Float32;

	@:cffi private static function lime_key_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_lzma_compress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_lzma_decompress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_mouse_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_png_decode_bytes(data:Dynamic, decodeData:Bool, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_png_decode_file(path:String, decodeData:Bool, buffer:Dynamic):Dynamic;

	@:cffi private static function lime_render_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_sensor_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_system_get_allow_screen_timeout():Bool;

	@:cffi private static function lime_system_set_allow_screen_timeout(value:Bool):Bool;

	@:cffi private static function lime_system_get_device_model():Dynamic;

	@:cffi private static function lime_system_get_device_vendor():Dynamic;

	@:cffi private static function lime_system_get_directory(type:Int, company:String, title:String):Dynamic;

	@:cffi private static function lime_system_get_display(index:Int):Dynamic;

	@:cffi private static function lime_system_get_num_displays():Int;

	@:cffi private static function lime_system_get_platform_label():Dynamic;

	@:cffi private static function lime_system_get_platform_name():Dynamic;

	@:cffi private static function lime_system_get_platform_version():Dynamic;

	@:cffi private static function lime_system_get_timer():Float;

	@:cffi private static function lime_system_get_performance_counter():Float;

	@:cffi private static function lime_system_get_performance_frequency():Float;

	@:cffi private static function lime_system_open_file(path:String):Void;

	@:cffi private static function lime_system_open_url(url:String, target:String):Void;

	@:cffi private static function lime_text_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_touch_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_window_alert(handle:Dynamic, message:String, title:String):Void;

	@:cffi private static function lime_window_close(handle:Dynamic):Void;

	@:cffi private static function lime_window_context_flip(handle:Dynamic):Void;

	@:cffi private static function lime_window_context_lock(handle:Dynamic):Dynamic;

	@:cffi private static function lime_window_context_make_current(handle:Dynamic):Void;

	@:cffi private static function lime_window_context_unlock(handle:Dynamic):Void;

	@:cffi private static function lime_window_create(application:Dynamic, width:Int, height:Int, flags:Int, title:String):Dynamic;

	@:cffi private static function lime_window_focus(handle:Dynamic):Void;

	@:cffi private static function lime_window_get_context(handle:Dynamic):Float;

	@:cffi private static function lime_window_get_context_type(handle:Dynamic):Dynamic;

	@:cffi private static function lime_window_get_display(handle:Dynamic):Int;

	@:cffi private static function lime_window_get_display_mode(handle:Dynamic):Dynamic;

	@:cffi private static function lime_window_get_height(handle:Dynamic):Int;

	@:cffi private static function lime_window_get_id(handle:Dynamic):Int;

	@:cffi private static function lime_window_get_mouse_lock(handle:Dynamic):Bool;

	@:cffi private static function lime_window_get_opacity(handle:Dynamic):Float;

	@:cffi private static function lime_window_get_scale(handle:Dynamic):Float;

	@:cffi private static function lime_window_get_text_input_enabled(handle:Dynamic):Bool;

	@:cffi private static function lime_window_get_width(handle:Dynamic):Int;

	@:cffi private static function lime_window_get_x(handle:Dynamic):Int;

	@:cffi private static function lime_window_get_y(handle:Dynamic):Int;

	@:cffi private static function lime_window_move(handle:Dynamic, x:Int, y:Int):Void;

	@:cffi private static function lime_window_read_pixels(handle:Dynamic, rect:Dynamic, imageBuffer:Dynamic):Dynamic;

	@:cffi private static function lime_window_resize(handle:Dynamic, width:Int, height:Int):Void;

	@:cffi private static function lime_window_set_minimum_size(handle:Dynamic, width:Int, height:Int):Void;

	@:cffi private static function lime_window_set_maximum_size(handle:Dynamic, width:Int, height:Int):Void;

	@:cffi private static function lime_window_set_borderless(handle:Dynamic, borderless:Bool):Bool;

	@:cffi private static function lime_window_set_cursor(handle:Dynamic, cursor:Int):Void;

	@:cffi private static function lime_window_set_display_mode(handle:Dynamic, displayMode:Dynamic):Dynamic;

	@:cffi private static function lime_window_set_fullscreen(handle:Dynamic, fullscreen:Bool):Bool;

	@:cffi private static function lime_window_set_icon(handle:Dynamic, buffer:Dynamic):Void;

	@:cffi private static function lime_window_set_maximized(handle:Dynamic, maximized:Bool):Bool;

	@:cffi private static function lime_window_set_minimized(handle:Dynamic, minimized:Bool):Bool;

	@:cffi private static function lime_window_set_mouse_lock(handle:Dynamic, mouseLock:Bool):Void;

	@:cffi private static function lime_window_set_opacity(handle:Dynamic, value:Float):Void;

	@:cffi private static function lime_window_set_resizable(handle:Dynamic, resizable:Bool):Bool;

	@:cffi private static function lime_window_set_text_input_enabled(handle:Dynamic, enabled:Bool):Void;

	@:cffi private static function lime_window_set_text_input_rect(handle:Dynamic, rect:Dynamic):Void;

	@:cffi private static function lime_window_set_title(handle:Dynamic, title:String):Dynamic;

	@:cffi private static function lime_window_set_visible(handle:Dynamic, visible:Bool):Bool;

	@:cffi private static function lime_window_set_vsync(handle:Dynamic, vsync:Bool):Bool;

	@:cffi private static function lime_window_warp_mouse(handle:Dynamic, x:Int, y:Int):Void;

	@:cffi private static function lime_window_event_manager_register(callback:Dynamic, eventObject:Dynamic):Void;

	@:cffi private static function lime_zlib_compress(data:Dynamic, bytes:Dynamic):Dynamic;

	@:cffi private static function lime_zlib_decompress(data:Dynamic, bytes:Dynamic):Dynamic;
	#else
	private static var lime_application_create = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_application_create", "o", false));
	private static var lime_application_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_application_event_manager_register", "oov", false));
	private static var lime_application_exec = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_application_exec", "oi", false));
	private static var lime_application_init = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_application_init", "ov", false));
	private static var lime_application_quit = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_application_quit", "oi", false));
	private static var lime_application_set_frame_rate = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_application_set_frame_rate", "odv", false));
	private static var lime_application_update = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_application_update", "ob", false));
	private static var lime_audio_load = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_audio_load", "ooo", false));
	private static var lime_audio_load_bytes = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_audio_load_bytes",
		"ooo", false));
	private static var lime_audio_load_file = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_audio_load_file", "ooo",
		false));
	private static var lime_bytes_from_data_pointer = new cpp.Callable<Float->Int->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_bytes_from_data_pointer", "dioo", false));
	private static var lime_bytes_get_data_pointer = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_bytes_get_data_pointer", "od",
		false));
	private static var lime_bytes_get_data_pointer_offset = new cpp.Callable<cpp.Object->Int->Float>(cpp.Prime._loadPrime("lime",
		"lime_bytes_get_data_pointer_offset", "oid", false));
	private static var lime_bytes_read_file = new cpp.Callable<String->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_bytes_read_file", "soo",
		false));
	private static var lime_cffi_get_native_pointer = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_cffi_get_native_pointer", "od",
		false));
	private static var lime_clipboard_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_clipboard_event_manager_register", "oov", false));
	private static var lime_clipboard_get_text = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_clipboard_get_text", "o", false));
	private static var lime_clipboard_set_text = new cpp.Callable<String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_clipboard_set_text", "sv", false));
	private static var lime_data_pointer_offset = new cpp.Callable<lime.utils.DataPointer->Int->Float>(cpp.Prime._loadPrime("lime",
		"lime_data_pointer_offset", "did", false));
	private static var lime_deflate_compress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_deflate_compress",
		"ooo", false));
	private static var lime_deflate_decompress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_deflate_decompress",
		"ooo", false));
	private static var lime_drop_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_drop_event_manager_register", "oov", false));
	private static var lime_file_dialog_open_directory = new cpp.Callable<String->String->String->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_file_dialog_open_directory", "ssso", false));
	private static var lime_file_dialog_open_file = new cpp.Callable<String->String->String->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_file_dialog_open_file", "ssso", false));
	private static var lime_file_dialog_open_files = new cpp.Callable<String->String->String->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_file_dialog_open_files", "ssso", false));
	private static var lime_file_dialog_save_file = new cpp.Callable<String->String->String->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_file_dialog_save_file", "ssso", false));
	private static var lime_file_watcher_create = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_file_watcher_create", "oo",
		false));
	private static var lime_file_watcher_add_directory = new cpp.Callable<cpp.Object->cpp.Object->Bool->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_file_watcher_add_directory", "oobo", false));
	private static var lime_file_watcher_remove_directory = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_file_watcher_remove_directory", "oov", false));
	private static var lime_file_watcher_update = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_file_watcher_update", "ov",
		false));
	private static var lime_font_get_ascender = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_ascender", "oi", false));
	private static var lime_font_get_descender = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_descender", "oi", false));
	private static var lime_font_get_family_name = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_font_get_family_name", "oo",
		false));
	private static var lime_font_get_glyph_index = new cpp.Callable<cpp.Object->String->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_glyph_index", "osi",
		false));
	private static var lime_font_get_glyph_indices = new cpp.Callable<cpp.Object->String->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_font_get_glyph_indices", "oso", false));
	private static var lime_font_get_glyph_metrics = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_font_get_glyph_metrics",
		"oio", false));
	private static var lime_font_get_height = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_height", "oi", false));
	private static var lime_font_get_num_glyphs = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_num_glyphs", "oi", false));
	private static var lime_font_get_underline_position = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_underline_position",
		"oi", false));
	private static var lime_font_get_underline_thickness = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_underline_thickness",
		"oi", false));
	private static var lime_font_get_units_per_em = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_font_get_units_per_em", "oi", false));
	private static var lime_font_load = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_font_load", "oo", false));
	private static var lime_font_load_bytes = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_font_load_bytes", "oo", false));
	private static var lime_font_load_file = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_font_load_file", "oo", false));
	private static var lime_font_outline_decompose = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_font_outline_decompose",
		"oio", false));
	private static var lime_font_render_glyph = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_font_render_glyph", "oioo", false));
	private static var lime_font_render_glyphs = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_font_render_glyphs", "oooo", false));
	private static var lime_font_set_size = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_font_set_size", "oiv", false));
	private static var lime_gamepad_add_mappings = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gamepad_add_mappings", "ov",
		false));
	private static var lime_gamepad_get_device_guid = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gamepad_get_device_guid", "io",
		false));
	private static var lime_gamepad_get_device_name = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gamepad_get_device_name", "io",
		false));
	private static var lime_gamepad_rumble = new cpp.Callable<Int->Float->Float->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gamepad_rumble", "iddiv",
		false));
	private static var lime_gamepad_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gamepad_event_manager_register", "oov", false));
	private static var lime_gzip_compress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gzip_compress", "ooo",
		false));
	private static var lime_gzip_decompress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gzip_decompress", "ooo",
		false));
	private static var lime_haptic_vibrate = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_haptic_vibrate", "iiv", false));
	private static var lime_image_encode = new cpp.Callable<cpp.Object->Int->Int->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_image_encode",
		"oiioo", false));
	private static var lime_image_load = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_image_load", "ooo", false));
	private static var lime_image_load_bytes = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_image_load_bytes",
		"ooo", false));
	private static var lime_image_load_file = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_image_load_file", "ooo",
		false));
	private static var lime_image_data_util_color_transform = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_color_transform", "ooov", false));
	private static var lime_image_data_util_copy_channel = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Object->Int->Int->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_image_data_util_copy_channel", "ooooiiv", false));
	private static var lime_image_data_util_copy_pixels = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Object->cpp.Object->cpp.Object->Bool->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_image_data_util_copy_pixels", "oooooobv", false));
	private static var lime_image_data_util_fill_rect = new cpp.Callable<cpp.Object->cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_fill_rect", "ooiiv", false));
	private static var lime_image_data_util_flood_fill = new cpp.Callable<cpp.Object->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_flood_fill", "oiiiiv", false));
	private static var lime_image_data_util_get_pixels = new cpp.Callable<cpp.Object->cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_get_pixels", "ooiov", false));
	private static var lime_image_data_util_merge = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Object->Int->Int->Int->Int->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_image_data_util_merge", "ooooiiiiv", false));
	private static var lime_image_data_util_multiply_alpha = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_multiply_alpha", "ov", false));
	private static var lime_image_data_util_resize = new cpp.Callable<cpp.Object->cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_resize", "ooiiv", false));
	private static var lime_image_data_util_set_format = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_set_format", "oiv", false));
	private static var lime_image_data_util_set_pixels = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int->Int->Int->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_image_data_util_set_pixels", "oooiiiv", false));
	private static var lime_image_data_util_threshold = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Object->Int->Int->Int->Int->Int->Int->Int->
		Bool->Int>(cpp.Prime._loadPrime("lime", "lime_image_data_util_threshold", "ooooiiiiiiibi", false));
	private static var lime_image_data_util_unmultiply_alpha = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_image_data_util_unmultiply_alpha", "ov", false));
	private static var lime_joystick_get_device_guid = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_joystick_get_device_guid", "io",
		false));
	private static var lime_joystick_get_device_name = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_joystick_get_device_name", "io",
		false));
	private static var lime_joystick_get_num_axes = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_joystick_get_num_axes", "ii", false));
	private static var lime_joystick_get_num_buttons = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_joystick_get_num_buttons", "ii", false));
	private static var lime_joystick_get_num_hats = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_joystick_get_num_hats", "ii", false));
	private static var lime_joystick_get_num_trackballs = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_joystick_get_num_trackballs", "ii",
		false));
	private static var lime_joystick_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_joystick_event_manager_register", "oov", false));
	private static var lime_jpeg_decode_bytes = new cpp.Callable<cpp.Object->Bool->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_jpeg_decode_bytes", "oboo", false));
	private static var lime_jpeg_decode_file = new cpp.Callable<String->Bool->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_jpeg_decode_file",
		"sboo", false));
	private static var lime_key_code_from_scan_code = new cpp.Callable<cpp.Float32->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_key_code_from_scan_code",
		"ff", false));
	private static var lime_key_code_to_scan_code = new cpp.Callable<cpp.Float32->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_key_code_to_scan_code",
		"ff", false));
	private static var lime_key_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_key_event_manager_register", "oov", false));
	private static var lime_lzma_compress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_lzma_compress", "ooo",
		false));
	private static var lime_lzma_decompress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_lzma_decompress", "ooo",
		false));
	private static var lime_mouse_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_mouse_event_manager_register", "oov", false));
	private static var lime_png_decode_bytes = new cpp.Callable<cpp.Object->Bool->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_png_decode_bytes", "oboo", false));
	private static var lime_png_decode_file = new cpp.Callable<String->Bool->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_png_decode_file",
		"sboo", false));
	private static var lime_render_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_render_event_manager_register", "oov", false));
	private static var lime_sensor_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_sensor_event_manager_register", "oov", false));
	private static var lime_system_get_allow_screen_timeout = new cpp.Callable<Void->Bool>(cpp.Prime._loadPrime("lime",
		"lime_system_get_allow_screen_timeout", "b", false));
	private static var lime_system_set_allow_screen_timeout = new cpp.Callable<Bool->Bool>(cpp.Prime._loadPrime("lime",
		"lime_system_set_allow_screen_timeout", "bb", false));
	private static var lime_system_get_device_model = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_device_model", "o",
		false));
	private static var lime_system_get_device_vendor = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_device_vendor", "o",
		false));
	private static var lime_system_get_directory = new cpp.Callable<Int->String->String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_directory",
		"isso", false));
	private static var lime_system_get_display = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_display", "io", false));
	private static var lime_system_get_ios_tablet = new cpp.Callable<Void->Bool>(cpp.Prime._loadPrime("lime", "lime_system_get_ios_tablet", "b", false));
	private static var lime_system_get_num_displays = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_system_get_num_displays", "i", false));
	private static var lime_system_get_platform_label = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_platform_label", "o",
		false));
	private static var lime_system_get_platform_name = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_platform_name", "o",
		false));
	private static var lime_system_get_platform_version = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_system_get_platform_version",
		"o", false));
	private static var lime_system_get_timer = new cpp.Callable<Void->Float>(cpp.Prime._loadPrime("lime", "lime_system_get_timer", "d", false));
	private static var lime_system_get_performance_counter = new cpp.Callable<Void->Float>(cpp.Prime._loadPrime("lime", "lime_system_get_performance_counter", "d", false));
	private static var lime_system_get_performance_frequency = new cpp.Callable<Void->Float>(cpp.Prime._loadPrime("lime", "lime_system_get_performance_frequency", "d", false));
	private static var lime_system_open_file = new cpp.Callable<String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_system_open_file", "sv", false));
	private static var lime_system_open_url = new cpp.Callable<String->String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_system_open_url", "ssv", false));
	private static var lime_text_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_text_event_manager_register", "oov", false));
	private static var lime_touch_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_touch_event_manager_register", "oov", false));
	private static var lime_window_alert = new cpp.Callable<cpp.Object->String->String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_alert", "ossv",
		false));
	private static var lime_window_close = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_close", "ov", false));
	private static var lime_window_context_flip = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_context_flip", "ov",
		false));
	private static var lime_window_context_lock = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_window_context_lock", "oo",
		false));
	private static var lime_window_context_make_current = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_window_context_make_current", "ov", false));
	private static var lime_window_context_unlock = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_context_unlock", "ov",
		false));
	private static var lime_window_create = new cpp.Callable<cpp.Object->Int->Int->Int->String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_window_create",
		"oiiiso", false));
	private static var lime_window_focus = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_focus", "ov", false));
	private static var lime_window_get_context = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_window_get_context", "od", false));
	private static var lime_window_get_context_type = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_window_get_context_type",
		"oo", false));
	private static var lime_window_get_display = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_window_get_display", "oi", false));
	private static var lime_window_get_display_mode = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_window_get_display_mode",
		"oo", false));
	private static var lime_window_get_height = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_window_get_height", "oi", false));
	private static var lime_window_get_id = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_window_get_id", "oi", false));
	private static var lime_window_get_mouse_lock = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_window_get_mouse_lock", "ob",
		false));
	private static var lime_window_get_opacity = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_window_get_opacity", "od", false));
	private static var lime_window_get_scale = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_window_get_scale", "od", false));
	private static var lime_window_get_text_input_enabled = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime",
		"lime_window_get_text_input_enabled", "ob", false));
	private static var lime_window_get_width = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_window_get_width", "oi", false));
	private static var lime_window_get_x = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_window_get_x", "oi", false));
	private static var lime_window_get_y = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_window_get_y", "oi", false));
	private static var lime_window_move = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_move", "oiiv", false));
	private static var lime_window_read_pixels = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_window_read_pixels", "oooo", false));
	private static var lime_window_resize = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_resize", "oiiv",
		false));
	private static var lime_window_set_minimum_size = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_set_minimum_size", "oiiv",
		false));
	private static var lime_window_set_maximum_size = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_set_maximum_size", "oiiv",
		false));
	private static var lime_window_set_borderless = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_borderless", "obb",
		false));
	private static var lime_window_set_cursor = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_set_cursor", "oiv",
		false));
	private static var lime_window_set_display_mode = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_window_set_display_mode", "ooo", false));
	private static var lime_window_set_fullscreen = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_fullscreen", "obb",
		false));
	private static var lime_window_set_icon = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_set_icon", "oov",
		false));
	private static var lime_window_set_maximized = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_maximized", "obb",
		false));
	private static var lime_window_set_minimized = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_minimized", "obb",
		false));
	private static var lime_window_set_mouse_lock = new cpp.Callable<cpp.Object->Bool->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_set_mouse_lock",
		"obv", false));
	private static var lime_window_set_opacity = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_window_set_opacity", "odv",
		false));
	private static var lime_window_set_resizable = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_resizable", "obb",
		false));
	private static var lime_window_set_text_input_enabled = new cpp.Callable<cpp.Object->Bool->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_window_set_text_input_enabled", "obv", false));
	private static var lime_window_set_text_input_rect = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_window_set_text_input_rect", "oov", false));
	private static var lime_window_set_title = new cpp.Callable<cpp.Object->String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_window_set_title", "oso",
		false));
	private static var lime_window_set_visible = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_visible", "obb",
		false));
	private static var lime_window_set_vsync = new cpp.Callable<cpp.Object->Bool->Bool>(cpp.Prime._loadPrime("lime", "lime_window_set_vsync", "obb",
		false));
	private static var lime_window_warp_mouse = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_window_warp_mouse",
		"oiiv", false));
	private static var lime_window_event_manager_register = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_window_event_manager_register", "oov", false));
	private static var lime_zlib_compress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_zlib_compress", "ooo",
		false));
	private static var lime_zlib_decompress = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_zlib_decompress", "ooo",
		false));
	#end
	#end

	#if (lime_cffi && !macro && lime_openal)
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_al_buffer_data(buffer:CFFIPointer, format:Int, data:Dynamic, size:Int, freq:Int):Void;

	@:cffi private static function lime_al_buffer3f(buffer:CFFIPointer, param:Int, value1:Float32, value2:Float32, value3:Float32):Void;

	@:cffi private static function lime_al_buffer3i(buffer:CFFIPointer, param:Int, value1:Int, value2:Int, value3:Int):Void;

	@:cffi private static function lime_al_bufferf(buffer:CFFIPointer, param:Int, value:Float32):Void;

	@:cffi private static function lime_al_bufferfv(buffer:CFFIPointer, param:Int, values:Dynamic):Void;

	@:cffi private static function lime_al_bufferi(buffer:CFFIPointer, param:Int, value:Int):Void;

	@:cffi private static function lime_al_bufferiv(buffer:CFFIPointer, param:Int, values:Dynamic):Void;

	@:cffi private static function lime_al_cleanup():Void;

	@:cffi private static function lime_al_delete_buffer(buffer:CFFIPointer):Void;

	@:cffi private static function lime_al_delete_buffers(n:Int, buffers:Dynamic):Void;

	@:cffi private static function lime_al_delete_source(source:CFFIPointer):Void;

	@:cffi private static function lime_al_delete_sources(n:Int, sources:Dynamic):Void;

	@:cffi private static function lime_al_disable(capability:Int):Void;

	@:cffi private static function lime_al_distance_model(distanceModel:Int):Void;

	@:cffi private static function lime_al_doppler_factor(value:Float32):Void;

	@:cffi private static function lime_al_doppler_velocity(value:Float32):Void;

	@:cffi private static function lime_al_enable(capability:Int):Void;

	@:cffi private static function lime_al_gen_source():CFFIPointer;

	@:cffi private static function lime_al_gen_sources(n:Int):Array<CFFIPointer>;

	@:cffi private static function lime_al_get_boolean(param:Int):Bool;

	@:cffi private static function lime_al_get_booleanv(param:Int, count:Int):Array<Bool>;

	@:cffi private static function lime_al_gen_buffer():CFFIPointer;

	@:cffi private static function lime_al_gen_buffers(n:Int):Array<CFFIPointer>;

	@:cffi private static function lime_al_get_buffer3f(buffer:CFFIPointer, param:Int):Array<Float>;

	@:cffi private static function lime_al_get_buffer3i(buffer:CFFIPointer, param:Int):Array<Int>;

	@:cffi private static function lime_al_get_bufferf(buffer:CFFIPointer, param:Int):Float32;

	@:cffi private static function lime_al_get_bufferfv(buffer:CFFIPointer, param:Int, count:Int):Array<Float>;

	@:cffi private static function lime_al_get_bufferi(buffer:CFFIPointer, param:Int):Int;

	@:cffi private static function lime_al_get_bufferiv(buffer:CFFIPointer, param:Int, count:Int):Array<Int>;

	@:cffi private static function lime_al_get_double(param:Int):Float;

	@:cffi private static function lime_al_get_doublev(param:Int, count:Int):Array<Float>;

	@:cffi private static function lime_al_get_enum_value(ename:String):Int;

	@:cffi private static function lime_al_get_error():Int;

	@:cffi private static function lime_al_get_float(param:Int):Float32;

	@:cffi private static function lime_al_get_floatv(param:Int, count:Int):Array<Float>;

	@:cffi private static function lime_al_get_integer(param:Int):Int;

	@:cffi private static function lime_al_get_integerv(param:Int, count:Int):Array<Int>;

	@:cffi private static function lime_al_get_listener3f(param:Int):Array<Float>;

	@:cffi private static function lime_al_get_listener3i(param:Int):Array<Int>;

	@:cffi private static function lime_al_get_listenerf(param:Int):Float32;

	@:cffi private static function lime_al_get_listenerfv(param:Int, count:Int):Array<Float>;

	@:cffi private static function lime_al_get_listeneri(param:Int):Int;

	@:cffi private static function lime_al_get_listeneriv(param:Int, count:Int):Array<Int>;

	@:cffi private static function lime_al_get_proc_address(fname:String):Float;

	@:cffi private static function lime_al_get_source3f(source:CFFIPointer, param:Int):Array<Float>;

	@:cffi private static function lime_al_get_source3i(source:CFFIPointer, param:Int):Array<Int>;

	@:cffi private static function lime_al_get_sourcef(source:CFFIPointer, param:Int):Float32;

	@:cffi private static function lime_al_get_sourcefv(source:CFFIPointer, param:Int, count:Int):Array<Float>;

	@:cffi private static function lime_al_get_sourcei(source:CFFIPointer, param:Int):Dynamic;

	@:cffi private static function lime_al_get_sourceiv(source:CFFIPointer, param:Int, count:Int):Array<Int>;

	@:cffi private static function lime_al_get_string(param:Int):Dynamic;

	@:cffi private static function lime_al_is_buffer(buffer:CFFIPointer):Bool;

	@:cffi private static function lime_al_is_enabled(capability:Int):Bool;

	@:cffi private static function lime_al_is_extension_present(extname:String):Bool;

	@:cffi private static function lime_al_is_source(source:CFFIPointer):Bool;

	@:cffi private static function lime_al_listener3f(param:Int, value1:Float32, value2:Float32, value3:Float32):Void;

	@:cffi private static function lime_al_listener3i(param:Int, value1:Int, value2:Int, value3:Int):Void;

	@:cffi private static function lime_al_listenerf(param:Int, value1:Float32):Void;

	@:cffi private static function lime_al_listenerfv(param:Int, values:Dynamic):Void;

	@:cffi private static function lime_al_listeneri(param:Int, value1:Int):Void;

	@:cffi private static function lime_al_listeneriv(param:Int, values:Dynamic):Void;

	@:cffi private static function lime_al_source_pause(source:CFFIPointer):Void;

	@:cffi private static function lime_al_source_pausev(n:Int, sources:Dynamic):Void;

	@:cffi private static function lime_al_source_play(source:CFFIPointer):Void;

	@:cffi private static function lime_al_source_playv(n:Int, sources:Dynamic):Void;

	@:cffi private static function lime_al_source_queue_buffers(source:CFFIPointer, nb:Int, buffers:Dynamic):Void;

	@:cffi private static function lime_al_source_rewind(source:CFFIPointer):Void;

	@:cffi private static function lime_al_source_rewindv(n:Int, sources:Dynamic):Void;

	@:cffi private static function lime_al_source_stop(source:CFFIPointer):Void;

	@:cffi private static function lime_al_source_stopv(n:Int, sources:Dynamic):Void;

	@:cffi private static function lime_al_source_unqueue_buffers(source:CFFIPointer, nb:Int):Dynamic;

	@:cffi private static function lime_al_source3f(source:CFFIPointer, param:Int, value1:Float32, value2:Float32, value3:Float32):Void;

	@:cffi private static function lime_al_source3i(source:CFFIPointer, param:Int, value1:Dynamic, value2:Int, value3:Int):Void;

	@:cffi private static function lime_al_sourcef(source:CFFIPointer, param:Int, value:Float32):Void;

	@:cffi private static function lime_al_sourcefv(source:CFFIPointer, param:Int, values:Dynamic):Void;

	@:cffi private static function lime_al_sourcei(source:CFFIPointer, param:Int, value:Dynamic):Void;

	@:cffi private static function lime_al_sourceiv(source:CFFIPointer, param:Int, values:Dynamic):Void;

	@:cffi private static function lime_al_speed_of_sound(speed:Float32):Void;

	@:cffi private static function lime_alc_close_device(device:CFFIPointer):Bool;

	@:cffi private static function lime_alc_create_context(device:CFFIPointer, attrlist:Dynamic):CFFIPointer;

	@:cffi private static function lime_alc_destroy_context(context:CFFIPointer):Void;

	@:cffi private static function lime_alc_get_contexts_device(context:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_alc_get_current_context():CFFIPointer;

	@:cffi private static function lime_alc_get_error(device:CFFIPointer):Int;

	@:cffi private static function lime_alc_get_integerv(device:CFFIPointer, param:Int, size:Int):Dynamic;

	@:cffi private static function lime_alc_get_string(device:CFFIPointer, param:Int):Dynamic;

	@:cffi private static function lime_alc_make_context_current(context:CFFIPointer):Bool;

	@:cffi private static function lime_alc_open_device(devicename:String):CFFIPointer;

	@:cffi private static function lime_alc_reopen_device_soft(device:CFFIPointer, newdevicename:String, attributes:Array<Int>):Bool;

	@:cffi private static function lime_alc_pause_device(device:CFFIPointer):Void;

	@:cffi private static function lime_alc_process_context(context:CFFIPointer):Void;

	@:cffi private static function lime_alc_resume_device(device:CFFIPointer):Void;

	@:cffi private static function lime_alc_suspend_context(context:CFFIPointer):Void;

	@:cffi private static function lime_alc_event_control_soft(count:Int, events:Array<Int>, enable:Bool):Void;

	@:cffi private static function lime_alc_event_callback_soft(device:CFFIPointer, callback:Dynamic):Void;

	@:cffi private static function lime_al_gen_filter():CFFIPointer;

	@:cffi private static function lime_al_filteri(filter:CFFIPointer, param:Int, value:Dynamic):Void;

	@:cffi private static function lime_al_filterf(filter:CFFIPointer, param:Int, value:Float32):Void;

	@:cffi private static function lime_al_remove_direct_filter(source:CFFIPointer):Void;

	@:cffi private static function lime_al_is_filter(filter:CFFIPointer):Bool;

	@:cffi private static function lime_al_get_filteri(filter:CFFIPointer, param:Int):Int;

	@:cffi private static function lime_al_gen_effect():CFFIPointer;

	@:cffi private static function lime_al_effectf(effect:CFFIPointer, param:Int, value:Float32):Void;

	@:cffi private static function lime_al_effectfv(effect:CFFIPointer, param:Int, values:Array<Float>):Void;

	@:cffi private static function lime_al_effecti(effect:CFFIPointer, param:Int, value:Int):Void;

	@:cffi private static function lime_al_effectiv(effect:CFFIPointer, param:Int, values:Array<Int>):Void;

	@:cffi private static function lime_al_is_effect(effect:CFFIPointer):Bool;

	@:cffi private static function lime_al_gen_aux():CFFIPointer;

	@:cffi private static function lime_al_auxf(aux:CFFIPointer, param:Int, value:Float32):Void;

	@:cffi private static function lime_al_auxfv(aux:CFFIPointer, param:Int, values:Array<Float>):Void;

	@:cffi private static function lime_al_auxi(aux:CFFIPointer, param:Int, value:Dynamic):Void;

	@:cffi private static function lime_al_auxiv(aux:CFFIPointer, param:Int, values:Array<Int>):Void;

	@:cffi private static function lime_al_is_aux(aux:CFFIPointer):Bool;

	@:cffi private static function lime_al_remove_send(source:CFFIPointer, index:Int):Void;
	#else
	private static var lime_al_buffer_data = new cpp.Callable<cpp.Object->Int->cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_al_buffer_data", "oioiiv", false));
	private static var lime_al_buffer3f = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_al_buffer3f", "oifffv", false));
	private static var lime_al_buffer3i = new cpp.Callable<cpp.Object->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_buffer3i",
		"oiiiiv", false));
	private static var lime_al_bufferf = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_bufferf", "oifv",
		false));
	private static var lime_al_bufferfv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_bufferfv", "oiov",
		false));
	private static var lime_al_bufferi = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_bufferi", "oiiv", false));
	private static var lime_al_bufferiv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_bufferiv", "oiov",
		false));
	private static var lime_al_cleanup = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_cleanup", "v", false));
	private static var lime_al_delete_buffer = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_delete_buffer", "ov", false));
	private static var lime_al_delete_buffers = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_delete_buffers", "iov",
		false));
	private static var lime_al_delete_source = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_delete_source", "ov", false));
	private static var lime_al_delete_sources = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_delete_sources", "iov",
		false));
	private static var lime_al_disable = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_disable", "iv", false));
	private static var lime_al_distance_model = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_distance_model", "iv", false));
	private static var lime_al_doppler_factor = new cpp.Callable<cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_doppler_factor", "fv", false));
	private static var lime_al_doppler_velocity = new cpp.Callable<cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_doppler_velocity", "fv",
		false));
	private static var lime_al_enable = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_enable", "iv", false));
	private static var lime_al_gen_source = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_source", "o", false));
	private static var lime_al_gen_sources = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_sources", "io", false));
	private static var lime_al_get_boolean = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_al_get_boolean", "ib", false));
	private static var lime_al_get_booleanv = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_booleanv", "iio", false));
	private static var lime_al_gen_buffer = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_buffer", "o", false));
	private static var lime_al_gen_buffers = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_buffers", "io", false));
	private static var lime_al_get_buffer3f = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_buffer3f", "oio",
		false));
	private static var lime_al_get_buffer3i = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_buffer3i", "oio",
		false));
	private static var lime_al_get_bufferf = new cpp.Callable<cpp.Object->Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_al_get_bufferf", "oif", false));
	private static var lime_al_get_bufferfv = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_bufferfv", "oiio",
		false));
	private static var lime_al_get_bufferi = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_al_get_bufferi", "oii", false));
	private static var lime_al_get_bufferiv = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_bufferiv", "oiio",
		false));
	private static var lime_al_get_double = new cpp.Callable<Int->Float>(cpp.Prime._loadPrime("lime", "lime_al_get_double", "id", false));
	private static var lime_al_get_doublev = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_doublev", "iio", false));
	private static var lime_al_get_enum_value = new cpp.Callable<String->Int>(cpp.Prime._loadPrime("lime", "lime_al_get_enum_value", "si", false));
	private static var lime_al_get_error = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_al_get_error", "i", false));
	private static var lime_al_get_float = new cpp.Callable<Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_al_get_float", "if", false));
	private static var lime_al_get_floatv = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_floatv", "iio", false));
	private static var lime_al_get_integer = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_al_get_integer", "ii", false));
	private static var lime_al_get_integerv = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_integerv", "iio", false));
	private static var lime_al_get_listener3f = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_listener3f", "io", false));
	private static var lime_al_get_listener3i = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_listener3i", "io", false));
	private static var lime_al_get_listenerf = new cpp.Callable<Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_al_get_listenerf", "if", false));
	private static var lime_al_get_listenerfv = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_listenerfv", "iio", false));
	private static var lime_al_get_listeneri = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_al_get_listeneri", "ii", false));
	private static var lime_al_get_listeneriv = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_listeneriv", "iio", false));
	private static var lime_al_get_proc_address = new cpp.Callable<String->Float>(cpp.Prime._loadPrime("lime", "lime_al_get_proc_address", "sd", false));
	private static var lime_al_get_source3f = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_source3f", "oio",
		false));
	private static var lime_al_get_source3i = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_source3i", "oio",
		false));
	private static var lime_al_get_sourcef = new cpp.Callable<cpp.Object->Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_al_get_sourcef", "oif", false));
	private static var lime_al_get_sourcefv = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_sourcefv", "oiio",
		false));
	private static var lime_al_get_sourcei = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_sourcei", "oio", false));
	private static var lime_al_get_sourceiv = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_sourceiv", "oiio",
		false));
	private static var lime_al_get_string = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_get_string", "io", false));
	private static var lime_al_is_buffer = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_buffer", "ob", false));
	private static var lime_al_is_enabled = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_enabled", "ib", false));
	private static var lime_al_is_extension_present = new cpp.Callable<String->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_extension_present", "sb",
		false));
	private static var lime_al_is_source = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_source", "ob", false));
	private static var lime_al_listener3f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_al_listener3f", "ifffv", false));
	private static var lime_al_listener3i = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_listener3i", "iiiiv", false));
	private static var lime_al_listenerf = new cpp.Callable<Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_listenerf", "ifv", false));
	private static var lime_al_listenerfv = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_listenerfv", "iov", false));
	private static var lime_al_listeneri = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_listeneri", "iiv", false));
	private static var lime_al_listeneriv = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_listeneriv", "iov", false));
	private static var lime_al_source_pause = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_pause", "ov", false));
	private static var lime_al_source_pausev = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_pausev", "iov",
		false));
	private static var lime_al_source_play = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_play", "ov", false));
	private static var lime_al_source_playv = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_playv", "iov", false));
	private static var lime_al_source_queue_buffers = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_al_source_queue_buffers", "oiov", false));
	private static var lime_al_source_rewind = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_rewind", "ov", false));
	private static var lime_al_source_rewindv = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_rewindv", "iov",
		false));
	private static var lime_al_source_stop = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_stop", "ov", false));
	private static var lime_al_source_stopv = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source_stopv", "iov", false));
	private static var lime_al_source_unqueue_buffers = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_al_source_unqueue_buffers", "oio", false));
	private static var lime_al_source3f = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_al_source3f", "oifffv", false));
	private static var lime_al_source3i = new cpp.Callable<cpp.Object->Int->cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_source3i",
		"oioiiv", false));
	private static var lime_al_sourcef = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_sourcef", "oifv",
		false));
	private static var lime_al_sourcefv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_sourcefv", "oiov",
		false));
	private static var lime_al_sourcei = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_sourcei", "oiov",
		false));
	private static var lime_al_sourceiv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_sourceiv", "oiov",
		false));
	private static var lime_al_speed_of_sound = new cpp.Callable<cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_speed_of_sound", "fv", false));
	private static var lime_alc_close_device = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_alc_close_device", "ob", false));
	private static var lime_alc_create_context = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_alc_create_context",
		"ooo", false));
	private static var lime_alc_destroy_context = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_destroy_context", "ov",
		false));
	private static var lime_alc_get_contexts_device = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_alc_get_contexts_device",
		"oo", false));
	private static var lime_alc_get_current_context = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_alc_get_current_context", "o",
		false));
	private static var lime_alc_get_error = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_alc_get_error", "oi", false));
	private static var lime_alc_get_integerv = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_alc_get_integerv",
		"oiio", false));
	private static var lime_alc_get_string = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_alc_get_string", "oio", false));
	private static var lime_alc_make_context_current = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_alc_make_context_current", "ob",
		false));
	private static var lime_alc_open_device = new cpp.Callable<String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_alc_open_device", "so", false));
	private static var lime_alc_pause_device = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_pause_device", "ov", false));
	private static var lime_alc_process_context = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_process_context", "ov",
		false));
	private static var lime_alc_resume_device = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_resume_device", "ov", false));
	private static var lime_alc_suspend_context = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_suspend_context", "ov",
		false));
	private static var lime_alc_event_control_soft = new cpp.Callable<Int->cpp.Object->Bool->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_event_control_soft",
		"iobv", false));
	private static var lime_alc_event_callback_soft = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_alc_event_callback_soft",
		"oov", false));
	private static var lime_alc_reopen_device_soft = new cpp.Callable<cpp.Object->String->cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_alc_reopen_device_soft",
		"osob", false));
	private static var lime_al_gen_filter = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_filter", "o", false));
	private static var lime_al_filteri = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_filteri", "oiov",
		false));
	private static var lime_al_filterf = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_filterf", "oifv",
		false));
	private static var lime_al_remove_direct_filter = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_remove_direct_filter",
		"ov", false));
	private static var lime_al_is_filter = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_filter", "ob", false));
	private static var lime_al_get_filteri = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_al_get_filteri", "oii", false));
	private static var lime_al_gen_effect = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_effect", "o", false));
	private static var lime_al_effectf = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_effectf", "oifv",
		false));
	private static var lime_al_effectfv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_effectfv", "oiov",
		false));
	private static var lime_al_effecti = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_effecti", "oiiv", false));
	private static var lime_al_effectiv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_effectiv", "oiov",
		false));
	private static var lime_al_is_effect = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_effect", "ob", false));
	private static var lime_al_gen_aux = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_al_gen_aux", "o", false));
	private static var lime_al_auxf = new cpp.Callable<cpp.Object->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_auxf", "oifv", false));
	private static var lime_al_auxfv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_auxfv", "oiov", false));
	private static var lime_al_auxi = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_auxi", "oiov", false));
	private static var lime_al_auxiv = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_auxiv", "oiov", false));
	private static var lime_al_is_aux = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_al_is_aux", "ob", false));
	private static var lime_al_remove_send = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_al_remove_send", "oiv", false));
	#end
	#end

	#if (lime_cffi && !macro && lime_cairo)
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_cairo_arc(handle:CFFIPointer, xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float):Void;

	@:cffi private static function lime_cairo_arc_negative(handle:CFFIPointer, xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float):Void;

	@:cffi private static function lime_cairo_clip(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_clip_preserve(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_clip_extents(handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void;

	@:cffi private static function lime_cairo_close_path(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_copy_page(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_create(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_curve_to(handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float):Void;

	@:cffi private static function lime_cairo_fill(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_fill_extents(handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void;

	@:cffi private static function lime_cairo_fill_preserve(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_get_antialias(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_get_current_point(handle:CFFIPointer):Dynamic;

	@:cffi private static function lime_cairo_get_dash(handle:CFFIPointer):Dynamic;

	@:cffi private static function lime_cairo_get_dash_count(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_get_fill_rule(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_get_font_face(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_get_font_options(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_get_group_target(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_get_line_cap(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_get_line_join(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_get_line_width(handle:CFFIPointer):Float;

	@:cffi private static function lime_cairo_get_matrix(handle:CFFIPointer):Dynamic;

	@:cffi private static function lime_cairo_get_miter_limit(handle:CFFIPointer):Float;

	@:cffi private static function lime_cairo_get_operator(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_get_source(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_get_target(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_get_tolerance(handle:CFFIPointer):Float;

	@:cffi private static function lime_cairo_has_current_point(handle:CFFIPointer):Bool;

	@:cffi private static function lime_cairo_identity_matrix(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_in_clip(handle:CFFIPointer, x:Float, y:Float):Bool;

	@:cffi private static function lime_cairo_in_fill(handle:CFFIPointer, x:Float, y:Float):Bool;

	@:cffi private static function lime_cairo_in_stroke(handle:CFFIPointer, x:Float, y:Float):Bool;

	@:cffi private static function lime_cairo_line_to(handle:CFFIPointer, x:Float, y:Float):Void;

	@:cffi private static function lime_cairo_mask(handle:CFFIPointer, pattern:CFFIPointer):Void;

	@:cffi private static function lime_cairo_mask_surface(handle:CFFIPointer, surface:CFFIPointer, x:Float, y:Float):Void;

	@:cffi private static function lime_cairo_move_to(handle:CFFIPointer, x:Float, y:Float):Void;

	@:cffi private static function lime_cairo_new_path(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_paint(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_paint_with_alpha(handle:CFFIPointer, alpha:Float):Void;

	@:cffi private static function lime_cairo_pop_group(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_pop_group_to_source(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_push_group(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_push_group_with_content(handle:CFFIPointer, content:Int):Void;

	@:cffi private static function lime_cairo_rectangle(handle:CFFIPointer, x:Float, y:Float, width:Float, height:Float):Void;

	@:cffi private static function lime_cairo_rel_curve_to(handle:CFFIPointer, dx1:Float, dy1:Float, dx2:Float, dy2:Float, dx3:Float, dy3:Float):Void;

	@:cffi private static function lime_cairo_rel_line_to(handle:CFFIPointer, dx:Float, dy:Float):Void;

	@:cffi private static function lime_cairo_rel_move_to(handle:CFFIPointer, dx:Float, dy:Float):Void;

	@:cffi private static function lime_cairo_reset_clip(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_restore(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_rotate(handle:CFFIPointer, amount:Float):Void;

	@:cffi private static function lime_cairo_save(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_scale(handle:CFFIPointer, x:Float, y:Float):Void;

	@:cffi private static function lime_cairo_set_antialias(handle:CFFIPointer, cap:Int):Void;

	@:cffi private static function lime_cairo_set_dash(handle:CFFIPointer, dash:Dynamic):Void;

	@:cffi private static function lime_cairo_set_fill_rule(handle:CFFIPointer, cap:Int):Void;

	@:cffi private static function lime_cairo_set_font_face(handle:CFFIPointer, face:CFFIPointer):Void;

	@:cffi private static function lime_cairo_set_font_options(handle:CFFIPointer, options:CFFIPointer):Void;

	@:cffi private static function lime_cairo_set_font_size(handle:CFFIPointer, size:Float):Void;

	@:cffi private static function lime_cairo_set_line_cap(handle:CFFIPointer, cap:Int):Void;

	@:cffi private static function lime_cairo_set_line_join(handle:CFFIPointer, join:Int):Void;

	@:cffi private static function lime_cairo_set_line_width(handle:CFFIPointer, width:Float):Void;

	@:cffi private static function lime_cairo_set_matrix(handle:CFFIPointer, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;

	// @:cffi private static function lime_cairo_set_matrix (handle:CFFIPointer, matrix:Dynamic):Void;
	@:cffi private static function lime_cairo_set_miter_limit(handle:CFFIPointer, miterLimit:Float):Void;

	@:cffi private static function lime_cairo_set_operator(handle:CFFIPointer, op:Int):Void;

	@:cffi private static function lime_cairo_set_source(handle:CFFIPointer, pattern:CFFIPointer):Void;

	@:cffi private static function lime_cairo_set_source_rgb(handle:CFFIPointer, r:Float, g:Float, b:Float):Void;

	@:cffi private static function lime_cairo_set_source_rgba(handle:CFFIPointer, r:Float, g:Float, b:Float, a:Float):Void;

	@:cffi private static function lime_cairo_set_source_surface(handle:CFFIPointer, surface:CFFIPointer, x:Float, y:Float):Void;

	@:cffi private static function lime_cairo_set_tolerance(handle:CFFIPointer, tolerance:Float):Void;

	@:cffi private static function lime_cairo_show_glyphs(handle:CFFIPointer, glyphs:Dynamic):Void;

	@:cffi private static function lime_cairo_show_page(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_show_text(handle:CFFIPointer, text:String):Void;

	@:cffi private static function lime_cairo_status(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_stroke(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_stroke_extents(handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void;

	@:cffi private static function lime_cairo_stroke_preserve(handle:CFFIPointer):Void;

	@:cffi private static function lime_cairo_text_path(handle:CFFIPointer, text:String):Void;

	@:cffi private static function lime_cairo_transform(handle:CFFIPointer, matrix:Dynamic):Void;

	@:cffi private static function lime_cairo_translate(handle:CFFIPointer, x:Float, y:Float):Void;

	@:cffi private static function lime_cairo_version():Int;

	@:cffi private static function lime_cairo_version_string():String;

	@:cffi private static function lime_cairo_font_face_status(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_font_options_create():CFFIPointer;

	@:cffi private static function lime_cairo_font_options_get_antialias(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_font_options_get_hint_metrics(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_font_options_get_hint_style(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_font_options_get_subpixel_order(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_font_options_set_antialias(handle:CFFIPointer, v:Int):Void;

	@:cffi private static function lime_cairo_font_options_set_hint_metrics(handle:CFFIPointer, v:Int):Void;

	@:cffi private static function lime_cairo_font_options_set_hint_style(handle:CFFIPointer, v:Int):Void;

	@:cffi private static function lime_cairo_font_options_set_subpixel_order(handle:CFFIPointer, v:Int):Void;

	@:cffi private static function lime_cairo_ft_font_face_create(face:CFFIPointer, flags:Int):CFFIPointer;

	@:cffi private static function lime_cairo_image_surface_create(format:Int, width:Int, height:Int):CFFIPointer;

	@:cffi private static function lime_cairo_image_surface_create_for_data(data:DataPointer, format:Int, width:Int, height:Int, stride:Int):CFFIPointer;

	@:cffi private static function lime_cairo_image_surface_get_data(handle:CFFIPointer):DataPointer;

	@:cffi private static function lime_cairo_image_surface_get_format(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_image_surface_get_height(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_image_surface_get_stride(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_image_surface_get_width(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_pattern_add_color_stop_rgb(handle:CFFIPointer, offset:Float, red:Float, green:Float, blue:Float):Void;

	@:cffi private static function lime_cairo_pattern_add_color_stop_rgba(handle:CFFIPointer, offset:Float, red:Float, green:Float, blue:Float,
		alpha:Float):Void;

	@:cffi private static function lime_cairo_pattern_create_for_surface(surface:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_cairo_pattern_create_linear(x0:Float, y0:Float, x1:Float, y1:Float):CFFIPointer;

	@:cffi private static function lime_cairo_pattern_create_radial(cx0:Float, cy0:Float, radius0:Float, cx1:Float, cy1:Float, radius1:Float):CFFIPointer;

	@:cffi private static function lime_cairo_pattern_create_rgb(r:Float, g:Float, b:Float):CFFIPointer;

	@:cffi private static function lime_cairo_pattern_create_rgba(r:Float, g:Float, b:Float, a:Float):CFFIPointer;

	@:cffi private static function lime_cairo_pattern_get_color_stop_count(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_pattern_get_extend(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_pattern_get_filter(handle:CFFIPointer):Int;

	@:cffi private static function lime_cairo_pattern_get_matrix(handle:CFFIPointer):Dynamic;

	@:cffi private static function lime_cairo_pattern_set_extend(handle:CFFIPointer, extend:Int):Void;

	@:cffi private static function lime_cairo_pattern_set_filter(handle:CFFIPointer, filter:Int):Void;

	@:cffi private static function lime_cairo_pattern_set_matrix(handle:CFFIPointer, matrix:Dynamic):Void;

	@:cffi private static function lime_cairo_surface_flush(surface:CFFIPointer):Void;
	#else
	private static var lime_cairo_arc = new cpp.Callable<cpp.Object->Float->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_arc", "odddddv", false));
	private static var lime_cairo_arc_negative = new cpp.Callable<cpp.Object->Float->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_arc_negative", "odddddv", false));
	private static var lime_cairo_clip = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_clip", "ov", false));
	private static var lime_cairo_clip_preserve = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_clip_preserve", "ov",
		false));
	private static var lime_cairo_clip_extents = new cpp.Callable<cpp.Object->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_clip_extents", "oddddv", false));
	private static var lime_cairo_close_path = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_close_path", "ov", false));
	private static var lime_cairo_copy_page = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_copy_page", "ov", false));
	private static var lime_cairo_create = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_create", "oo", false));
	private static var lime_cairo_curve_to = new cpp.Callable<cpp.Object->Float->Float->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_curve_to", "oddddddv", false));
	private static var lime_cairo_fill = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_fill", "ov", false));
	private static var lime_cairo_fill_extents = new cpp.Callable<cpp.Object->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_fill_extents", "oddddv", false));
	private static var lime_cairo_fill_preserve = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_fill_preserve", "ov",
		false));
	private static var lime_cairo_get_antialias = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_get_antialias", "oi", false));
	private static var lime_cairo_get_current_point = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_current_point",
		"oo", false));
	private static var lime_cairo_get_dash = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_dash", "oo", false));
	private static var lime_cairo_get_dash_count = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_get_dash_count", "oi", false));
	private static var lime_cairo_get_fill_rule = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_get_fill_rule", "oi", false));
	private static var lime_cairo_get_font_face = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_font_face", "oo",
		false));
	private static var lime_cairo_get_font_options = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_font_options",
		"oo", false));
	private static var lime_cairo_get_group_target = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_group_target",
		"oo", false));
	private static var lime_cairo_get_line_cap = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_get_line_cap", "oi", false));
	private static var lime_cairo_get_line_join = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_get_line_join", "oi", false));
	private static var lime_cairo_get_line_width = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_cairo_get_line_width", "od", false));
	private static var lime_cairo_get_matrix = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_matrix", "oo", false));
	private static var lime_cairo_get_miter_limit = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_cairo_get_miter_limit", "od",
		false));
	private static var lime_cairo_get_operator = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_get_operator", "oi", false));
	private static var lime_cairo_get_source = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_source", "oo", false));
	private static var lime_cairo_get_target = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_get_target", "oo", false));
	private static var lime_cairo_get_tolerance = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_cairo_get_tolerance", "od", false));
	private static var lime_cairo_has_current_point = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_cairo_has_current_point", "ob",
		false));
	private static var lime_cairo_identity_matrix = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_identity_matrix", "ov",
		false));
	private static var lime_cairo_in_clip = new cpp.Callable<cpp.Object->Float->Float->Bool>(cpp.Prime._loadPrime("lime", "lime_cairo_in_clip", "oddb",
		false));
	private static var lime_cairo_in_fill = new cpp.Callable<cpp.Object->Float->Float->Bool>(cpp.Prime._loadPrime("lime", "lime_cairo_in_fill", "oddb",
		false));
	private static var lime_cairo_in_stroke = new cpp.Callable<cpp.Object->Float->Float->Bool>(cpp.Prime._loadPrime("lime", "lime_cairo_in_stroke", "oddb",
		false));
	private static var lime_cairo_line_to = new cpp.Callable<cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_line_to", "oddv",
		false));
	private static var lime_cairo_mask = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_mask", "oov", false));
	private static var lime_cairo_mask_surface = new cpp.Callable<cpp.Object->cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_mask_surface", "ooddv", false));
	private static var lime_cairo_move_to = new cpp.Callable<cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_move_to", "oddv",
		false));
	private static var lime_cairo_new_path = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_new_path", "ov", false));
	private static var lime_cairo_paint = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_paint", "ov", false));
	private static var lime_cairo_paint_with_alpha = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_paint_with_alpha",
		"odv", false));
	private static var lime_cairo_pop_group = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_pop_group", "oo", false));
	private static var lime_cairo_pop_group_to_source = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_pop_group_to_source",
		"ov", false));
	private static var lime_cairo_push_group = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_push_group", "ov", false));
	private static var lime_cairo_push_group_with_content = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_push_group_with_content", "oiv", false));
	private static var lime_cairo_rectangle = new cpp.Callable<cpp.Object->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_rectangle", "oddddv", false));
	private static var lime_cairo_rel_curve_to = new cpp.Callable<cpp.Object->Float->Float->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_rel_curve_to", "oddddddv", false));
	private static var lime_cairo_rel_line_to = new cpp.Callable<cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_rel_line_to",
		"oddv", false));
	private static var lime_cairo_rel_move_to = new cpp.Callable<cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_rel_move_to",
		"oddv", false));
	private static var lime_cairo_reset_clip = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_reset_clip", "ov", false));
	private static var lime_cairo_restore = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_restore", "ov", false));
	private static var lime_cairo_rotate = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_rotate", "odv", false));
	private static var lime_cairo_save = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_save", "ov", false));
	private static var lime_cairo_scale = new cpp.Callable<cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_scale", "oddv",
		false));
	private static var lime_cairo_set_antialias = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_antialias", "oiv",
		false));
	private static var lime_cairo_set_dash = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_dash", "oov",
		false));
	private static var lime_cairo_set_fill_rule = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_fill_rule", "oiv",
		false));
	private static var lime_cairo_set_font_face = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_font_face",
		"oov", false));
	private static var lime_cairo_set_font_options = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_set_font_options", "oov", false));
	private static var lime_cairo_set_font_size = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_font_size",
		"odv", false));
	private static var lime_cairo_set_line_cap = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_line_cap", "oiv",
		false));
	private static var lime_cairo_set_line_join = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_line_join", "oiv",
		false));
	private static var lime_cairo_set_line_width = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_line_width",
		"odv", false));
	private static var lime_cairo_set_matrix = new cpp.Callable<cpp.Object->Float->Float->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_set_matrix", "oddddddv", false));
	private static var lime_cairo_set_miter_limit = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_miter_limit",
		"odv", false));
	private static var lime_cairo_set_operator = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_operator", "oiv",
		false));
	private static var lime_cairo_set_source = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_source", "oov",
		false));
	private static var lime_cairo_set_source_rgb = new cpp.Callable<cpp.Object->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_set_source_rgb", "odddv", false));
	private static var lime_cairo_set_source_rgba = new cpp.Callable<cpp.Object->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_set_source_rgba", "oddddv", false));
	private static var lime_cairo_set_source_surface = new cpp.Callable<cpp.Object->cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_set_source_surface", "ooddv", false));
	private static var lime_cairo_set_tolerance = new cpp.Callable<cpp.Object->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_set_tolerance",
		"odv", false));
	private static var lime_cairo_show_glyphs = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_show_glyphs",
		"oov", false));
	private static var lime_cairo_show_page = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_show_page", "ov", false));
	private static var lime_cairo_show_text = new cpp.Callable<cpp.Object->String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_show_text", "osv",
		false));
	private static var lime_cairo_status = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_status", "oi", false));
	private static var lime_cairo_stroke = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_stroke", "ov", false));
	private static var lime_cairo_stroke_extents = new cpp.Callable<cpp.Object->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_stroke_extents", "oddddv", false));
	private static var lime_cairo_stroke_preserve = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_stroke_preserve", "ov",
		false));
	private static var lime_cairo_text_path = new cpp.Callable<cpp.Object->String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_text_path", "osv",
		false));
	private static var lime_cairo_transform = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_transform", "oov",
		false));
	private static var lime_cairo_translate = new cpp.Callable<cpp.Object->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_translate",
		"oddv", false));
	private static var lime_cairo_version = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_version", "i", false));
	private static var lime_cairo_version_string = new cpp.Callable<Void->String>(cpp.Prime._loadPrime("lime", "lime_cairo_version_string", "s", false));
	private static var lime_cairo_font_face_status = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_font_face_status", "oi",
		false));
	private static var lime_cairo_font_options_create = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_font_options_create", "o",
		false));
	private static var lime_cairo_font_options_get_antialias = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_get_antialias", "oi", false));
	private static var lime_cairo_font_options_get_hint_metrics = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_get_hint_metrics", "oi", false));
	private static var lime_cairo_font_options_get_hint_style = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_get_hint_style", "oi", false));
	private static var lime_cairo_font_options_get_subpixel_order = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_get_subpixel_order", "oi", false));
	private static var lime_cairo_font_options_set_antialias = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_set_antialias", "oiv", false));
	private static var lime_cairo_font_options_set_hint_metrics = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_set_hint_metrics", "oiv", false));
	private static var lime_cairo_font_options_set_hint_style = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_set_hint_style", "oiv", false));
	private static var lime_cairo_font_options_set_subpixel_order = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_font_options_set_subpixel_order", "oiv", false));
	private static var lime_cairo_ft_font_face_create = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_ft_font_face_create", "oio", false));
	private static var lime_cairo_image_surface_create = new cpp.Callable<Int->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_image_surface_create", "iiio", false));
	private static var lime_cairo_image_surface_create_for_data = new cpp.Callable<lime.utils.DataPointer->Int->Int->Int->Int->
		cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_image_surface_create_for_data", "diiiio", false));
	private static var lime_cairo_image_surface_get_data = new cpp.Callable<cpp.Object->lime.utils.DataPointer>(cpp.Prime._loadPrime("lime",
		"lime_cairo_image_surface_get_data", "od", false));
	private static var lime_cairo_image_surface_get_format = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_image_surface_get_format", "oi", false));
	private static var lime_cairo_image_surface_get_height = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_image_surface_get_height", "oi", false));
	private static var lime_cairo_image_surface_get_stride = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_image_surface_get_stride", "oi", false));
	private static var lime_cairo_image_surface_get_width = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_image_surface_get_width", "oi", false));
	private static var lime_cairo_pattern_add_color_stop_rgb = new cpp.Callable<cpp.Object->Float->Float->Float->Float->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_add_color_stop_rgb", "oddddv", false));
	private static var lime_cairo_pattern_add_color_stop_rgba = new cpp.Callable<cpp.Object->Float->Float->Float->Float->Float->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_pattern_add_color_stop_rgba", "odddddv", false));
	private static var lime_cairo_pattern_create_for_surface = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_create_for_surface", "oo", false));
	private static var lime_cairo_pattern_create_linear = new cpp.Callable<Float->Float->Float->Float->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_create_linear", "ddddo", false));
	private static var lime_cairo_pattern_create_radial = new cpp.Callable<Float->Float->Float->Float->Float->Float->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_create_radial", "ddddddo", false));
	private static var lime_cairo_pattern_create_rgb = new cpp.Callable<Float->Float->Float->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_create_rgb", "dddo", false));
	private static var lime_cairo_pattern_create_rgba = new cpp.Callable<Float->Float->Float->Float->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_create_rgba", "ddddo", false));
	private static var lime_cairo_pattern_get_color_stop_count = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_get_color_stop_count", "oi", false));
	private static var lime_cairo_pattern_get_extend = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_pattern_get_extend", "oi",
		false));
	private static var lime_cairo_pattern_get_filter = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_cairo_pattern_get_filter", "oi",
		false));
	private static var lime_cairo_pattern_get_matrix = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_cairo_pattern_get_matrix",
		"oo", false));
	private static var lime_cairo_pattern_set_extend = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_set_extend", "oiv", false));
	private static var lime_cairo_pattern_set_filter = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_set_filter", "oiv", false));
	private static var lime_cairo_pattern_set_matrix = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_cairo_pattern_set_matrix", "oov", false));
	private static var lime_cairo_surface_flush = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_cairo_surface_flush", "ov",
		false));
	#end
	#end

	#if (lime_cffi && !macro && lime_curl)
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_curl_getdate(date:String, now:Float):Float;

	@:cffi private static function lime_curl_global_cleanup():Void;

	@:cffi private static function lime_curl_global_init(flags:Int):Int;

	@:cffi private static function lime_curl_version():Dynamic;

	@:cffi private static function lime_curl_version_info(type:Int):Dynamic;

	@:cffi private static function lime_curl_easy_cleanup(handle:CFFIPointer):Void;

	@:cffi private static function lime_curl_easy_duphandle(handle:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_curl_easy_escape(curl:CFFIPointer, url:String, length:Int):Dynamic;

	@:cffi private static function lime_curl_easy_flush(curl:CFFIPointer):Void;

	@:cffi private static function lime_curl_easy_getinfo(curl:CFFIPointer, info:Int):Dynamic;

	@:cffi private static function lime_curl_easy_init():CFFIPointer;

	@:cffi private static function lime_curl_easy_pause(handle:CFFIPointer, bitmask:Int):Int;

	@:cffi private static function lime_curl_easy_perform(easy_handle:CFFIPointer):Int;

	@:cffi private static function lime_curl_easy_recv(curl:CFFIPointer, buffer:Dynamic, buflen:Int, n:Int):Int;

	@:cffi private static function lime_curl_easy_reset(curl:CFFIPointer):Void;

	@:cffi private static function lime_curl_easy_send(curl:CFFIPointer, buffer:Dynamic, buflen:Int, n:Int):Int;

	@:cffi private static function lime_curl_easy_setopt(handle:CFFIPointer, option:Int, parameter:Dynamic, writeBytes:Dynamic):Int;

	@:cffi private static function lime_curl_easy_strerror(errornum:Int):Dynamic;

	@:cffi private static function lime_curl_easy_unescape(curl:CFFIPointer, url:String, inlength:Int, outlength:Int):Dynamic;

	@:cffi private static function lime_curl_multi_init():CFFIPointer;

	@:cffi private static function lime_curl_multi_add_handle(multi_handle:CFFIPointer, curl_object:Dynamic, curl_handle:CFFIPointer):Int;

	@:cffi private static function lime_curl_multi_get_running_handles(multi_handle:CFFIPointer):Int;

	@:cffi private static function lime_curl_multi_info_read(multi_handle:CFFIPointer):Dynamic;

	@:cffi private static function lime_curl_multi_perform(multi_handle:CFFIPointer):Int;

	@:cffi private static function lime_curl_multi_remove_handle(multi_handle:CFFIPointer, curl_handle:CFFIPointer):Int;

	@:cffi private static function lime_curl_multi_setopt(multi_handle:CFFIPointer, option:Int, parameter:Dynamic):Int;

	@:cffi private static function lime_curl_multi_wait(multi_handle:CFFIPointer, timeout_ms:Int):Int;
	#else
	private static var lime_curl_getdate = new cpp.Callable<String->Float->Float>(cpp.Prime._loadPrime("lime", "lime_curl_getdate", "sdd", false));
	private static var lime_curl_global_cleanup = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_curl_global_cleanup", "v", false));
	private static var lime_curl_global_init = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_curl_global_init", "ii", false));
	private static var lime_curl_version = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_version", "o", false));
	private static var lime_curl_version_info = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_version_info", "io", false));
	private static var lime_curl_easy_cleanup = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_curl_easy_cleanup", "ov", false));
	private static var lime_curl_easy_duphandle = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_easy_duphandle", "oo",
		false));
	private static var lime_curl_easy_escape = new cpp.Callable<cpp.Object->String->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_easy_escape",
		"osio", false));
	private static var lime_curl_easy_flush = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_curl_easy_flush", "ov", false));
	private static var lime_curl_easy_getinfo = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_easy_getinfo", "oio",
		false));
	private static var lime_curl_easy_init = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_easy_init", "o", false));
	private static var lime_curl_easy_pause = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_curl_easy_pause", "oii", false));
	private static var lime_curl_easy_perform = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_curl_easy_perform", "oi", false));
	private static var lime_curl_easy_recv = new cpp.Callable<cpp.Object->cpp.Object->Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_curl_easy_recv",
		"ooiii", false));
	private static var lime_curl_easy_reset = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_curl_easy_reset", "ov", false));
	private static var lime_curl_easy_send = new cpp.Callable<cpp.Object->cpp.Object->Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_curl_easy_send",
		"ooiii", false));
	private static var lime_curl_easy_setopt = new cpp.Callable<cpp.Object->Int->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_curl_easy_setopt", "oiooi", false));
	private static var lime_curl_easy_strerror = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_easy_strerror", "io", false));
	private static var lime_curl_easy_unescape = new cpp.Callable<cpp.Object->String->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_curl_easy_unescape", "osiio", false));
	private static var lime_curl_multi_init = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_multi_init", "o", false));
	private static var lime_curl_multi_add_handle = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_curl_multi_add_handle", "oooi", false));
	private static var lime_curl_multi_get_running_handles = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_curl_multi_get_running_handles", "oi", false));
	private static var lime_curl_multi_info_read = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_curl_multi_info_read", "oo",
		false));
	private static var lime_curl_multi_perform = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_curl_multi_perform", "oi", false));
	private static var lime_curl_multi_remove_handle = new cpp.Callable<cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_curl_multi_remove_handle", "ooi", false));
	private static var lime_curl_multi_setopt = new cpp.Callable<cpp.Object->Int->cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_curl_multi_setopt",
		"oioi", false));
	private static var lime_curl_multi_wait = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_curl_multi_wait", "oii", false));
	#end
	#end

	#if (lime_cffi && !macro && (lime_opengl || lime_opengles))
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_gl_active_texture(texture:Int):Void;

	@:cffi private static function lime_gl_attach_shader(program:Int, shader:Int):Void;

	@:cffi private static function lime_gl_begin_query(target:Int, query:Int):Void;

	@:cffi private static function lime_gl_begin_transform_feedback(primitiveNode:Int):Void;

	@:cffi private static function lime_gl_bind_attrib_location(program:Int, index:Int, name:String):Void;

	@:cffi private static function lime_gl_bind_buffer(target:Int, buffer:Int):Void;

	@:cffi private static function lime_gl_bind_buffer_base(target:Int, index:Int, buffer:Int):Void;

	@:cffi private static function lime_gl_bind_buffer_range(target:Int, index:Int, buffer:Int, offset:DataPointer, size:Int):Void;

	@:cffi private static function lime_gl_bind_framebuffer(target:Int, framebuffer:Int):Void;

	@:cffi private static function lime_gl_bind_renderbuffer(target:Int, renderbuffer:Int):Void;

	@:cffi private static function lime_gl_bind_sampler(target:Int, sampler:Int):Void;

	@:cffi private static function lime_gl_bind_texture(target:Int, texture:Int):Void;

	@:cffi private static function lime_gl_bind_transform_feedback(target:Int, transformFeedback:Int):Void;

	@:cffi private static function lime_gl_bind_vertex_array(vertexArray:Int):Void;

	@:cffi private static function lime_gl_blend_color(red:Float32, green:Float32, blue:Float32, alpha:Float32):Void;

	@:cffi private static function lime_gl_blend_equation(mode:Int):Void;

	@:cffi private static function lime_gl_blend_equation_separate(modeRGB:Int, modeAlpha:Int):Void;

	@:cffi private static function lime_gl_blend_func(sfactor:Int, dfactor:Int):Void;

	@:cffi private static function lime_gl_blend_func_separate(srcRGB:Int, dstRGB:Int, srcAlpha:Int, dstAlpha:Int):Void;

	@:cffi private static function lime_gl_blit_framebuffer(srcX0:Int, srcY0:Int, srcX1:Int, srcY1:Int, dstX0:Int, dstY0:Int, dstX1:Int, dstY1:Int, mask:Int,
		filter:Int):Void;

	@:cffi private static function lime_gl_buffer_data(target:Int, size:Int, srcData:DataPointer, usage:Int):Void;

	@:cffi private static function lime_gl_buffer_sub_data(target:Int, offset:Int, size:Int, srcData:DataPointer):Void;

	@:cffi private static function lime_gl_check_framebuffer_status(target:Int):Int;

	@:cffi private static function lime_gl_clear(mask:Int):Void;

	@:cffi private static function lime_gl_clear_bufferfi(buffer:Int, drawBuffer:Int, depth:Float32, stencil:Int):Void;

	@:cffi private static function lime_gl_clear_bufferfv(buffer:Int, drawBuffer:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_clear_bufferiv(buffer:Int, drawBuffer:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_clear_bufferuiv(buffer:Int, drawBuffer:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_client_wait_sync(sync:CFFIPointer, flags:Int, timeoutA:Int, timeoutB:Int):Int;

	@:cffi private static function lime_gl_clear_color(red:Float32, green:Float32, blue:Float32, alpha:Float32):Void;

	@:cffi private static function lime_gl_clear_depthf(depth:Float32):Void;

	@:cffi private static function lime_gl_clear_stencil(s:Int):Void;

	@:cffi private static function lime_gl_color_mask(red:Bool, green:Bool, blue:Bool, alpha:Bool):Void;

	@:cffi private static function lime_gl_compile_shader(shader:Int):Void;

	@:cffi private static function lime_gl_compressed_tex_image_2d(target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int,
		imageSize:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_compressed_tex_image_3d(target:Int, level:Int, internalformat:Int, width:Int, height:Int, depth:Int, border:Int,
		imageSize:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_compressed_tex_sub_image_2d(target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int,
		imageSize:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_compressed_tex_sub_image_3d(target:Int, level:Int, xoffset:Int, yoffset:Int, zoffset:Int, width:Int, height:Int,
		depth:Int, format:Int, imageSize:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_copy_buffer_sub_data(readTarget:Int, writeTarget:Int, readOffset:DataPointer, writeOffset:DataPointer,
		size:Int):Void;

	@:cffi private static function lime_gl_copy_tex_image_2d(target:Int, level:Int, internalformat:Int, x:Int, y:Int, width:Int, height:Int, border:Int):Void;

	@:cffi private static function lime_gl_copy_tex_sub_image_2d(target:Int, level:Int, xoffset:Int, yoffset:Int, x:Int, y:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_copy_tex_sub_image_3d(target:Int, level:Int, xoffset:Int, yoffset:Int, zoffset:Int, x:Int, y:Int, width:Int,
		height:Int):Void;

	@:cffi private static function lime_gl_create_buffer():Int;

	@:cffi private static function lime_gl_create_framebuffer():Int;

	@:cffi private static function lime_gl_create_program():Int;

	@:cffi private static function lime_gl_create_query():Int;

	@:cffi private static function lime_gl_create_renderbuffer():Int;

	@:cffi private static function lime_gl_create_sampler():Int;

	@:cffi private static function lime_gl_create_shader(type:Int):Int;

	@:cffi private static function lime_gl_create_texture():Int;

	@:cffi private static function lime_gl_create_transform_feedback():Int;

	@:cffi private static function lime_gl_create_vertex_array():Int;

	@:cffi private static function lime_gl_cull_face(mode:Int):Void;

	@:cffi private static function lime_gl_delete_buffer(buffer:Int):Void;

	@:cffi private static function lime_gl_delete_framebuffer(framebuffer:Int):Void;

	@:cffi private static function lime_gl_delete_program(program:Int):Void;

	@:cffi private static function lime_gl_delete_query(query:Int):Void;

	@:cffi private static function lime_gl_delete_renderbuffer(renderbuffer:Int):Void;

	@:cffi private static function lime_gl_delete_sampler(sampler:Int):Void;

	@:cffi private static function lime_gl_delete_shader(shader:Int):Void;

	@:cffi private static function lime_gl_delete_sync(sync:CFFIPointer):Void;

	@:cffi private static function lime_gl_delete_texture(texture:Int):Void;

	@:cffi private static function lime_gl_delete_transform_feedback(transformFeedback:Int):Void;

	@:cffi private static function lime_gl_delete_vertex_array(vertexArray:Int):Void;

	@:cffi private static function lime_gl_depth_func(func:Int):Void;

	@:cffi private static function lime_gl_depth_mask(flag:Bool):Void;

	@:cffi private static function lime_gl_depth_rangef(zNear:Float32, zFar:Float32):Void;

	@:cffi private static function lime_gl_detach_shader(program:Int, shader:Int):Void;

	@:cffi private static function lime_gl_disable(cap:Int):Void;

	@:cffi private static function lime_gl_disable_vertex_attrib_array(index:Int):Void;

	@:cffi private static function lime_gl_draw_arrays(mode:Int, first:Int, count:Int):Void;

	@:cffi private static function lime_gl_draw_arrays_instanced(mode:Int, first:Int, count:Int, instanceCount:Int):Void;

	@:cffi private static function lime_gl_draw_buffers(buffers:Dynamic):Void;

	@:cffi private static function lime_gl_draw_elements(mode:Int, count:Int, type:Int, offset:DataPointer):Void;

	@:cffi private static function lime_gl_draw_elements_instanced(mode:Int, count:Int, type:Int, offset:DataPointer, instanceCount:Int):Void;

	@:cffi private static function lime_gl_draw_range_elements(mode:Int, start:Int, end:Int, count:Int, type:Int, offset:DataPointer):Void;

	@:cffi private static function lime_gl_enable(cap:Int):Void;

	@:cffi private static function lime_gl_enable_vertex_attrib_array(index:Int):Void;

	@:cffi private static function lime_gl_end_query(target:Int):Void;

	@:cffi private static function lime_gl_end_transform_feedback():Void;

	@:cffi private static function lime_gl_fence_sync(condition:Int, flags:Int):CFFIPointer;

	@:cffi private static function lime_gl_finish():Void;

	@:cffi private static function lime_gl_flush():Void;

	@:cffi private static function lime_gl_framebuffer_renderbuffer(target:Int, attachment:Int, renderbuffertarget:Int, renderbuffer:Int):Void;

	@:cffi private static function lime_gl_framebuffer_texture2D(target:Int, attachment:Int, textarget:Int, texture:Int, level:Int):Void;

	@:cffi private static function lime_gl_framebuffer_texture_layer(target:Int, attachment:Int, texture:Int, level:Int, layer:Int):Void;

	@:cffi private static function lime_gl_front_face(mode:Int):Void;

	@:cffi private static function lime_gl_generate_mipmap(target:Int):Void;

	@:cffi private static function lime_gl_get_active_attrib(program:Int, index:Int):Dynamic;

	@:cffi private static function lime_gl_get_active_uniform(program:Int, index:Int):Dynamic;

	@:cffi private static function lime_gl_get_active_uniform_blocki(program:Int, uniformBlockIndex:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_active_uniform_blockiv(program:Int, uniformBlockIndex:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_active_uniform_block_name(program:Int, uniformBlockIndex:Int):Dynamic;

	@:cffi private static function lime_gl_get_active_uniformsiv(program:Int, uniformIndices:Dynamic, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_attached_shaders(program:Int):Dynamic;

	@:cffi private static function lime_gl_get_attrib_location(program:Int, name:String):Int;

	@:cffi private static function lime_gl_get_boolean(pname:Int):Bool;

	@:cffi private static function lime_gl_get_booleanv(pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_buffer_parameteri(target:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_buffer_parameteri64v(target:Int, index:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_buffer_parameteriv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_buffer_pointerv(target:Int, pname:Int):DataPointer;

	@:cffi private static function lime_gl_get_buffer_sub_data(target:Int, offset:DataPointer, size:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_get_context_attributes():Dynamic;

	@:cffi private static function lime_gl_get_error():Int;

	@:cffi private static function lime_gl_get_extension(name:String):Dynamic;

	@:cffi private static function lime_gl_get_float(pname:Int):Float32;

	@:cffi private static function lime_gl_get_floatv(pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_frag_data_location(program:Int, name:String):Int;

	@:cffi private static function lime_gl_get_framebuffer_attachment_parameteri(target:Int, attachment:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_framebuffer_attachment_parameteriv(target:Int, attachment:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_integer(pname:Int):Int;

	@:cffi private static function lime_gl_get_integer64v(pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_integer64i_v(pname:Int, index:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_integerv(pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_integeri_v(pname:Int, index:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_internalformativ(target:Int, internalformat:Int, pname:Int, bufSize:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_program_binary(program:Int, binaryFormat:Int, bytes:Dynamic):Void;

	@:cffi private static function lime_gl_get_program_info_log(program:Int):Dynamic;

	@:cffi private static function lime_gl_get_programi(program:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_programiv(program:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_queryi(target:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_queryiv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_query_objectui(target:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_query_objectuiv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_renderbuffer_parameteri(target:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_renderbuffer_parameteriv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_sampler_parameterf(target:Int, pname:Int):Float32;

	@:cffi private static function lime_gl_get_sampler_parameterfv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_sampler_parameteri(target:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_sampler_parameteriv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_shader_info_log(shader:Int):Dynamic;

	@:cffi private static function lime_gl_get_shaderi(shader:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_shaderiv(shader:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_shader_precision_format(shadertype:Int, precisiontype:Int):Dynamic;

	@:cffi private static function lime_gl_get_shader_source(shader:Int):Dynamic;

	@:cffi private static function lime_gl_get_string(pname:Int):Dynamic;

	@:cffi private static function lime_gl_get_stringi(pname:Int, index:Int):Dynamic;

	@:cffi private static function lime_gl_get_sync_parameteri(sync:CFFIPointer, pname:Int):Int;

	@:cffi private static function lime_gl_get_sync_parameteriv(sync:CFFIPointer, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_tex_parameterf(target:Int, pname:Int):Float32;

	@:cffi private static function lime_gl_get_tex_parameterfv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_tex_parameteri(target:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_tex_parameteriv(target:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_transform_feedback_varying(program:Int, index:Int):Dynamic;

	@:cffi private static function lime_gl_get_uniformf(program:Int, location:Int):Float32;

	@:cffi private static function lime_gl_get_uniformfv(program:Int, location:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_uniformi(program:Int, location:Int):Int;

	@:cffi private static function lime_gl_get_uniformiv(program:Int, location:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_uniformui(program:Int, location:Int):Int;

	@:cffi private static function lime_gl_get_uniformuiv(program:Int, location:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_uniform_block_index(program:Int, uniformBlockName:String):Int;

	@:cffi private static function lime_gl_get_uniform_location(program:Int, name:String):Int;

	@:cffi private static function lime_gl_get_vertex_attribf(index:Int, pname:Int):Float32;

	@:cffi private static function lime_gl_get_vertex_attribfv(index:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_vertex_attribi(index:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_vertex_attribiv(index:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_vertex_attribii(index:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_vertex_attribiiv(index:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_vertex_attribiui(index:Int, pname:Int):Int;

	@:cffi private static function lime_gl_get_vertex_attribiuiv(index:Int, pname:Int, params:DataPointer):Void;

	@:cffi private static function lime_gl_get_vertex_attrib_pointerv(index:Int, pname:Int):DataPointer;

	@:cffi private static function lime_gl_hint(target:Int, mode:Int):Void;

	@:cffi private static function lime_gl_invalidate_framebuffer(target:Int, attachments:Dynamic):Void;

	@:cffi private static function lime_gl_invalidate_sub_framebuffer(target:Int, attachments:Dynamic, x:Int, y:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_is_buffer(buffer:Int):Bool;

	@:cffi private static function lime_gl_is_enabled(cap:Int):Bool;

	@:cffi private static function lime_gl_is_framebuffer(framebuffer:Int):Bool;

	@:cffi private static function lime_gl_is_program(program:Int):Bool;

	@:cffi private static function lime_gl_is_query(query:Int):Bool;

	@:cffi private static function lime_gl_is_renderbuffer(renderbuffer:Int):Bool;

	@:cffi private static function lime_gl_is_sampler(sampler:Int):Bool;

	@:cffi private static function lime_gl_is_shader(shader:Int):Bool;

	@:cffi private static function lime_gl_is_sync(sync:CFFIPointer):Bool;

	@:cffi private static function lime_gl_is_texture(texture:Int):Bool;

	@:cffi private static function lime_gl_is_transform_feedback(transformFeedback:Int):Bool;

	@:cffi private static function lime_gl_is_vertex_array(vertexArray:Int):Bool;

	@:cffi private static function lime_gl_line_width(width:Float32):Void;

	@:cffi private static function lime_gl_link_program(program:Int):Void;

	@:cffi private static function lime_gl_map_buffer_range(target:Int, offset:DataPointer, length:Int, access:Int):DataPointer;

	@:cffi private static function lime_gl_object_deregister(object:Dynamic):Void;

	@:cffi private static function lime_gl_object_from_id(id:Int, type:Int):Dynamic;

	@:cffi private static function lime_gl_object_register(id:Int, type:Int, object:Dynamic):Dynamic;

	@:cffi private static function lime_gl_pause_transform_feedback():Void;

	@:cffi private static function lime_gl_pixel_storei(pname:Int, param:Int):Void;

	@:cffi private static function lime_gl_polygon_offset(factor:Float32, units:Float32):Void;

	@:cffi private static function lime_gl_program_binary(program:Int, binaryFormat:Int, binary:DataPointer, length:Int):Void;

	@:cffi private static function lime_gl_program_parameteri(program:Int, pname:Int, value:Int):Void;

	@:cffi private static function lime_gl_read_buffer(src:Int):Void;

	@:cffi private static function lime_gl_read_pixels(x:Int, y:Int, width:Int, height:Int, format:Int, type:Int, pixels:DataPointer):Void;

	@:cffi private static function lime_gl_release_shader_compiler():Void;

	@:cffi private static function lime_gl_renderbuffer_storage(target:Int, internalformat:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_renderbuffer_storage_multisample(target:Int, samples:Int, internalformat:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_resume_transform_feedback():Void;

	@:cffi private static function lime_gl_sample_coverage(value:Float32, invert:Bool):Void;

	@:cffi private static function lime_gl_sampler_parameterf(sampler:Int, pname:Int, param:Float32):Void;

	@:cffi private static function lime_gl_sampler_parameteri(sampler:Int, pname:Int, param:Int):Void;

	@:cffi private static function lime_gl_scissor(x:Int, y:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_shader_binary(shaders:Dynamic, binaryformat:Int, binary:DataPointer, length:Int):Void;

	@:cffi private static function lime_gl_shader_source(shader:Int, source:String):Void;

	@:cffi private static function lime_gl_stencil_func(func:Int, ref:Int, mask:Int):Void;

	@:cffi private static function lime_gl_stencil_func_separate(face:Int, func:Int, ref:Int, mask:Int):Void;

	@:cffi private static function lime_gl_stencil_mask(mask:Int):Void;

	@:cffi private static function lime_gl_stencil_mask_separate(face:Int, mask:Int):Void;

	@:cffi private static function lime_gl_stencil_op(fail:Int, zfail:Int, zpass:Int):Void;

	@:cffi private static function lime_gl_stencil_op_separate(face:Int, fail:Int, zfail:Int, zpass:Int):Void;

	@:cffi private static function lime_gl_tex_image_2d(target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, format:Int, type:Int,
		data:DataPointer):Void;

	@:cffi private static function lime_gl_tex_image_3d(target:Int, level:Int, internalformat:Int, width:Int, height:Int, depth:Int, border:Int, format:Int,
		type:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_tex_parameterf(target:Int, pname:Int, param:Float32):Void;

	@:cffi private static function lime_gl_tex_parameteri(target:Int, pname:Int, param:Int):Void;

	@:cffi private static function lime_gl_tex_storage_2d(target:Int, level:Int, internalformat:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_tex_storage_3d(target:Int, level:Int, internalformat:Int, width:Int, height:Int, depth:Int):Void;

	@:cffi private static function lime_gl_tex_sub_image_2d(target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, type:Int,
		data:DataPointer):Void;

	@:cffi private static function lime_gl_tex_sub_image_3d(target:Int, level:Int, xoffset:Int, yoffset:Int, zoffset:Int, width:Int, height:Int, depth:Int,
		format:Int, type:Int, data:DataPointer):Void;

	@:cffi private static function lime_gl_transform_feedback_varyings(program:Int, varyings:Dynamic, bufferMode:Int):Void;

	@:cffi private static function lime_gl_uniform1f(location:Int, v0:Float32):Void;

	@:cffi private static function lime_gl_uniform1fv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform1i(location:Int, v0:Int):Void;

	@:cffi private static function lime_gl_uniform1iv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform1ui(location:Int, v0:Int):Void;

	@:cffi private static function lime_gl_uniform1uiv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform2f(location:Int, v0:Float32, v1:Float32):Void;

	@:cffi private static function lime_gl_uniform2fv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform2i(location:Int, v0:Int, v1:Int):Void;

	@:cffi private static function lime_gl_uniform2iv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform2ui(location:Int, v0:Int, v1:Int):Void;

	@:cffi private static function lime_gl_uniform2uiv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform3f(location:Int, v0:Float32, v1:Float32, v2:Float32):Void;

	@:cffi private static function lime_gl_uniform3fv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform3i(location:Int, v0:Int, v1:Int, v2:Int):Void;

	@:cffi private static function lime_gl_uniform3iv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform3ui(location:Int, v0:Int, v1:Int, v2:Int):Void;

	@:cffi private static function lime_gl_uniform3uiv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform4f(location:Int, v0:Float32, v1:Float32, v2:Float32, v3:Float32):Void;

	@:cffi private static function lime_gl_uniform4fv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform4i(location:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;

	@:cffi private static function lime_gl_uniform4iv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform4ui(location:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;

	@:cffi private static function lime_gl_uniform4uiv(location:Int, count:Int, v:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_block_binding(program:Int, uniformBlockIndex:Int, uniformBlockBinding:Int):Void;

	@:cffi private static function lime_gl_uniform_matrix2fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix2x3fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix2x4fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix3fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix3x2fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix3x4fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix4fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix4x2fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_uniform_matrix4x3fv(location:Int, count:Int, transpose:Bool, value:DataPointer):Void;

	@:cffi private static function lime_gl_unmap_buffer(target:Int):Bool;

	@:cffi private static function lime_gl_use_program(program:Int):Void;

	@:cffi private static function lime_gl_validate_program(program:Int):Void;

	@:cffi private static function lime_gl_vertex_attrib1f(indx:Int, v0:Float32):Void;

	@:cffi private static function lime_gl_vertex_attrib1fv(indx:Int, values:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attrib2f(indx:Int, v0:Float32, v1:Float32):Void;

	@:cffi private static function lime_gl_vertex_attrib2fv(indx:Int, values:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attrib3f(indx:Int, v0:Float32, v1:Float32, v2:Float32):Void;

	@:cffi private static function lime_gl_vertex_attrib3fv(indx:Int, values:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attrib4f(indx:Int, v0:Float32, v1:Float32, v2:Float32, v3:Float32):Void;

	@:cffi private static function lime_gl_vertex_attrib4fv(indx:Int, values:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attribi4i(indx:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;

	@:cffi private static function lime_gl_vertex_attribi4iv(indx:Int, values:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attribi4ui(indx:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;

	@:cffi private static function lime_gl_vertex_attribi4uiv(indx:Int, values:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attrib_divisor(indx:Int, divisor:Int):Void;

	@:cffi private static function lime_gl_vertex_attrib_ipointer(indx:Int, size:Int, type:Int, stride:Int, offset:DataPointer):Void;

	@:cffi private static function lime_gl_vertex_attrib_pointer(indx:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:DataPointer):Void;

	@:cffi private static function lime_gl_viewport(x:Int, y:Int, width:Int, height:Int):Void;

	@:cffi private static function lime_gl_wait_sync(sync:CFFIPointer, flags:Int, timeoutA:Int, timeoutB:Int):Void;
	#else
	private static var lime_gl_active_texture = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_active_texture", "iv", false));
	private static var lime_gl_attach_shader = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_attach_shader", "iiv", false));
	private static var lime_gl_begin_query = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_begin_query", "iiv", false));
	private static var lime_gl_begin_transform_feedback = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_begin_transform_feedback",
		"iv", false));
	private static var lime_gl_bind_attrib_location = new cpp.Callable<Int->Int->String->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_bind_attrib_location", "iisv", false));
	private static var lime_gl_bind_buffer = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_buffer", "iiv", false));
	private static var lime_gl_bind_buffer_base = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_buffer_base", "iiiv",
		false));
	private static var lime_gl_bind_buffer_range = new cpp.Callable<Int->Int->Int->lime.utils.DataPointer->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_bind_buffer_range", "iiidiv", false));
	private static var lime_gl_bind_framebuffer = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_framebuffer", "iiv", false));
	private static var lime_gl_bind_renderbuffer = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_renderbuffer", "iiv",
		false));
	private static var lime_gl_bind_sampler = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_sampler", "iiv", false));
	private static var lime_gl_bind_texture = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_texture", "iiv", false));
	private static var lime_gl_bind_transform_feedback = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_transform_feedback",
		"iiv", false));
	private static var lime_gl_bind_vertex_array = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_bind_vertex_array", "iv", false));
	private static var lime_gl_blend_color = new cpp.Callable<cpp.Float32->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_blend_color", "ffffv", false));
	private static var lime_gl_blend_equation = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_blend_equation", "iv", false));
	private static var lime_gl_blend_equation_separate = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_blend_equation_separate",
		"iiv", false));
	private static var lime_gl_blend_func = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_blend_func", "iiv", false));
	private static var lime_gl_blend_func_separate = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_blend_func_separate", "iiiiv", false));
	private static var lime_gl_blit_framebuffer = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_blit_framebuffer", "iiiiiiiiiiv", false));
	private static var lime_gl_buffer_data = new cpp.Callable<Int->Int->lime.utils.DataPointer->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_buffer_data", "iidiv", false));
	private static var lime_gl_buffer_sub_data = new cpp.Callable<Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_buffer_sub_data", "iiidv", false));
	private static var lime_gl_check_framebuffer_status = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_check_framebuffer_status", "ii",
		false));
	private static var lime_gl_clear = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_clear", "iv", false));
	private static var lime_gl_clear_bufferfi = new cpp.Callable<Int->Int->cpp.Float32->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_clear_bufferfi",
		"iifiv", false));
	private static var lime_gl_clear_bufferfv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_clear_bufferfv", "iidv", false));
	private static var lime_gl_clear_bufferiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_clear_bufferiv", "iidv", false));
	private static var lime_gl_clear_bufferuiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_clear_bufferuiv", "iidv", false));
	private static var lime_gl_client_wait_sync = new cpp.Callable<cpp.Object->Int->Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_client_wait_sync",
		"oiiii", false));
	private static var lime_gl_clear_color = new cpp.Callable<cpp.Float32->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_clear_color", "ffffv", false));
	private static var lime_gl_clear_depthf = new cpp.Callable<cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_clear_depthf", "fv", false));
	private static var lime_gl_clear_stencil = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_clear_stencil", "iv", false));
	private static var lime_gl_color_mask = new cpp.Callable<Bool->Bool->Bool->Bool->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_color_mask", "bbbbv",
		false));
	private static var lime_gl_compile_shader = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_compile_shader", "iv", false));
	private static var lime_gl_compressed_tex_image_2d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_compressed_tex_image_2d", "iiiiiiidv", false));
	private static var lime_gl_compressed_tex_image_3d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_compressed_tex_image_3d", "iiiiiiiidv", false));
	private static var lime_gl_compressed_tex_sub_image_2d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_compressed_tex_sub_image_2d", "iiiiiiiidv", false));
	private static var lime_gl_compressed_tex_sub_image_3d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_compressed_tex_sub_image_3d", "iiiiiiiiiidv", false));
	private static var lime_gl_copy_buffer_sub_data = new cpp.Callable<Int->Int->lime.utils.DataPointer->lime.utils.DataPointer->Int->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_copy_buffer_sub_data", "iiddiv", false));
	private static var lime_gl_copy_tex_image_2d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_copy_tex_image_2d", "iiiiiiiiv", false));
	private static var lime_gl_copy_tex_sub_image_2d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_copy_tex_sub_image_2d", "iiiiiiiiv", false));
	private static var lime_gl_copy_tex_sub_image_3d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_copy_tex_sub_image_3d", "iiiiiiiiiv", false));
	private static var lime_gl_create_buffer = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_buffer", "i", false));
	private static var lime_gl_create_framebuffer = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_framebuffer", "i", false));
	private static var lime_gl_create_program = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_program", "i", false));
	private static var lime_gl_create_query = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_query", "i", false));
	private static var lime_gl_create_renderbuffer = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_renderbuffer", "i", false));
	private static var lime_gl_create_sampler = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_sampler", "i", false));
	private static var lime_gl_create_shader = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_shader", "ii", false));
	private static var lime_gl_create_texture = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_texture", "i", false));
	private static var lime_gl_create_transform_feedback = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_transform_feedback", "i",
		false));
	private static var lime_gl_create_vertex_array = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_create_vertex_array", "i", false));
	private static var lime_gl_cull_face = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_cull_face", "iv", false));
	private static var lime_gl_delete_buffer = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_buffer", "iv", false));
	private static var lime_gl_delete_framebuffer = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_framebuffer", "iv", false));
	private static var lime_gl_delete_program = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_program", "iv", false));
	private static var lime_gl_delete_query = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_query", "iv", false));
	private static var lime_gl_delete_renderbuffer = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_renderbuffer", "iv", false));
	private static var lime_gl_delete_sampler = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_sampler", "iv", false));
	private static var lime_gl_delete_shader = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_shader", "iv", false));
	private static var lime_gl_delete_sync = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_sync", "ov", false));
	private static var lime_gl_delete_texture = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_texture", "iv", false));
	private static var lime_gl_delete_transform_feedback = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_transform_feedback",
		"iv", false));
	private static var lime_gl_delete_vertex_array = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_delete_vertex_array", "iv", false));
	private static var lime_gl_depth_func = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_depth_func", "iv", false));
	private static var lime_gl_depth_mask = new cpp.Callable<Bool->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_depth_mask", "bv", false));
	private static var lime_gl_depth_rangef = new cpp.Callable<cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_depth_rangef", "ffv",
		false));
	private static var lime_gl_detach_shader = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_detach_shader", "iiv", false));
	private static var lime_gl_disable = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_disable", "iv", false));
	private static var lime_gl_disable_vertex_attrib_array = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_disable_vertex_attrib_array", "iv", false));
	private static var lime_gl_draw_arrays = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_draw_arrays", "iiiv", false));
	private static var lime_gl_draw_arrays_instanced = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_draw_arrays_instanced", "iiiiv", false));
	private static var lime_gl_draw_buffers = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_draw_buffers", "ov", false));
	private static var lime_gl_draw_elements = new cpp.Callable<Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_draw_elements", "iiidv", false));
	private static var lime_gl_draw_elements_instanced = new cpp.Callable<Int->Int->Int->lime.utils.DataPointer->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_draw_elements_instanced", "iiidiv", false));
	private static var lime_gl_draw_range_elements = new cpp.Callable<Int->Int->Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_draw_range_elements", "iiiiidv", false));
	private static var lime_gl_enable = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_enable", "iv", false));
	private static var lime_gl_enable_vertex_attrib_array = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_enable_vertex_attrib_array",
		"iv", false));
	private static var lime_gl_end_query = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_end_query", "iv", false));
	private static var lime_gl_end_transform_feedback = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_end_transform_feedback", "v",
		false));
	private static var lime_gl_fence_sync = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_fence_sync", "iio", false));
	private static var lime_gl_finish = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_finish", "v", false));
	private static var lime_gl_flush = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_flush", "v", false));
	private static var lime_gl_framebuffer_renderbuffer = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_framebuffer_renderbuffer", "iiiiv", false));
	private static var lime_gl_framebuffer_texture2D = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_framebuffer_texture2D", "iiiiiv", false));
	private static var lime_gl_framebuffer_texture_layer = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_framebuffer_texture_layer", "iiiiiv", false));
	private static var lime_gl_front_face = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_front_face", "iv", false));
	private static var lime_gl_generate_mipmap = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_generate_mipmap", "iv", false));
	private static var lime_gl_get_active_attrib = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_active_attrib", "iio",
		false));
	private static var lime_gl_get_active_uniform = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_active_uniform", "iio",
		false));
	private static var lime_gl_get_active_uniform_blocki = new cpp.Callable<Int->Int->Int->Int>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_active_uniform_blocki", "iiii", false));
	private static var lime_gl_get_active_uniform_blockiv = new cpp.Callable<Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_active_uniform_blockiv", "iiidv", false));
	private static var lime_gl_get_active_uniform_block_name = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_active_uniform_block_name", "iio", false));
	private static var lime_gl_get_active_uniformsiv = new cpp.Callable<Int->cpp.Object->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_active_uniformsiv", "ioidv", false));
	private static var lime_gl_get_attached_shaders = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_attached_shaders", "io",
		false));
	private static var lime_gl_get_attrib_location = new cpp.Callable<Int->String->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_attrib_location", "isi",
		false));
	private static var lime_gl_get_boolean = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_get_boolean", "ib", false));
	private static var lime_gl_get_booleanv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_booleanv",
		"idv", false));
	private static var lime_gl_get_buffer_parameteri = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_buffer_parameteri", "iii",
		false));
	private static var lime_gl_get_buffer_parameteri64v = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_buffer_parameteri64v", "iidv", false));
	private static var lime_gl_get_buffer_parameteriv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_buffer_parameteriv", "iidv", false));
	private static var lime_gl_get_buffer_pointerv = new cpp.Callable<Int->Int->lime.utils.DataPointer>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_buffer_pointerv", "iid", false));
	private static var lime_gl_get_buffer_sub_data = new cpp.Callable<Int->lime.utils.DataPointer->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_buffer_sub_data", "ididv", false));
	private static var lime_gl_get_context_attributes = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_context_attributes", "o",
		false));
	private static var lime_gl_get_error = new cpp.Callable<Void->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_error", "i", false));
	private static var lime_gl_get_extension = new cpp.Callable<String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_extension", "so", false));
	private static var lime_gl_get_float = new cpp.Callable<Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_gl_get_float", "if", false));
	private static var lime_gl_get_floatv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_floatv", "idv",
		false));
	private static var lime_gl_get_frag_data_location = new cpp.Callable<Int->String->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_frag_data_location",
		"isi", false));
	private static var lime_gl_get_framebuffer_attachment_parameteri = new cpp.Callable<Int->Int->Int->Int>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_framebuffer_attachment_parameteri", "iiii", false));
	private static var lime_gl_get_framebuffer_attachment_parameteriv = new cpp.Callable<Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_framebuffer_attachment_parameteriv", "iiidv", false));
	private static var lime_gl_get_integer = new cpp.Callable<Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_integer", "ii", false));
	private static var lime_gl_get_integer64v = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_integer64v",
		"idv", false));
	private static var lime_gl_get_integer64i_v = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_integer64i_v", "iidv", false));
	private static var lime_gl_get_integerv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_integerv",
		"idv", false));
	private static var lime_gl_get_integeri_v = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_integeri_v", "iidv", false));
	private static var lime_gl_get_internalformativ = new cpp.Callable<Int->Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_internalformativ", "iiiidv", false));
	private static var lime_gl_get_program_binary = new cpp.Callable<Int->Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_program_binary", "iiov", false));
	private static var lime_gl_get_program_info_log = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_program_info_log", "io",
		false));
	private static var lime_gl_get_programi = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_programi", "iii", false));
	private static var lime_gl_get_programiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_programiv", "iidv", false));
	private static var lime_gl_get_queryi = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_queryi", "iii", false));
	private static var lime_gl_get_queryiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_get_queryiv",
		"iidv", false));
	private static var lime_gl_get_query_objectui = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_query_objectui", "iii", false));
	private static var lime_gl_get_query_objectuiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_query_objectuiv", "iidv", false));
	private static var lime_gl_get_renderbuffer_parameteri = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_renderbuffer_parameteri", "iii", false));
	private static var lime_gl_get_renderbuffer_parameteriv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_renderbuffer_parameteriv", "iidv", false));
	private static var lime_gl_get_sampler_parameterf = new cpp.Callable<Int->Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_gl_get_sampler_parameterf",
		"iif", false));
	private static var lime_gl_get_sampler_parameterfv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_sampler_parameterfv", "iidv", false));
	private static var lime_gl_get_sampler_parameteri = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_sampler_parameteri", "iii",
		false));
	private static var lime_gl_get_sampler_parameteriv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_sampler_parameteriv", "iidv", false));
	private static var lime_gl_get_shader_info_log = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_shader_info_log", "io",
		false));
	private static var lime_gl_get_shaderi = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_shaderi", "iii", false));
	private static var lime_gl_get_shaderiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_shaderiv", "iidv", false));
	private static var lime_gl_get_shader_precision_format = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_shader_precision_format", "iio", false));
	private static var lime_gl_get_shader_source = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_shader_source", "io", false));
	private static var lime_gl_get_string = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_string", "io", false));
	private static var lime_gl_get_stringi = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_get_stringi", "iio", false));
	private static var lime_gl_get_sync_parameteri = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_sync_parameteri", "oii",
		false));
	private static var lime_gl_get_sync_parameteriv = new cpp.Callable<cpp.Object->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_sync_parameteriv", "oidv", false));
	private static var lime_gl_get_tex_parameterf = new cpp.Callable<Int->Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_gl_get_tex_parameterf", "iif",
		false));
	private static var lime_gl_get_tex_parameterfv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_tex_parameterfv", "iidv", false));
	private static var lime_gl_get_tex_parameteri = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_tex_parameteri", "iii", false));
	private static var lime_gl_get_tex_parameteriv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_tex_parameteriv", "iidv", false));
	private static var lime_gl_get_transform_feedback_varying = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_transform_feedback_varying", "iio", false));
	private static var lime_gl_get_uniformf = new cpp.Callable<Int->Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_gl_get_uniformf", "iif", false));
	private static var lime_gl_get_uniformfv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_uniformfv", "iidv", false));
	private static var lime_gl_get_uniformi = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_uniformi", "iii", false));
	private static var lime_gl_get_uniformiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_uniformiv", "iidv", false));
	private static var lime_gl_get_uniformui = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_uniformui", "iii", false));
	private static var lime_gl_get_uniformuiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_uniformuiv", "iidv", false));
	private static var lime_gl_get_uniform_block_index = new cpp.Callable<Int->String->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_uniform_block_index",
		"isi", false));
	private static var lime_gl_get_uniform_location = new cpp.Callable<Int->String->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_uniform_location", "isi",
		false));
	private static var lime_gl_get_vertex_attribf = new cpp.Callable<Int->Int->cpp.Float32>(cpp.Prime._loadPrime("lime", "lime_gl_get_vertex_attribf", "iif",
		false));
	private static var lime_gl_get_vertex_attribfv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_vertex_attribfv", "iidv", false));
	private static var lime_gl_get_vertex_attribi = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_vertex_attribi", "iii", false));
	private static var lime_gl_get_vertex_attribiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_vertex_attribiv", "iidv", false));
	private static var lime_gl_get_vertex_attribii = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_vertex_attribii", "iii",
		false));
	private static var lime_gl_get_vertex_attribiiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_vertex_attribiiv", "iidv", false));
	private static var lime_gl_get_vertex_attribiui = new cpp.Callable<Int->Int->Int>(cpp.Prime._loadPrime("lime", "lime_gl_get_vertex_attribiui", "iii",
		false));
	private static var lime_gl_get_vertex_attribiuiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_vertex_attribiuiv", "iidv", false));
	private static var lime_gl_get_vertex_attrib_pointerv = new cpp.Callable<Int->Int->lime.utils.DataPointer>(cpp.Prime._loadPrime("lime",
		"lime_gl_get_vertex_attrib_pointerv", "iid", false));
	private static var lime_gl_hint = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_hint", "iiv", false));
	private static var lime_gl_invalidate_framebuffer = new cpp.Callable<Int->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_invalidate_framebuffer", "iov", false));
	private static var lime_gl_invalidate_sub_framebuffer = new cpp.Callable<Int->cpp.Object->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_invalidate_sub_framebuffer", "ioiiiiv", false));
	private static var lime_gl_is_buffer = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_buffer", "ib", false));
	private static var lime_gl_is_enabled = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_enabled", "ib", false));
	private static var lime_gl_is_framebuffer = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_framebuffer", "ib", false));
	private static var lime_gl_is_program = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_program", "ib", false));
	private static var lime_gl_is_query = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_query", "ib", false));
	private static var lime_gl_is_renderbuffer = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_renderbuffer", "ib", false));
	private static var lime_gl_is_sampler = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_sampler", "ib", false));
	private static var lime_gl_is_shader = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_shader", "ib", false));
	private static var lime_gl_is_sync = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_sync", "ob", false));
	private static var lime_gl_is_texture = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_texture", "ib", false));
	private static var lime_gl_is_transform_feedback = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_transform_feedback", "ib", false));
	private static var lime_gl_is_vertex_array = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_is_vertex_array", "ib", false));
	private static var lime_gl_line_width = new cpp.Callable<cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_line_width", "fv", false));
	private static var lime_gl_link_program = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_link_program", "iv", false));
	private static var lime_gl_map_buffer_range = new cpp.Callable<Int->lime.utils.DataPointer->Int->Int->lime.utils.DataPointer>(cpp.Prime._loadPrime("lime",
		"lime_gl_map_buffer_range", "idiid", false));
	private static var lime_gl_object_deregister = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_object_deregister", "ov",
		false));
	private static var lime_gl_object_from_id = new cpp.Callable<Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_object_from_id", "iio", false));
	private static var lime_gl_object_register = new cpp.Callable<Int->Int->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_gl_object_register",
		"iioo", false));
	private static var lime_gl_pause_transform_feedback = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_pause_transform_feedback",
		"v", false));
	private static var lime_gl_pixel_storei = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_pixel_storei", "iiv", false));
	private static var lime_gl_polygon_offset = new cpp.Callable<cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_polygon_offset",
		"ffv", false));
	private static var lime_gl_program_binary = new cpp.Callable<Int->Int->lime.utils.DataPointer->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_program_binary", "iidiv", false));
	private static var lime_gl_program_parameteri = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_program_parameteri",
		"iiiv", false));
	private static var lime_gl_read_buffer = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_read_buffer", "iv", false));
	private static var lime_gl_read_pixels = new cpp.Callable<Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_read_pixels", "iiiiiidv", false));
	private static var lime_gl_release_shader_compiler = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_release_shader_compiler", "v",
		false));
	private static var lime_gl_renderbuffer_storage = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_renderbuffer_storage", "iiiiv", false));
	private static var lime_gl_renderbuffer_storage_multisample = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_renderbuffer_storage_multisample", "iiiiiv", false));
	private static var lime_gl_resume_transform_feedback = new cpp.Callable<Void->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_resume_transform_feedback",
		"v", false));
	private static var lime_gl_sample_coverage = new cpp.Callable<cpp.Float32->Bool->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_sample_coverage", "fbv",
		false));
	private static var lime_gl_sampler_parameterf = new cpp.Callable<Int->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_sampler_parameterf", "iifv", false));
	private static var lime_gl_sampler_parameteri = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_sampler_parameteri",
		"iiiv", false));
	private static var lime_gl_scissor = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_scissor", "iiiiv", false));
	private static var lime_gl_shader_binary = new cpp.Callable<cpp.Object->Int->lime.utils.DataPointer->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_shader_binary", "oidiv", false));
	private static var lime_gl_shader_source = new cpp.Callable<Int->String->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_shader_source", "isv", false));
	private static var lime_gl_stencil_func = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_stencil_func", "iiiv", false));
	private static var lime_gl_stencil_func_separate = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_stencil_func_separate", "iiiiv", false));
	private static var lime_gl_stencil_mask = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_stencil_mask", "iv", false));
	private static var lime_gl_stencil_mask_separate = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_stencil_mask_separate",
		"iiv", false));
	private static var lime_gl_stencil_op = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_stencil_op", "iiiv", false));
	private static var lime_gl_stencil_op_separate = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_stencil_op_separate", "iiiiv", false));
	private static var lime_gl_tex_image_2d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_image_2d", "iiiiiiiidv", false));
	private static var lime_gl_tex_image_3d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_image_3d", "iiiiiiiiidv", false));
	private static var lime_gl_tex_parameterf = new cpp.Callable<Int->Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_parameterf",
		"iifv", false));
	private static var lime_gl_tex_parameteri = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_parameteri", "iiiv",
		false));
	private static var lime_gl_tex_storage_2d = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_storage_2d",
		"iiiiiv", false));
	private static var lime_gl_tex_storage_3d = new cpp.Callable<Int->Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_tex_storage_3d", "iiiiiiv", false));
	private static var lime_gl_tex_sub_image_2d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_sub_image_2d", "iiiiiiiidv", false));
	private static var lime_gl_tex_sub_image_3d = new cpp.Callable<Int->Int->Int->Int->Int->Int->Int->Int->Int->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_tex_sub_image_3d", "iiiiiiiiiidv", false));
	private static var lime_gl_transform_feedback_varyings = new cpp.Callable<Int->cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_transform_feedback_varyings", "ioiv", false));
	private static var lime_gl_uniform1f = new cpp.Callable<Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform1f", "ifv", false));
	private static var lime_gl_uniform1fv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform1fv",
		"iidv", false));
	private static var lime_gl_uniform1i = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform1i", "iiv", false));
	private static var lime_gl_uniform1iv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform1iv",
		"iidv", false));
	private static var lime_gl_uniform1ui = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform1ui", "iiv", false));
	private static var lime_gl_uniform1uiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform1uiv",
		"iidv", false));
	private static var lime_gl_uniform2f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform2f", "iffv",
		false));
	private static var lime_gl_uniform2fv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform2fv",
		"iidv", false));
	private static var lime_gl_uniform2i = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform2i", "iiiv", false));
	private static var lime_gl_uniform2iv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform2iv",
		"iidv", false));
	private static var lime_gl_uniform2ui = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform2ui", "iiiv", false));
	private static var lime_gl_uniform2uiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform2uiv",
		"iidv", false));
	private static var lime_gl_uniform3f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform3f", "ifffv", false));
	private static var lime_gl_uniform3fv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform3fv",
		"iidv", false));
	private static var lime_gl_uniform3i = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform3i", "iiiiv", false));
	private static var lime_gl_uniform3iv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform3iv",
		"iidv", false));
	private static var lime_gl_uniform3ui = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform3ui", "iiiiv", false));
	private static var lime_gl_uniform3uiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform3uiv",
		"iidv", false));
	private static var lime_gl_uniform4f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform4f", "iffffv", false));
	private static var lime_gl_uniform4fv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform4fv",
		"iidv", false));
	private static var lime_gl_uniform4i = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform4i", "iiiiiv",
		false));
	private static var lime_gl_uniform4iv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform4iv",
		"iidv", false));
	private static var lime_gl_uniform4ui = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform4ui", "iiiiiv",
		false));
	private static var lime_gl_uniform4uiv = new cpp.Callable<Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform4uiv",
		"iidv", false));
	private static var lime_gl_uniform_block_binding = new cpp.Callable<Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_uniform_block_binding",
		"iiiv", false));
	private static var lime_gl_uniform_matrix2fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix2fv", "iibdv", false));
	private static var lime_gl_uniform_matrix2x3fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix2x3fv", "iibdv", false));
	private static var lime_gl_uniform_matrix2x4fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix2x4fv", "iibdv", false));
	private static var lime_gl_uniform_matrix3fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix3fv", "iibdv", false));
	private static var lime_gl_uniform_matrix3x2fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix3x2fv", "iibdv", false));
	private static var lime_gl_uniform_matrix3x4fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix3x4fv", "iibdv", false));
	private static var lime_gl_uniform_matrix4fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix4fv", "iibdv", false));
	private static var lime_gl_uniform_matrix4x2fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix4x2fv", "iibdv", false));
	private static var lime_gl_uniform_matrix4x3fv = new cpp.Callable<Int->Int->Bool->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_uniform_matrix4x3fv", "iibdv", false));
	private static var lime_gl_unmap_buffer = new cpp.Callable<Int->Bool>(cpp.Prime._loadPrime("lime", "lime_gl_unmap_buffer", "ib", false));
	private static var lime_gl_use_program = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_use_program", "iv", false));
	private static var lime_gl_validate_program = new cpp.Callable<Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_validate_program", "iv", false));
	private static var lime_gl_vertex_attrib1f = new cpp.Callable<Int->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_vertex_attrib1f", "ifv",
		false));
	private static var lime_gl_vertex_attrib1fv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib1fv", "idv", false));
	private static var lime_gl_vertex_attrib2f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib2f", "iffv", false));
	private static var lime_gl_vertex_attrib2fv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib2fv", "idv", false));
	private static var lime_gl_vertex_attrib3f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib3f", "ifffv", false));
	private static var lime_gl_vertex_attrib3fv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib3fv", "idv", false));
	private static var lime_gl_vertex_attrib4f = new cpp.Callable<Int->cpp.Float32->cpp.Float32->cpp.Float32->cpp.Float32->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_vertex_attrib4f", "iffffv", false));
	private static var lime_gl_vertex_attrib4fv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib4fv", "idv", false));
	private static var lime_gl_vertex_attribi4i = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_vertex_attribi4i",
		"iiiiiv", false));
	private static var lime_gl_vertex_attribi4iv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attribi4iv", "idv", false));
	private static var lime_gl_vertex_attribi4ui = new cpp.Callable<Int->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attribi4ui", "iiiiiv", false));
	private static var lime_gl_vertex_attribi4uiv = new cpp.Callable<Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attribi4uiv", "idv", false));
	private static var lime_gl_vertex_attrib_divisor = new cpp.Callable<Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_vertex_attrib_divisor",
		"iiv", false));
	private static var lime_gl_vertex_attrib_ipointer = new cpp.Callable<Int->Int->Int->Int->lime.utils.DataPointer->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_gl_vertex_attrib_ipointer", "iiiidv", false));
	private static var lime_gl_vertex_attrib_pointer = new cpp.Callable<Int->Int->Int->Bool->Int->lime.utils.DataPointer->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_vertex_attrib_pointer", "iiibidv", false));
	private static var lime_gl_viewport = new cpp.Callable<Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_viewport", "iiiiv", false));
	private static var lime_gl_wait_sync = new cpp.Callable<cpp.Object->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_gl_wait_sync", "oiiiv",
		false));
	#end
	#end
	#if (lime_cffi && !macro && lime_harfbuzz)
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_hb_blob_create(data:DataPointer, length:Int, memoryMode:Int):CFFIPointer;

	@:cffi private static function lime_hb_blob_create_sub_blob(parent:CFFIPointer, offset:Int, length:Int):CFFIPointer;

	@:cffi private static function lime_hb_blob_get_data(blob:CFFIPointer):Float;

	@:cffi private static function lime_hb_blob_get_data_writable(blob:CFFIPointer):Float;

	@:cffi private static function lime_hb_blob_get_empty():CFFIPointer;

	@:cffi private static function lime_hb_blob_get_length(blob:CFFIPointer):Int;

	@:cffi private static function lime_hb_blob_is_immutable(blob:CFFIPointer):Bool;

	@:cffi private static function lime_hb_blob_make_immutable(blob:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_add(buffer:CFFIPointer, codepoint:Int, cluster:Int):Void;

	@:cffi private static function lime_hb_buffer_add_codepoints(buffer:CFFIPointer, text:DataPointer, textLength:Int, itemOffset:Int, itemLength:Int):Void;

	@:cffi private static function lime_hb_buffer_add_utf8(buffer:CFFIPointer, text:String, itemOffset:Int, itemLength:Int):Void;

	@:cffi private static function lime_hb_buffer_add_utf16(buffer:CFFIPointer, text:DataPointer, textLength:Int, itemOffset:Int, itemLength:Int):Void;

	@:cffi private static function lime_hb_buffer_add_utf32(buffer:CFFIPointer, text:DataPointer, textLength:Int, itemOffset:Int, itemLength:Int):Void;

	@:cffi private static function lime_hb_buffer_allocation_successful(buffer:CFFIPointer):Bool;

	@:cffi private static function lime_hb_buffer_clear_contents(buffer:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_create():CFFIPointer;

	@:cffi private static function lime_hb_buffer_get_cluster_level(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_content_type(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_direction(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_empty():CFFIPointer;

	@:cffi private static function lime_hb_buffer_get_flags(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_glyph_infos(buffer:CFFIPointer, bytes:Bytes):Bytes;

	@:cffi private static function lime_hb_buffer_get_glyph_positions(buffer:CFFIPointer, bytes:Bytes):Bytes;

	@:cffi private static function lime_hb_buffer_get_language(buffer:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_buffer_get_length(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_replacement_codepoint(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_script(buffer:CFFIPointer):Int;

	@:cffi private static function lime_hb_buffer_get_segment_properties(buffer:CFFIPointer, props:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_guess_segment_properties(buffer:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_normalize_glyphs(buffer:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_preallocate(buffer:CFFIPointer, size:Int):Bool;

	@:cffi private static function lime_hb_buffer_reset(buffer:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_reverse(buffer:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_reverse_clusters(buffer:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_serialize_format_from_string(str:String):Int;

	@:cffi private static function lime_hb_buffer_serialize_format_to_string(format:Int):CFFIPointer;

	@:cffi private static function lime_hb_buffer_serialize_list_formats():CFFIPointer;

	@:cffi private static function lime_hb_buffer_set_cluster_level(buffer:CFFIPointer, clusterLevel:Int):Void;

	@:cffi private static function lime_hb_buffer_set_content_type(buffer:CFFIPointer, contentType:Int):Void;

	@:cffi private static function lime_hb_buffer_set_direction(buffer:CFFIPointer, direction:Int):Void;

	@:cffi private static function lime_hb_buffer_set_flags(buffer:CFFIPointer, flags:Int):Void;

	@:cffi private static function lime_hb_buffer_set_language(buffer:CFFIPointer, language:CFFIPointer):Void;

	@:cffi private static function lime_hb_buffer_set_length(buffer:CFFIPointer, length:Int):Bool;

	@:cffi private static function lime_hb_buffer_set_replacement_codepoint(buffer:CFFIPointer, replacement:Int):Void;

	@:cffi private static function lime_hb_buffer_set_script(buffer:CFFIPointer, script:Int):Void;

	@:cffi private static function lime_hb_buffer_set_segment_properties(buffer:CFFIPointer, props:CFFIPointer):Void;

	@:cffi private static function lime_hb_face_create(blob:CFFIPointer, index:Int):CFFIPointer;

	@:cffi private static function lime_hb_face_get_empty():CFFIPointer;

	@:cffi private static function lime_hb_face_get_glyph_count(face:CFFIPointer):Int;

	@:cffi private static function lime_hb_face_get_index(face:CFFIPointer):Int;

	@:cffi private static function lime_hb_face_get_upem(face:CFFIPointer):Int;

	@:cffi private static function lime_hb_face_is_immutable(face:CFFIPointer):Bool;

	@:cffi private static function lime_hb_face_make_immutable(face:CFFIPointer):Void;

	@:cffi private static function lime_hb_face_reference_blob(face:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_face_reference_table(face:CFFIPointer, tag:Int):CFFIPointer;

	@:cffi private static function lime_hb_face_set_glyph_count(face:CFFIPointer, glyphCount:Int):Void;

	@:cffi private static function lime_hb_face_set_index(face:CFFIPointer, index:Int):Void;

	@:cffi private static function lime_hb_face_set_upem(face:CFFIPointer, upem:Int):Void;

	@:cffi private static function lime_hb_feature_from_string(str:String):CFFIPointer;

	@:cffi private static function lime_hb_feature_to_string(feature:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_add_glyph_origin_for_direction(font:CFFIPointer, glyph:Int, direction:Int, x:Int, y:Int):Void;

	@:cffi private static function lime_hb_font_create(face:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_create_sub_font(parent:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_get_empty():CFFIPointer;

	@:cffi private static function lime_hb_font_get_face(font:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_get_glyph_advance_for_direction(font:CFFIPointer, glyph:Int, direction:Int):Dynamic;

	@:cffi private static function lime_hb_font_get_glyph_kerning_for_direction(font:CFFIPointer, firstGlyph:Int, secondGlyph:Int, direction:Int):Dynamic;

	@:cffi private static function lime_hb_font_get_glyph_origin_for_direction(font:CFFIPointer, glyph:Int, direction:Int):Dynamic;

	@:cffi private static function lime_hb_font_get_parent(font:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_get_ppem(font:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_get_scale(font:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_font_glyph_from_string(font:CFFIPointer, s:String):Int;

	@:cffi private static function lime_hb_font_glyph_to_string(font:CFFIPointer, codepoint:Int):CFFIPointer;

	@:cffi private static function lime_hb_font_is_immutable(font:CFFIPointer):Bool;

	@:cffi private static function lime_hb_font_make_immutable(font:CFFIPointer):Void;

	@:cffi private static function lime_hb_font_set_ppem(font:CFFIPointer, xppem:Int, yppem:Int):Void;

	@:cffi private static function lime_hb_font_set_scale(font:CFFIPointer, xScale:Int, yScale:Int):Void;

	@:cffi private static function lime_hb_font_subtract_glyph_origin_for_direction(font:CFFIPointer, glyph:Int, direction:Int, x:Int, y:Int):Void;

	@:cffi private static function lime_hb_ft_font_create(font:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_ft_font_create_referenced(font:CFFIPointer):CFFIPointer;

	@:cffi private static function lime_hb_ft_font_get_load_flags(font:CFFIPointer):Int;

	@:cffi private static function lime_hb_ft_font_set_load_flags(font:CFFIPointer, loadFlags:Int):Void;

	@:cffi private static function lime_hb_language_from_string(str:String):CFFIPointer;

	@:cffi private static function lime_hb_language_get_default():CFFIPointer;

	@:cffi private static function lime_hb_language_to_string(language:CFFIPointer):Dynamic;

	@:cffi private static function lime_hb_segment_properties_equal(a:CFFIPointer, b:CFFIPointer):Bool;

	@:cffi private static function lime_hb_segment_properties_hash(p:CFFIPointer):Int;

	@:cffi private static function lime_hb_set_add(set:CFFIPointer, codepoint:Int):Void;

	@:cffi private static function lime_hb_set_add_range(set:CFFIPointer, first:Int, last:Int):Void;

	@:cffi private static function lime_hb_set_allocation_successful(set:CFFIPointer):Bool;

	@:cffi private static function lime_hb_set_clear(set:CFFIPointer):Void;

	@:cffi private static function lime_hb_set_create():CFFIPointer;

	@:cffi private static function lime_hb_set_del(set:CFFIPointer, codepoint:Int):Void;

	@:cffi private static function lime_hb_set_del_range(set:CFFIPointer, first:Int, last:Int):Void;

	@:cffi private static function lime_hb_set_get_empty():CFFIPointer;

	@:cffi private static function lime_hb_set_get_max(set:CFFIPointer):Int;

	@:cffi private static function lime_hb_set_get_min(set:CFFIPointer):Int;

	@:cffi private static function lime_hb_set_get_population(set:CFFIPointer):Int;

	@:cffi private static function lime_hb_set_has(set:CFFIPointer, codepoint:Int):Bool;

	@:cffi private static function lime_hb_set_intersect(set:CFFIPointer, other:CFFIPointer):Void;

	@:cffi private static function lime_hb_set_invert(set:CFFIPointer):Void;

	@:cffi private static function lime_hb_set_is_empty(set:CFFIPointer):Bool;

	@:cffi private static function lime_hb_set_is_equal(set:CFFIPointer, other:CFFIPointer):Bool;

	@:cffi private static function lime_hb_set_next(set:CFFIPointer):Int;

	@:cffi private static function lime_hb_set_next_range(set:CFFIPointer):Dynamic;

	@:cffi private static function lime_hb_set_set(set:CFFIPointer, other:CFFIPointer):Void;

	@:cffi private static function lime_hb_set_subtract(set:CFFIPointer, other:CFFIPointer):Void;

	@:cffi private static function lime_hb_set_symmetric_difference(set:CFFIPointer, other:CFFIPointer):Void;

	@:cffi private static function lime_hb_set_union(set:CFFIPointer, other:CFFIPointer):Void;

	@:cffi private static function lime_hb_shape(font:CFFIPointer, buffer:CFFIPointer, features:Dynamic):Void;
	#else
	private static var lime_hb_blob_create = new cpp.Callable<lime.utils.DataPointer->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_blob_create", "diio", false));
	private static var lime_hb_blob_create_sub_blob = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_blob_create_sub_blob", "oiio", false));
	private static var lime_hb_blob_get_data = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_hb_blob_get_data", "od", false));
	private static var lime_hb_blob_get_data_writable = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_hb_blob_get_data_writable",
		"od", false));
	private static var lime_hb_blob_get_empty = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_blob_get_empty", "o", false));
	private static var lime_hb_blob_get_length = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_blob_get_length", "oi", false));
	private static var lime_hb_blob_is_immutable = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_blob_is_immutable", "ob", false));
	private static var lime_hb_blob_make_immutable = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_blob_make_immutable", "ov",
		false));
	private static var lime_hb_buffer_add = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_add", "oiiv",
		false));
	private static var lime_hb_buffer_add_codepoints = new cpp.Callable<cpp.Object->lime.utils.DataPointer->Int->Int->Int->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_add_codepoints", "odiiiv", false));
	private static var lime_hb_buffer_add_utf8 = new cpp.Callable<cpp.Object->String->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_add_utf8", "osiiv", false));
	private static var lime_hb_buffer_add_utf16 = new cpp.Callable<cpp.Object->lime.utils.DataPointer->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_add_utf16", "odiiiv", false));
	private static var lime_hb_buffer_add_utf32 = new cpp.Callable<cpp.Object->lime.utils.DataPointer->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_add_utf32", "odiiiv", false));
	private static var lime_hb_buffer_allocation_successful = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_allocation_successful", "ob", false));
	private static var lime_hb_buffer_clear_contents = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_clear_contents",
		"ov", false));
	private static var lime_hb_buffer_create = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_create", "o", false));
	private static var lime_hb_buffer_get_cluster_level = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_cluster_level",
		"oi", false));
	private static var lime_hb_buffer_get_content_type = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_content_type",
		"oi", false));
	private static var lime_hb_buffer_get_direction = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_direction", "oi",
		false));
	private static var lime_hb_buffer_get_empty = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_empty", "o", false));
	private static var lime_hb_buffer_get_flags = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_flags", "oi", false));
	private static var lime_hb_buffer_get_glyph_infos = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_get_glyph_infos", "ooo", false));
	private static var lime_hb_buffer_get_glyph_positions = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_get_glyph_positions", "ooo", false));
	private static var lime_hb_buffer_get_language = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_language",
		"oo", false));
	private static var lime_hb_buffer_get_length = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_length", "oi", false));
	private static var lime_hb_buffer_get_replacement_codepoint = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_get_replacement_codepoint", "oi", false));
	private static var lime_hb_buffer_get_script = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_get_script", "oi", false));
	private static var lime_hb_buffer_get_segment_properties = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_get_segment_properties", "oov", false));
	private static var lime_hb_buffer_guess_segment_properties = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_guess_segment_properties", "ov", false));
	private static var lime_hb_buffer_normalize_glyphs = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_normalize_glyphs", "ov", false));
	private static var lime_hb_buffer_preallocate = new cpp.Callable<cpp.Object->Int->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_preallocate", "oib",
		false));
	private static var lime_hb_buffer_reset = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_reset", "ov", false));
	private static var lime_hb_buffer_reverse = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_reverse", "ov", false));
	private static var lime_hb_buffer_reverse_clusters = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_reverse_clusters", "ov", false));
	private static var lime_hb_buffer_serialize_format_from_string = new cpp.Callable<String->Int>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_serialize_format_from_string", "si", false));
	private static var lime_hb_buffer_serialize_format_to_string = new cpp.Callable<Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_serialize_format_to_string", "io", false));
	private static var lime_hb_buffer_serialize_list_formats = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_serialize_list_formats", "o", false));
	private static var lime_hb_buffer_set_cluster_level = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_set_cluster_level", "oiv", false));
	private static var lime_hb_buffer_set_content_type = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_set_content_type", "oiv", false));
	private static var lime_hb_buffer_set_direction = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_set_direction",
		"oiv", false));
	private static var lime_hb_buffer_set_flags = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_set_flags", "oiv",
		false));
	private static var lime_hb_buffer_set_language = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_set_language", "oov", false));
	private static var lime_hb_buffer_set_length = new cpp.Callable<cpp.Object->Int->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_set_length", "oib",
		false));
	private static var lime_hb_buffer_set_replacement_codepoint = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_set_replacement_codepoint", "oiv", false));
	private static var lime_hb_buffer_set_script = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_buffer_set_script",
		"oiv", false));
	private static var lime_hb_buffer_set_segment_properties = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_buffer_set_segment_properties", "oov", false));
	private static var lime_hb_face_create = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_face_create", "oio", false));
	private static var lime_hb_face_get_empty = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_face_get_empty", "o", false));
	private static var lime_hb_face_get_glyph_count = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_face_get_glyph_count", "oi",
		false));
	private static var lime_hb_face_get_index = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_face_get_index", "oi", false));
	private static var lime_hb_face_get_upem = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_face_get_upem", "oi", false));
	private static var lime_hb_face_is_immutable = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_face_is_immutable", "ob", false));
	private static var lime_hb_face_make_immutable = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_face_make_immutable", "ov",
		false));
	private static var lime_hb_face_reference_blob = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_face_reference_blob",
		"oo", false));
	private static var lime_hb_face_reference_table = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_face_reference_table", "oio", false));
	private static var lime_hb_face_set_glyph_count = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_face_set_glyph_count",
		"oiv", false));
	private static var lime_hb_face_set_index = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_face_set_index", "oiv",
		false));
	private static var lime_hb_face_set_upem = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_face_set_upem", "oiv",
		false));
	private static var lime_hb_feature_from_string = new cpp.Callable<String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_feature_from_string", "so",
		false));
	private static var lime_hb_feature_to_string = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_feature_to_string", "oo",
		false));
	private static var lime_hb_font_add_glyph_origin_for_direction = new cpp.Callable<cpp.Object->Int->Int->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_font_add_glyph_origin_for_direction", "oiiiiv", false));
	private static var lime_hb_font_create = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_create", "oo", false));
	private static var lime_hb_font_create_sub_font = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_create_sub_font",
		"oo", false));
	private static var lime_hb_font_get_empty = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_get_empty", "o", false));
	private static var lime_hb_font_get_face = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_get_face", "oo", false));
	private static var lime_hb_font_get_glyph_advance_for_direction = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_font_get_glyph_advance_for_direction", "oiio", false));
	private static var lime_hb_font_get_glyph_kerning_for_direction = new cpp.Callable<cpp.Object->Int->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_font_get_glyph_kerning_for_direction", "oiiio", false));
	private static var lime_hb_font_get_glyph_origin_for_direction = new cpp.Callable<cpp.Object->Int->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_font_get_glyph_origin_for_direction", "oiio", false));
	private static var lime_hb_font_get_parent = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_get_parent", "oo",
		false));
	private static var lime_hb_font_get_ppem = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_get_ppem", "oo", false));
	private static var lime_hb_font_get_scale = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_font_get_scale", "oo", false));
	private static var lime_hb_font_glyph_from_string = new cpp.Callable<cpp.Object->String->Int>(cpp.Prime._loadPrime("lime",
		"lime_hb_font_glyph_from_string", "osi", false));
	private static var lime_hb_font_glyph_to_string = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_font_glyph_to_string", "oio", false));
	private static var lime_hb_font_is_immutable = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_font_is_immutable", "ob", false));
	private static var lime_hb_font_make_immutable = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_font_make_immutable", "ov",
		false));
	private static var lime_hb_font_set_ppem = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_font_set_ppem", "oiiv",
		false));
	private static var lime_hb_font_set_scale = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_font_set_scale",
		"oiiv", false));
	private static var lime_hb_font_subtract_glyph_origin_for_direction = new cpp.Callable<cpp.Object->Int->Int->Int->Int->
		cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_font_subtract_glyph_origin_for_direction", "oiiiiv", false));
	private static var lime_hb_ft_font_create = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_ft_font_create", "oo", false));
	private static var lime_hb_ft_font_create_referenced = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_hb_ft_font_create_referenced", "oo", false));
	private static var lime_hb_ft_font_get_load_flags = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_ft_font_get_load_flags", "oi",
		false));
	private static var lime_hb_ft_font_set_load_flags = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_ft_font_set_load_flags", "oiv", false));
	private static var lime_hb_language_from_string = new cpp.Callable<String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_language_from_string", "so",
		false));
	private static var lime_hb_language_get_default = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_language_get_default", "o",
		false));
	private static var lime_hb_language_to_string = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_language_to_string", "oo",
		false));
	private static var lime_hb_segment_properties_equal = new cpp.Callable<cpp.Object->cpp.Object->Bool>(cpp.Prime._loadPrime("lime",
		"lime_hb_segment_properties_equal", "oob", false));
	private static var lime_hb_segment_properties_hash = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_segment_properties_hash",
		"oi", false));
	private static var lime_hb_set_add = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_add", "oiv", false));
	private static var lime_hb_set_add_range = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_add_range", "oiiv",
		false));
	private static var lime_hb_set_allocation_successful = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime",
		"lime_hb_set_allocation_successful", "ob", false));
	private static var lime_hb_set_clear = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_clear", "ov", false));
	private static var lime_hb_set_create = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_set_create", "o", false));
	private static var lime_hb_set_del = new cpp.Callable<cpp.Object->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_del", "oiv", false));
	private static var lime_hb_set_del_range = new cpp.Callable<cpp.Object->Int->Int->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_del_range", "oiiv",
		false));
	private static var lime_hb_set_get_empty = new cpp.Callable<Void->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_set_get_empty", "o", false));
	private static var lime_hb_set_get_max = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_set_get_max", "oi", false));
	private static var lime_hb_set_get_min = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_set_get_min", "oi", false));
	private static var lime_hb_set_get_population = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_set_get_population", "oi", false));
	private static var lime_hb_set_has = new cpp.Callable<cpp.Object->Int->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_set_has", "oib", false));
	private static var lime_hb_set_intersect = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_intersect", "oov",
		false));
	private static var lime_hb_set_invert = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_invert", "ov", false));
	private static var lime_hb_set_is_empty = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_set_is_empty", "ob", false));
	private static var lime_hb_set_is_equal = new cpp.Callable<cpp.Object->cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_hb_set_is_equal", "oob",
		false));
	private static var lime_hb_set_next = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_hb_set_next", "oi", false));
	private static var lime_hb_set_next_range = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_hb_set_next_range", "oo", false));
	private static var lime_hb_set_set = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_set", "oov", false));
	private static var lime_hb_set_subtract = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_subtract", "oov",
		false));
	private static var lime_hb_set_symmetric_difference = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime",
		"lime_hb_set_symmetric_difference", "oov", false));
	private static var lime_hb_set_union = new cpp.Callable<cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_set_union", "oov", false));
	private static var lime_hb_shape = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_hb_shape", "ooov",
		false));
	#end
	#end
	#if (lime_cffi && !macro && lime_vorbis)
	#if cpp
	#if disable_cffi
	@:cffi private static function lime_vorbis_file_bitrate(vorbisFile:Dynamic, bitstream:Int):Int;

	@:cffi private static function lime_vorbis_file_bitrate_instant(vorbisFile:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_clear(vorbisFile:Dynamic):Void;

	@:cffi private static function lime_vorbis_file_comment(vorbisFile:Dynamic, bitstream:Int):Dynamic;

	@:cffi private static function lime_vorbis_file_crosslap(vorbisFile:Dynamic, otherVorbisFile:Dynamic):Dynamic;

	@:cffi private static function lime_vorbis_file_from_bytes(bytes:Dynamic):Dynamic;

	@:cffi private static function lime_vorbis_file_from_file(path:String):Dynamic;

	@:cffi private static function lime_vorbis_file_info(vorbisFile:Dynamic, bitstream:Int):Dynamic;

	@:cffi private static function lime_vorbis_file_pcm_seek(vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_pcm_seek_lap(vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_pcm_seek_page(vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_pcm_seek_page_lap(vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_raw_seek(vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_raw_seek_lap(vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_pcm_tell(vorbisFile:Dynamic):Dynamic;

	@:cffi private static function lime_vorbis_file_pcm_total(vorbisFile:Dynamic, bitstream:Int):Dynamic;

	@:cffi private static function lime_vorbis_file_raw_tell(vorbisFile:Dynamic):Dynamic;

	@:cffi private static function lime_vorbis_file_raw_total(vorbisFile:Dynamic, bitstream:Int):Dynamic;

	@:cffi private static function lime_vorbis_file_read(vorbisFile:Dynamic, buffer:Dynamic, position:Int, length:Int, bigendianp:Bool, word:Int,
		signed:Bool):Dynamic;

	@:cffi private static function lime_vorbis_file_read_float(vorbisFile:Dynamic, pcmChannels:Dynamic, samples:Int):Dynamic;

	@:cffi private static function lime_vorbis_file_seekable(vorbisFile:Dynamic):Bool;

	@:cffi private static function lime_vorbis_file_serial_number(vorbisFile:Dynamic, bitstream:Int):Int;

	@:cffi private static function lime_vorbis_file_streams(vorbisFile:Dynamic):Int;

	@:cffi private static function lime_vorbis_file_time_seek(vorbisFile:Dynamic, s:Float):Int;

	@:cffi private static function lime_vorbis_file_time_seek_lap(vorbisFile:Dynamic, s:Float):Int;

	@:cffi private static function lime_vorbis_file_time_seek_page(vorbisFile:Dynamic, s:Float):Int;

	@:cffi private static function lime_vorbis_file_time_seek_page_lap(vorbisFile:Dynamic, s:Float):Int;

	@:cffi private static function lime_vorbis_file_time_tell(vorbisFile:Dynamic):Float;

	@:cffi private static function lime_vorbis_file_time_total(vorbisFile:Dynamic, bitstream:Int):Float;
	#else
	private static var lime_vorbis_file_bitrate = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_bitrate", "oii",
		false));
	private static var lime_vorbis_file_bitrate_instant = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_bitrate_instant",
		"oi", false));
	private static var lime_vorbis_file_clear = new cpp.Callable<cpp.Object->cpp.Void>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_clear", "ov", false));
	private static var lime_vorbis_file_comment = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_comment",
		"oio", false));
	private static var lime_vorbis_file_crosslap = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_crosslap", "ooo", false));
	private static var lime_vorbis_file_from_bytes = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_from_bytes",
		"oo", false));
	private static var lime_vorbis_file_from_file = new cpp.Callable<String->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_from_file", "so",
		false));
	private static var lime_vorbis_file_info = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_info", "oio",
		false));
	private static var lime_vorbis_file_pcm_seek = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_pcm_seek", "oooi", false));
	private static var lime_vorbis_file_pcm_seek_lap = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_pcm_seek_lap", "oooi", false));
	private static var lime_vorbis_file_pcm_seek_page = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_pcm_seek_page", "oooi", false));
	private static var lime_vorbis_file_pcm_seek_page_lap = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_pcm_seek_page_lap", "oooi", false));
	private static var lime_vorbis_file_raw_seek = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_raw_seek", "oooi", false));
	private static var lime_vorbis_file_raw_seek_lap = new cpp.Callable<cpp.Object->cpp.Object->cpp.Object->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_raw_seek_lap", "oooi", false));
	private static var lime_vorbis_file_pcm_tell = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_pcm_tell", "oo",
		false));
	private static var lime_vorbis_file_pcm_total = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_pcm_total",
		"oio", false));
	private static var lime_vorbis_file_raw_tell = new cpp.Callable<cpp.Object->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_raw_tell", "oo",
		false));
	private static var lime_vorbis_file_raw_total = new cpp.Callable<cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_raw_total",
		"oio", false));
	private static var lime_vorbis_file_read = new cpp.Callable<cpp.Object->cpp.Object->Int->Int->Bool->Int->Bool->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_read", "ooiibibo", false));
	private static var lime_vorbis_file_read_float = new cpp.Callable<cpp.Object->cpp.Object->Int->cpp.Object>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_read_float", "ooio", false));
	private static var lime_vorbis_file_seekable = new cpp.Callable<cpp.Object->Bool>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_seekable", "ob", false));
	private static var lime_vorbis_file_serial_number = new cpp.Callable<cpp.Object->Int->Int>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_serial_number",
		"oii", false));
	private static var lime_vorbis_file_streams = new cpp.Callable<cpp.Object->Int>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_streams", "oi", false));
	private static var lime_vorbis_file_time_seek = new cpp.Callable<cpp.Object->Float->Int>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_time_seek", "odi",
		false));
	private static var lime_vorbis_file_time_seek_lap = new cpp.Callable<cpp.Object->Float->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_time_seek_lap", "odi", false));
	private static var lime_vorbis_file_time_seek_page = new cpp.Callable<cpp.Object->Float->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_time_seek_page", "odi", false));
	private static var lime_vorbis_file_time_seek_page_lap = new cpp.Callable<cpp.Object->Float->Int>(cpp.Prime._loadPrime("lime",
		"lime_vorbis_file_time_seek_page_lap", "odi", false));
	private static var lime_vorbis_file_time_tell = new cpp.Callable<cpp.Object->Float>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_time_tell", "od",
		false));
	private static var lime_vorbis_file_time_total = new cpp.Callable<cpp.Object->Int->Float>(cpp.Prime._loadPrime("lime", "lime_vorbis_file_time_total",
		"oid", false));
	#end
	#end
}
