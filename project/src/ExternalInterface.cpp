#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <app/Application.h>
#include <app/ApplicationEvent.h>
#include <graphics/format/JPEG.h>
#include <graphics/format/PNG.h>
#include <graphics/Image.h>
#include <graphics/ImageBuffer.h>
#include <graphics/RenderEvent.h>
#include <media/containers/OGG.h>
#include <media/containers/WAV.h>
#include <media/AudioBuffer.h>
#include <system/CFFIPointer.h>
#include <system/Clipboard.h>
#include <system/ClipboardEvent.h>
#include <system/Endian.h>
#include <system/FileWatcher.h>
#include <system/OrientationEvent.h>
#include <system/SensorEvent.h>
#include <system/System.h>
#include <text/Font.h>
#include <ui/Cursor.h>
#include <ui/DropEvent.h>
#include <ui/FileDialog.h>
#include <ui/Gamepad.h>
#include <ui/GamepadEvent.h>
#include <ui/Haptic.h>
#include <ui/Joystick.h>
#include <ui/JoystickEvent.h>
#include <ui/KeyCode.h>
#include <ui/KeyEvent.h>
#include <ui/MouseEvent.h>
#include <ui/TextEvent.h>
#include <ui/TouchEvent.h>
#include <ui/Window.h>
#include <ui/WindowEvent.h>
#include <utils/compress/LZMA.h>
#include <utils/compress/Zlib.h>

#ifdef HX_WINDOWS
#include <codecvt>
#endif

#include <cstdlib>
#include <cstring>

DEFINE_KIND (k_finalizer);


namespace lime {


	void gc_application (value handle) {

		Application* application = (Application*)val_data (handle);
		delete application;

	}

	void gc_file_watcher (value handle) {

		#ifdef LIME_EFSW
		FileWatcher* watcher = (FileWatcher*)val_data (handle);
		delete watcher;
		#endif

	}


	void gc_font (value handle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (handle);
		delete font;
		#endif

	}


	void gc_window (value handle) {

		Window* window = (Window*)val_data (handle);
		delete window;

	}


	std::wstring* hxstring_to_wstring (HxString val) {

		if (val.c_str ()) {

			std::string _val = std::string (val.c_str ());
			#ifdef HX_WINDOWS
			std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;
			return new std::wstring (converter.from_bytes (_val));
			#else
			return new std::wstring (_val.begin (), _val.end ());
			#endif

		} else {

			return 0;

		}

	}


	value wstring_to_value (std::wstring* val) {

		if (val) {

			#ifdef HX_WINDOWS
			return alloc_wstring (val->c_str ());
			#else
			std::string _val = std::string (val->begin (), val->end ());
			return alloc_string (_val.c_str ());
			#endif

		} else {

			return 0;

		}

	}


	vbyte* wstring_to_vbytes (std::wstring* val) {

		if (val) {

			#ifdef HX_WINDOWS
			int size = std::wcslen (val->c_str ());
			char* result = (char*)malloc (size + 1);
			std::wcstombs (result, val->c_str (), size);
			result[size] = '\0';
			return (vbyte*)result;
			#else
			std::string _val = std::string (val->begin (), val->end ());
			int size = std::strlen (_val.c_str ());
			char* result = (char*)malloc (size + 1);
			std::strncpy (result, _val.c_str (), size);
			result[size] = '\0';
			return (vbyte*)result;
			#endif

		} else {

			return 0;

		}

	}


	value lime_application_create () {

		Application* application = CreateApplication ();
		return CFFIPointer (application, gc_application);

	}


	void lime_application_event_manager_register (value callback, value eventObject) {

		ApplicationEvent::callback = new ValuePointer (callback);
		ApplicationEvent::eventObject = new ValuePointer (eventObject);

	}


	int lime_application_exec (value application) {

		Application* app = (Application*)val_data (application);
		return app->Exec ();

	}


	void lime_application_init (value application) {

		Application* app = (Application*)val_data (application);
		app->Init ();

	}

	int lime_application_quit (value application) {

		Application* app = (Application*)val_data (application);
		return app->Quit ();

	}


	void lime_application_set_frame_rate (value application, double frameRate) {

		Application* app = (Application*)val_data (application);
		app->SetFrameRate (frameRate);

	}


	bool lime_application_update (value application) {

		Application* app = (Application*)val_data (application);
		return app->Update ();

	}


	value lime_audio_load_bytes (value data, value buffer) {

		Resource resource;
		Bytes bytes;

		AudioBuffer audioBuffer = AudioBuffer (buffer);

		bytes.Set (data);
		resource = Resource (&bytes);

		if (WAV::Decode (&resource, &audioBuffer)) {

			return audioBuffer.Value (buffer);

		}

		#ifdef LIME_OGG
		if (OGG::Decode (&resource, &audioBuffer)) {

			return audioBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	value lime_audio_load_file (value data, value buffer) {

		Resource resource;

		AudioBuffer audioBuffer = AudioBuffer (buffer);

		resource = Resource (val_string (data));

		if (WAV::Decode (&resource, &audioBuffer)) {

			return audioBuffer.Value (buffer);

		}

		#ifdef LIME_OGG
		if (OGG::Decode (&resource, &audioBuffer)) {

			return audioBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	value lime_audio_load (value data, value buffer) {

		if (val_is_string (data)) {

			return lime_audio_load_file (data, buffer);

		} else {

			return lime_audio_load_bytes (data, buffer);

		}

	}


	value lime_bytes_from_data_pointer (double data, int length, value _bytes) {

		uintptr_t ptr = (uintptr_t)data;
		Bytes bytes (_bytes);
		bytes.Resize (length);

		if (ptr) {

			memcpy (bytes.b, (const void*)ptr, length);

		}

		return bytes.Value (_bytes);

	}


	double lime_bytes_get_data_pointer (value bytes) {

		Bytes data = Bytes (bytes);
		return (uintptr_t)data.b;

	}


	double lime_bytes_get_data_pointer_offset (value bytes, int offset) {

		if (val_is_null (bytes)) return 0;

		Bytes data = Bytes (bytes);
		return (uintptr_t)data.b + offset;

	}


	value lime_bytes_read_file (HxString path, value bytes) {

		Bytes data (bytes);
		data.ReadFile (path.c_str ());
		return data.Value (bytes);

	}


	double lime_cffi_get_native_pointer (value handle) {

		return (uintptr_t)val_data (handle);

	}


	void lime_cffi_finalizer (value abstract) {

		val_call0 ((value)val_data (abstract));

	}


	value lime_cffi_set_finalizer (value callback) {

		value abstract = alloc_abstract (k_finalizer, callback);
		val_gc (abstract, lime_cffi_finalizer);
		return abstract;

	}


	void lime_clipboard_event_manager_register (value callback, value eventObject) {

		ClipboardEvent::callback = new ValuePointer (callback);
		ClipboardEvent::eventObject = new ValuePointer (eventObject);

	}


	value lime_clipboard_get_text () {

		if (Clipboard::HasText ()) {

			const char* text = Clipboard::GetText ();
			value _text = alloc_string (text);

			// TODO: Should we free for all backends? (SDL requires it)

			free ((char*)text);
			return _text;

		} else {

			return alloc_null ();

		}

	}


	void lime_clipboard_set_text (HxString text) {

		Clipboard::SetText (text.c_str ());

	}


	double lime_data_pointer_offset (double pointer, int offset) {

		return (uintptr_t)pointer + offset;

	}

	value lime_deflate_compress (value buffer, value bytes) {

		#ifdef LIME_ZLIB
		Bytes data (buffer);
		Bytes result (bytes);

		Zlib::Compress (DEFLATE, &data, &result);

		return result.Value (bytes);
		#else
		return alloc_null();
		#endif

	}


	value lime_deflate_decompress (value buffer, value bytes) {

		#ifdef LIME_ZLIB
		Bytes data (buffer);
		Bytes result (bytes);

		Zlib::Decompress (DEFLATE, &data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	void lime_drop_event_manager_register (value callback, value eventObject) {

		DropEvent::callback = new ValuePointer (callback);
		DropEvent::eventObject = new ValuePointer (eventObject);

	}


	value lime_file_dialog_open_directory (HxString title, HxString filter, HxString defaultPath) {

		#ifdef LIME_TINYFILEDIALOGS

		std::wstring* _title = hxstring_to_wstring (title);
		std::wstring* _filter = hxstring_to_wstring (filter);
		std::wstring* _defaultPath = hxstring_to_wstring (defaultPath);

		std::wstring* path;

		gc_enter_blocking ();
		path = FileDialog::OpenDirectory (_title, _filter, _defaultPath);
		gc_exit_blocking ();

		if (_title) delete _title;
		if (_filter) delete _filter;
		if (_defaultPath) delete _defaultPath;

		if (path) {

			value _path = wstring_to_value (path);
			delete path;
			return _path;

		} else {

			return alloc_null ();

		}

		#endif

		return alloc_null ();

	}


	value lime_file_dialog_open_file (HxString title, HxString filter, HxString defaultPath) {

		#ifdef LIME_TINYFILEDIALOGS

		std::wstring* _title = hxstring_to_wstring (title);
		std::wstring* _filter = hxstring_to_wstring (filter);
		std::wstring* _defaultPath = hxstring_to_wstring (defaultPath);

		std::wstring* path;

		gc_enter_blocking ();
		path = FileDialog::OpenFile (_title, _filter, _defaultPath);
		gc_exit_blocking ();

		if (_title) delete _title;
		if (_filter) delete _filter;
		if (_defaultPath) delete _defaultPath;

		if (path) {

			value _path = wstring_to_value (path);
			delete path;
			return _path;

		} else {

			return alloc_null ();

		}

		#endif

		return alloc_null ();

	}


	value lime_file_dialog_open_files (HxString title, HxString filter, HxString defaultPath) {

		#ifdef LIME_TINYFILEDIALOGS

		std::wstring* _title = hxstring_to_wstring (title);
		std::wstring* _filter = hxstring_to_wstring (filter);
		std::wstring* _defaultPath = hxstring_to_wstring (defaultPath);

		std::vector<std::wstring*> files;

		gc_enter_blocking ();
		FileDialog::OpenFiles (&files, _title, _filter, _defaultPath);
		gc_exit_blocking ();
		
		value result = alloc_array (files.size ());

		if (_title) delete _title;
		if (_filter) delete _filter;
		if (_defaultPath) delete _defaultPath;

		for (int i = 0; i < files.size (); i++) {

			value _file = wstring_to_value (files[i]);
			val_array_set_i (result, i, _file);
			delete files[i];

		}

		#else
		value result = alloc_array (0);
		#endif

		return result;

	}


	value lime_file_dialog_save_file (HxString title, HxString filter, HxString defaultPath) {

		#ifdef LIME_TINYFILEDIALOGS

		std::wstring* _title = hxstring_to_wstring (title);
		std::wstring* _filter = hxstring_to_wstring (filter);
		std::wstring* _defaultPath = hxstring_to_wstring (defaultPath);

		std::wstring* path;

		gc_enter_blocking ();
		path = FileDialog::SaveFile (_title, _filter, _defaultPath);
		gc_exit_blocking ();

		if (_title) delete _title;
		if (_filter) delete _filter;
		if (_defaultPath) delete _defaultPath;

		if (path) {

			value _path = wstring_to_value (path);
			delete path;
			return _path;

		} else {

			return alloc_null ();

		}

		#endif

		return alloc_null ();

	}


	value lime_file_watcher_create (value callback) {

		#ifdef LIME_EFSW
		FileWatcher* watcher = new FileWatcher (callback);
		return CFFIPointer (watcher, gc_file_watcher);
		#else
		return alloc_null ();
		#endif

	}


	value lime_file_watcher_add_directory (value handle, value path, bool recursive) {

		#ifdef LIME_EFSW
		FileWatcher* watcher = (FileWatcher*)val_data (handle);
		return alloc_int (watcher->AddDirectory (val_string (path), recursive));
		#else
		return alloc_int (0);
		#endif

	}


	void lime_file_watcher_remove_directory (value handle, value watchID) {

		#ifdef LIME_EFSW
		FileWatcher* watcher = (FileWatcher*)val_data (handle);
		watcher->RemoveDirectory (val_int (watchID));
		#endif

	}


	void lime_file_watcher_update (value handle) {

		#ifdef LIME_EFSW
		FileWatcher* watcher = (FileWatcher*)val_data (handle);
		watcher->Update ();
		#endif

	}


	int lime_font_get_ascender (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetAscender ();
		#else
		return 0;
		#endif

	}


	int lime_font_get_descender (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetDescender ();
		#else
		return 0;
		#endif

	}


	value lime_font_get_family_name (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		wchar_t *name = font->GetFamilyName ();
		value result = alloc_wstring (name);
		delete name;
		return result;
		#else
		return alloc_null ();
		#endif

	}


	int lime_font_get_glyph_index (value fontHandle, HxString character) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetGlyphIndex ((char*)character.c_str ());
		#else
		return -1;
		#endif

	}


	value lime_font_get_glyph_indices (value fontHandle, HxString characters) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return (value)font->GetGlyphIndices (true, (char*)characters.c_str ());
		#else
		return alloc_null ();
		#endif

	}


	value lime_font_get_glyph_metrics (value fontHandle, int index) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return (value)font->GetGlyphMetrics (true, index);
		#else
		return alloc_null ();
		#endif

	}


	int lime_font_get_height (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetHeight ();
		#else
		return 0;
		#endif

	}


	int lime_font_get_num_glyphs (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetNumGlyphs ();
		#else
		return 0;
		#endif

	}


	int lime_font_get_underline_position (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetUnderlinePosition ();
		#else
		return 0;
		#endif

	}


	int lime_font_get_underline_thickness (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetUnderlineThickness ();
		#else
		return 0;
		#endif

	}


	int lime_font_get_units_per_em (value fontHandle) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return font->GetUnitsPerEM ();
		#else
		return 0;
		#endif

	}


	value lime_font_load_bytes (value data) {

		#ifdef LIME_FREETYPE
		Resource resource;
		Bytes bytes;

		bytes.Set (data);
		resource = Resource (&bytes);

		Font *font = new Font (&resource, 0);

		if (font) {

			if (font->face) {

				return CFFIPointer (font, gc_font);

			} else {

				delete font;

			}

		}
		#endif

		return alloc_null ();

	}


	value lime_font_load_file (value data) {

		#ifdef LIME_FREETYPE
		Resource resource = Resource (val_string (data));

		Font *font = new Font (&resource, 0);

		if (font) {

			if (font->face) {

				return CFFIPointer (font, gc_font);

			} else {

				delete font;

			}

		}
		#endif

		return alloc_null ();

	}


	value lime_font_load (value data) {

		if (val_is_string (data)) {

			return lime_font_load_file (data);

		} else {

			return lime_font_load_bytes (data);

		}

	}


	value lime_font_outline_decompose (value fontHandle, int size) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		return (value)font->Decompose (true, size);
		#else
		return alloc_null ();
		#endif

	}


	value lime_font_render_glyph (value fontHandle, int index, value data) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		Bytes bytes (data);

		if (font->RenderGlyph (index, &bytes)) {

			return bytes.Value (data);

		}
		#endif

		return alloc_null ();

	}


	value lime_font_render_glyphs (value fontHandle, value indices, value data) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		Bytes bytes (data);

		if (font->RenderGlyphs (indices, &bytes)) {

			return bytes.Value (data);

		}
		#endif

		return alloc_null ();

	}


	void lime_font_set_size (value fontHandle, int fontSize) {

		#ifdef LIME_FREETYPE
		Font *font = (Font*)val_data (fontHandle);
		font->SetSize (fontSize);
		#endif

	}


	void lime_gamepad_add_mappings (value mappings) {

		int length = val_array_size (mappings);

		for (int i = 0; i < length; i++) {

			Gamepad::AddMapping (val_string (val_array_i (mappings, i)));

		}

	}


	void lime_gamepad_event_manager_register (value callback, value eventObject) {

		GamepadEvent::callback = new ValuePointer (callback);
		GamepadEvent::eventObject = new ValuePointer (eventObject);

	}


	value lime_gamepad_get_device_guid (int id) {

		const char* guid = Gamepad::GetDeviceGUID (id);

		if (guid) {

			value result = alloc_string (guid);
			delete guid;
			return result;

		} else {

			return alloc_null ();

		}

	}


	value lime_gamepad_get_device_name (int id) {

		const char* name = Gamepad::GetDeviceName (id);
		return name ? alloc_string (name) : alloc_null ();

	}


	void lime_gamepad_rumble (int id, double lowFrequencyRumble, double highFrequencyRumble, int duration) {

		Gamepad::Rumble (id, lowFrequencyRumble, highFrequencyRumble, duration);

	}


	value lime_gzip_compress (value buffer, value bytes) {

		#ifdef LIME_ZLIB
		Bytes data (buffer);
		Bytes result (bytes);

		Zlib::Compress (GZIP, &data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	value lime_gzip_decompress (value buffer, value bytes) {

		#ifdef LIME_ZLIB
		Bytes data (buffer);
		Bytes result (bytes);

		Zlib::Decompress (GZIP, &data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	void lime_haptic_vibrate (int period, int duration) {

		#ifdef IPHONE
		Haptic::Vibrate (period, duration);
		#endif

	}


	value lime_image_encode (value buffer, int type, int quality, value bytes) {

		ImageBuffer imageBuffer = ImageBuffer (buffer);
		Bytes data = Bytes (bytes);

		switch (type) {

			case 0:

				#ifdef LIME_PNG
				if (PNG::Encode (&imageBuffer, &data)) {

					return data.Value (bytes);

				}
				#endif
				break;

			case 1:

				#ifdef LIME_JPEG
				if (JPEG::Encode (&imageBuffer, &data, quality)) {

					return data.Value (bytes);

				}
				#endif
				break;

			default: break;

		}

		return alloc_null ();

	}


	value lime_image_load_bytes (value data, value buffer) {

		Resource resource;
		Bytes bytes;

		ImageBuffer imageBuffer = ImageBuffer (buffer);

		bytes.Set (data);
		resource = Resource (&bytes);

		#ifdef LIME_PNG
		if (PNG::Decode (&resource, &imageBuffer)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		#ifdef LIME_JPEG
		if (JPEG::Decode (&resource, &imageBuffer)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	value lime_image_load_file (value data, value buffer) {

		Resource resource = Resource (val_string (data));
		ImageBuffer imageBuffer = ImageBuffer (buffer);

		#ifdef LIME_PNG
		if (PNG::Decode (&resource, &imageBuffer)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		#ifdef LIME_JPEG
		if (JPEG::Decode (&resource, &imageBuffer)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	value lime_image_load (value data, value buffer) {

		if (val_is_string (data)) {

			return lime_image_load_file (data, buffer);

		} else {

			return lime_image_load_bytes (data, buffer);

		}

	}


	void lime_joystick_event_manager_register (value callback, value eventObject) {

		JoystickEvent::callback = new ValuePointer (callback);
		JoystickEvent::eventObject = new ValuePointer (eventObject);

	}


	value lime_joystick_get_device_guid (int id) {

		const char* guid = Joystick::GetDeviceGUID (id);
		return guid ? alloc_string (guid) : alloc_null ();

	}


	value lime_joystick_get_device_name (int id) {

		const char* name = Joystick::GetDeviceName (id);
		return name ? alloc_string (name) : alloc_null ();

	}


	int lime_joystick_get_num_axes (int id) {

		return Joystick::GetNumAxes (id);

	}


	int lime_joystick_get_num_buttons (int id) {

		return Joystick::GetNumButtons (id);

	}


	int lime_joystick_get_num_hats (int id) {

		return Joystick::GetNumHats (id);

	}


	int lime_joystick_get_num_trackballs (int id) {

		return Joystick::GetNumTrackballs (id);

	}


	value lime_jpeg_decode_bytes (value data, bool decodeData, value buffer) {

		ImageBuffer imageBuffer (buffer);

		Bytes bytes (data);
		Resource resource = Resource (&bytes);

		#ifdef LIME_JPEG
		if (JPEG::Decode (&resource, &imageBuffer, decodeData)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	value lime_jpeg_decode_file (HxString path, bool decodeData, value buffer) {

		ImageBuffer imageBuffer (buffer);
		Resource resource = Resource (path.c_str ());

		#ifdef LIME_JPEG
		if (JPEG::Decode (&resource, &imageBuffer, decodeData)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	float lime_key_code_from_scan_code (float scanCode) {

		return KeyCode::FromScanCode (scanCode);

	}

	float lime_key_code_to_scan_code (float keyCode) {

		return KeyCode::ToScanCode (keyCode);

	}


	void lime_key_event_manager_register (value callback, value eventObject) {

		KeyEvent::callback = new ValuePointer (callback);
		KeyEvent::eventObject = new ValuePointer (eventObject);

	}


	value lime_lzma_compress (value buffer, value bytes) {

		#ifdef LIME_LZMA
		Bytes data (buffer);
		Bytes result (bytes);

		LZMA::Compress (&data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	value lime_lzma_decompress (value buffer, value bytes) {

		#ifdef LIME_LZMA
		Bytes data (buffer);
		Bytes result (bytes);

		LZMA::Decompress (&data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	void lime_mouse_event_manager_register (value callback, value eventObject) {

		MouseEvent::callback = new ValuePointer (callback);
		MouseEvent::eventObject = new ValuePointer (eventObject);

	}


	void lime_orientation_event_manager_register (value callback, value eventObject) {

		OrientationEvent::callback = new ValuePointer (callback);
		OrientationEvent::eventObject = new ValuePointer (eventObject);
		System::EnableDeviceOrientationChange(true);

	}


	value lime_png_decode_bytes (value data, bool decodeData, value buffer) {

		ImageBuffer imageBuffer (buffer);
		Bytes bytes (data);
		Resource resource = Resource (&bytes);

		#ifdef LIME_PNG
		if (PNG::Decode (&resource, &imageBuffer, decodeData)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	value lime_png_decode_file (HxString path, bool decodeData, value buffer) {

		ImageBuffer imageBuffer (buffer);
		Resource resource = Resource (path.c_str ());

		#ifdef LIME_PNG
		if (PNG::Decode (&resource, &imageBuffer, decodeData)) {

			return imageBuffer.Value (buffer);

		}
		#endif

		return alloc_null ();

	}


	void lime_render_event_manager_register (value callback, value eventObject) {

		RenderEvent::callback = new ValuePointer (callback);
		RenderEvent::eventObject = new ValuePointer (eventObject);

	}


	void lime_sensor_event_manager_register (value callback, value eventObject) {

		SensorEvent::callback = new ValuePointer (callback);
		SensorEvent::eventObject = new ValuePointer (eventObject);

	}


	bool lime_system_get_allow_screen_timeout () {

		return System::GetAllowScreenTimeout ();

	}


	value lime_system_get_device_model () {

		std::wstring* model = System::GetDeviceModel ();

		if (model) {

			value result = alloc_wstring (model->c_str ());
			delete model;
			return result;

		} else {

			return alloc_null ();

		}

	}


	value lime_system_get_device_vendor () {

		std::wstring* vendor = System::GetDeviceVendor ();

		if (vendor) {

			value result = alloc_wstring (vendor->c_str ());
			delete vendor;
			return result;

		} else {

			return alloc_null ();

		}

	}


	value lime_system_get_directory (int type, HxString company, HxString title) {

		std::wstring* path = System::GetDirectory ((SystemDirectory)type, company.c_str (), title.c_str ());

		if (path) {

			value result = alloc_wstring (path->c_str ());
			delete path;
			return result;

		} else {

			return alloc_null ();

		}

	}


	value lime_system_get_display (int id) {

		return (value)System::GetDisplay (true, id);

	}


	int lime_system_get_num_displays () {

		return System::GetNumDisplays ();

	}


	value lime_system_get_platform_label () {

		std::wstring* label = System::GetPlatformLabel ();

		if (label) {

			value result = alloc_wstring (label->c_str ());
			delete label;
			return result;

		} else {

			return alloc_null ();

		}

	}


	value lime_system_get_platform_name () {

		std::wstring* name = System::GetPlatformName ();

		if (name) {

			value result = alloc_wstring (name->c_str ());
			delete name;
			return result;

		} else {

			return 0;

		}

	}


	value lime_system_get_platform_version () {

		std::wstring* version = System::GetPlatformVersion ();

		if (version) {

			value result = alloc_wstring (version->c_str ());
			delete version;
			return result;

		} else {

			return alloc_null ();

		}

	}


	double lime_system_get_timer () {

		return System::GetTimer ();

	}

	double lime_system_get_performance_counter () {

		return System::GetPerformanceCounter ();

	}

	double lime_system_get_performance_frequency () {

		return System::GetPerformanceFrequency ();

	}


	int lime_system_get_windows_console_mode (int handleType) {

		#if defined (HX_WINDOWS) && !defined (HX_WINRT)
		return System::GetWindowsConsoleMode (handleType);
		#else
		return 0;
		#endif

	}


	void lime_system_open_file (HxString path) {

		#ifdef IPHONE
		System::OpenFile (path.c_str ());
		#endif

	}


	void lime_system_open_url (HxString url, HxString target) {

		#ifdef IPHONE
		System::OpenURL (url.c_str (), target.c_str ());
		#endif

	}


	bool lime_system_set_allow_screen_timeout (bool allow) {

		return System::SetAllowScreenTimeout (allow);

	}


	bool lime_system_set_windows_console_mode (int handleType, int mode) {

		#if defined (HX_WINDOWS)
		return System::SetWindowsConsoleMode (handleType, mode);
		#else
		return false;
		#endif

	}


	void lime_text_event_manager_register (value callback, value eventObject) {

		TextEvent::callback = new ValuePointer (callback);
		TextEvent::eventObject = new ValuePointer (eventObject);

	}


	void lime_touch_event_manager_register (value callback, value eventObject) {

		TouchEvent::callback = new ValuePointer (callback);
		TouchEvent::eventObject = new ValuePointer (eventObject);

	}


	void lime_window_alert (value window, HxString message, HxString title) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->Alert (message.c_str (), title.c_str ());

	}


	void lime_window_close (value window) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->Close ();

	}


	void lime_window_context_flip (value window) {

		((Window*)val_data (window))->ContextFlip ();

	}


	value lime_window_context_lock (value window) {

		return (value)((Window*)val_data (window))->ContextLock (true);

	}


	void lime_window_context_make_current (value window) {

		((Window*)val_data (window))->ContextMakeCurrent ();

	}


	void lime_window_context_unlock (value window) {

		((Window*)val_data (window))->ContextUnlock ();

	}


	value lime_window_create (value application, int width, int height, int flags, HxString title) {

		Window* window = CreateWindow ((Application*)val_data (application), width, height, flags, title.c_str ());
		return CFFIPointer (window, gc_window);

	}


	void lime_window_event_manager_register (value callback, value eventObject) {

		WindowEvent::callback = new ValuePointer (callback);
		WindowEvent::eventObject = new ValuePointer (eventObject);

	}


	void lime_window_focus (value window) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->Focus ();

	}


	double lime_window_get_context (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return (uintptr_t)targetWindow->GetContext ();

	}


	value lime_window_get_context_type (value window) {

		Window* targetWindow = (Window*)val_data (window);
		const char* type = targetWindow->GetContextType ();
		return type ? alloc_string (type) : alloc_null ();

	}


	int lime_window_get_display (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetDisplay ();

	}


	value lime_window_get_display_mode (value window) {

		Window* targetWindow = (Window*)val_data (window);
		DisplayMode displayMode;
		targetWindow->GetDisplayMode (&displayMode);
		return (value)displayMode.Value ();

	}


	int lime_window_get_height (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetHeight ();

	}


	int32_t lime_window_get_id (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return (int32_t)targetWindow->GetID ();

	}


	bool lime_window_get_mouse_lock (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetMouseLock ();

	}


	double lime_window_get_opacity (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return (float)targetWindow->GetOpacity ();

	}


	double lime_window_get_scale (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetScale ();

	}


	bool lime_window_get_text_input_enabled (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetTextInputEnabled ();

	}


	int lime_window_get_width (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetWidth ();

	}


	int lime_window_get_x (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetX ();

	}


	int lime_window_get_y (value window) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->GetY ();

	}


	void lime_window_move (value window, int x, int y) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->Move (x, y);

	}


	value lime_window_read_pixels (value window, value rect, value imageBuffer) {

		Window* targetWindow = (Window*)val_data (window);
		ImageBuffer buffer (imageBuffer);

		if (!val_is_null (rect)) {

			Rectangle _rect = Rectangle (rect);
			targetWindow->ReadPixels (&buffer, &_rect);

		} else {

			targetWindow->ReadPixels (&buffer, NULL);

		}

		return buffer.Value (imageBuffer);

	}


	void lime_window_resize (value window, int width, int height) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->Resize (width, height);

	}

	void lime_window_set_minimum_size (value window, int width, int height) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->SetMinimumSize (width, height);

	}


	void lime_window_set_maximum_size (value window, int width, int height) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->SetMaximumSize (width, height);

	}


	bool lime_window_set_borderless (value window, bool borderless) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->SetBorderless (borderless);

	}


	void lime_window_set_cursor (value window, int cursor) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->SetCursor ((Cursor)cursor);

	}


	value lime_window_set_display_mode (value window, value displayMode) {

		Window* targetWindow = (Window*)val_data (window);
		DisplayMode _displayMode (displayMode);
		targetWindow->SetDisplayMode (&_displayMode);
		targetWindow->GetDisplayMode (&_displayMode);
		return (value)_displayMode.Value ();

	}


	bool lime_window_set_fullscreen (value window, bool fullscreen) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->SetFullscreen (fullscreen);

	}


	void lime_window_set_icon (value window, value buffer) {

		Window* targetWindow = (Window*)val_data (window);
		ImageBuffer imageBuffer = ImageBuffer (buffer);
		targetWindow->SetIcon (&imageBuffer);

	}


	bool lime_window_set_maximized (value window, bool maximized) {

		Window* targetWindow = (Window*)val_data(window);
		return targetWindow->SetMaximized (maximized);

	}


	bool lime_window_set_minimized (value window, bool minimized) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->SetMinimized (minimized);

	}


	void lime_window_set_mouse_lock (value window, bool mouseLock) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->SetMouseLock (mouseLock);

	}


	void lime_window_set_opacity (value window, double opacity) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->SetOpacity ((float)opacity);

	}


	bool lime_window_set_resizable (value window, bool resizable) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->SetResizable (resizable);

	}


	void lime_window_set_text_input_enabled (value window, bool enabled) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->SetTextInputEnabled (enabled);

	}


	void lime_window_set_text_input_rect (value window, value rect) {

		Window* targetWindow = (Window*)val_data (window);
		Rectangle _rect = Rectangle (rect);
		targetWindow->SetTextInputRect (&_rect);

	}


	value lime_window_set_title (value window, HxString title) {

		Window* targetWindow = (Window*)val_data (window);
		const char* result = targetWindow->SetTitle (title.c_str ());

		if (result) {

			value _result = alloc_string (result);

			if (result != title.c_str ()) {

				free ((char*) result);

			}

			return _result;

		} else {

			return alloc_null ();

		}

	}


	bool lime_window_set_visible (value window, bool visible) {

		Window* targetWindow = (Window*)val_data (window);
		return targetWindow->SetVisible (visible);

	}

	bool lime_window_set_vsync (value window, bool vsync) {

		Window* targetWindow = (Window*)val_data(window);
		return targetWindow->SetVSync (vsync);

	}


	void lime_window_warp_mouse (value window, int x, int y) {

		Window* targetWindow = (Window*)val_data (window);
		targetWindow->WarpMouse (x, y);

	}


	value lime_zlib_compress (value buffer, value bytes) {

		#ifdef LIME_ZLIB
		Bytes data (buffer);
		Bytes result (bytes);

		Zlib::Compress (ZLIB, &data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	value lime_zlib_decompress (value buffer, value bytes) {

		#ifdef LIME_ZLIB
		Bytes data (buffer);
		Bytes result (bytes);

		Zlib::Decompress (ZLIB, &data, &result);

		return result.Value (bytes);
		#else
		return alloc_null ();
		#endif

	}


	DEFINE_PRIME0 (lime_application_create);
	DEFINE_PRIME2v (lime_application_event_manager_register);
	DEFINE_PRIME1 (lime_application_exec);
	DEFINE_PRIME1v (lime_application_init);
	DEFINE_PRIME1 (lime_application_quit);
	DEFINE_PRIME2v (lime_application_set_frame_rate);
	DEFINE_PRIME1 (lime_application_update);
	DEFINE_PRIME2 (lime_audio_load);
	DEFINE_PRIME2 (lime_audio_load_bytes);
	DEFINE_PRIME2 (lime_audio_load_file);
	DEFINE_PRIME3 (lime_bytes_from_data_pointer);
	DEFINE_PRIME1 (lime_bytes_get_data_pointer);
	DEFINE_PRIME2 (lime_bytes_get_data_pointer_offset);
	DEFINE_PRIME2 (lime_bytes_read_file);
	DEFINE_PRIME1 (lime_cffi_get_native_pointer);
	DEFINE_PRIME1 (lime_cffi_set_finalizer);
	DEFINE_PRIME2v (lime_clipboard_event_manager_register);
	DEFINE_PRIME0 (lime_clipboard_get_text);
	DEFINE_PRIME1v (lime_clipboard_set_text);
	DEFINE_PRIME2 (lime_data_pointer_offset);
	DEFINE_PRIME2 (lime_deflate_compress);
	DEFINE_PRIME2 (lime_deflate_decompress);
	DEFINE_PRIME2v (lime_drop_event_manager_register);
	DEFINE_PRIME3 (lime_file_dialog_open_directory);
	DEFINE_PRIME3 (lime_file_dialog_open_file);
	DEFINE_PRIME3 (lime_file_dialog_open_files);
	DEFINE_PRIME3 (lime_file_dialog_save_file);
	DEFINE_PRIME1 (lime_file_watcher_create);
	DEFINE_PRIME3 (lime_file_watcher_add_directory);
	DEFINE_PRIME2v (lime_file_watcher_remove_directory);
	DEFINE_PRIME1v (lime_file_watcher_update);
	DEFINE_PRIME1 (lime_font_get_ascender);
	DEFINE_PRIME1 (lime_font_get_descender);
	DEFINE_PRIME1 (lime_font_get_family_name);
	DEFINE_PRIME2 (lime_font_get_glyph_index);
	DEFINE_PRIME2 (lime_font_get_glyph_indices);
	DEFINE_PRIME2 (lime_font_get_glyph_metrics);
	DEFINE_PRIME1 (lime_font_get_height);
	DEFINE_PRIME1 (lime_font_get_num_glyphs);
	DEFINE_PRIME1 (lime_font_get_underline_position);
	DEFINE_PRIME1 (lime_font_get_underline_thickness);
	DEFINE_PRIME1 (lime_font_get_units_per_em);
	DEFINE_PRIME1 (lime_font_load);
	DEFINE_PRIME1 (lime_font_load_bytes);
	DEFINE_PRIME1 (lime_font_load_file);
	DEFINE_PRIME2 (lime_font_outline_decompose);
	DEFINE_PRIME3 (lime_font_render_glyph);
	DEFINE_PRIME3 (lime_font_render_glyphs);
	DEFINE_PRIME2v (lime_font_set_size);
	DEFINE_PRIME1v (lime_gamepad_add_mappings);
	DEFINE_PRIME2v (lime_gamepad_event_manager_register);
	DEFINE_PRIME1 (lime_gamepad_get_device_guid);
	DEFINE_PRIME1 (lime_gamepad_get_device_name);
	DEFINE_PRIME4v (lime_gamepad_rumble);
	DEFINE_PRIME2 (lime_gzip_compress);
	DEFINE_PRIME2 (lime_gzip_decompress);
	DEFINE_PRIME2v (lime_haptic_vibrate);
	DEFINE_PRIME3v (lime_image_data_util_color_transform);
	DEFINE_PRIME6v (lime_image_data_util_copy_channel);
	DEFINE_PRIME7v (lime_image_data_util_copy_pixels);
	DEFINE_PRIME4v (lime_image_data_util_fill_rect);
	DEFINE_PRIME5v (lime_image_data_util_flood_fill);
	DEFINE_PRIME4v (lime_image_data_util_get_pixels);
	DEFINE_PRIME8v (lime_image_data_util_merge);
	DEFINE_PRIME1v (lime_image_data_util_multiply_alpha);
	DEFINE_PRIME4v (lime_image_data_util_resize);
	DEFINE_PRIME2v (lime_image_data_util_set_format);
	DEFINE_PRIME6v (lime_image_data_util_set_pixels);
	DEFINE_PRIME12 (lime_image_data_util_threshold);
	DEFINE_PRIME1v (lime_image_data_util_unmultiply_alpha);
	DEFINE_PRIME4 (lime_image_encode);
	DEFINE_PRIME2 (lime_image_load);
	DEFINE_PRIME2 (lime_image_load_bytes);
	DEFINE_PRIME2 (lime_image_load_file);
	DEFINE_PRIME2v (lime_joystick_event_manager_register);
	DEFINE_PRIME1 (lime_joystick_get_device_guid);
	DEFINE_PRIME1 (lime_joystick_get_device_name);
	DEFINE_PRIME1 (lime_joystick_get_num_axes);
	DEFINE_PRIME1 (lime_joystick_get_num_buttons);
	DEFINE_PRIME1 (lime_joystick_get_num_hats);
	DEFINE_PRIME1 (lime_joystick_get_num_trackballs);
	DEFINE_PRIME3 (lime_jpeg_decode_bytes);
	DEFINE_PRIME3 (lime_jpeg_decode_file);
	DEFINE_PRIME1 (lime_key_code_from_scan_code);
	DEFINE_PRIME1 (lime_key_code_to_scan_code);
	DEFINE_PRIME2v (lime_key_event_manager_register);
	DEFINE_PRIME2 (lime_lzma_compress);
	DEFINE_PRIME2 (lime_lzma_decompress);
	DEFINE_PRIME2v (lime_mouse_event_manager_register);
	DEFINE_PRIME2v (lime_orientation_event_manager_register);
	DEFINE_PRIME3 (lime_png_decode_bytes);
	DEFINE_PRIME3 (lime_png_decode_file);
	DEFINE_PRIME2v (lime_render_event_manager_register);
	DEFINE_PRIME2v (lime_sensor_event_manager_register);
	DEFINE_PRIME0 (lime_system_get_allow_screen_timeout);
	DEFINE_PRIME0 (lime_system_get_device_model);
	DEFINE_PRIME0 (lime_system_get_device_vendor);
	DEFINE_PRIME3 (lime_system_get_directory);
	DEFINE_PRIME1 (lime_system_get_display);
	DEFINE_PRIME0 (lime_system_get_num_displays);
	DEFINE_PRIME0 (lime_system_get_platform_label);
	DEFINE_PRIME0 (lime_system_get_platform_name);
	DEFINE_PRIME0 (lime_system_get_platform_version);
	DEFINE_PRIME0 (lime_system_get_timer);
	DEFINE_PRIME0 (lime_system_get_performance_counter);
	DEFINE_PRIME0 (lime_system_get_performance_frequency);
	DEFINE_PRIME1 (lime_system_get_windows_console_mode);
	DEFINE_PRIME1v (lime_system_open_file);
	DEFINE_PRIME2v (lime_system_open_url);
	DEFINE_PRIME1 (lime_system_set_allow_screen_timeout);
	DEFINE_PRIME2 (lime_system_set_windows_console_mode);
	DEFINE_PRIME2v (lime_text_event_manager_register);
	DEFINE_PRIME2v (lime_touch_event_manager_register);
	DEFINE_PRIME3v (lime_window_alert);
	DEFINE_PRIME1v (lime_window_close);
	DEFINE_PRIME1v (lime_window_context_flip);
	DEFINE_PRIME1 (lime_window_context_lock);
	DEFINE_PRIME1v (lime_window_context_make_current);
	DEFINE_PRIME1v (lime_window_context_unlock);
	DEFINE_PRIME5 (lime_window_create);
	DEFINE_PRIME2v (lime_window_event_manager_register);
	DEFINE_PRIME1v (lime_window_focus);
	DEFINE_PRIME1 (lime_window_get_context);
	DEFINE_PRIME1 (lime_window_get_context_type);
	DEFINE_PRIME1 (lime_window_get_display);
	DEFINE_PRIME1 (lime_window_get_display_mode);
	DEFINE_PRIME1 (lime_window_get_height);
	DEFINE_PRIME1 (lime_window_get_id);
	DEFINE_PRIME1 (lime_window_get_mouse_lock);
	DEFINE_PRIME1 (lime_window_get_scale);
	DEFINE_PRIME1 (lime_window_get_text_input_enabled);
	DEFINE_PRIME1 (lime_window_get_width);
	DEFINE_PRIME1 (lime_window_get_x);
	DEFINE_PRIME1 (lime_window_get_y);
	DEFINE_PRIME3v (lime_window_move);
	DEFINE_PRIME3 (lime_window_read_pixels);
	DEFINE_PRIME3v (lime_window_resize);
	DEFINE_PRIME3v (lime_window_set_minimum_size);
	DEFINE_PRIME3v (lime_window_set_maximum_size);
	DEFINE_PRIME2 (lime_window_set_borderless);
	DEFINE_PRIME2v (lime_window_set_cursor);
	DEFINE_PRIME2 (lime_window_set_display_mode);
	DEFINE_PRIME2 (lime_window_set_fullscreen);
	DEFINE_PRIME2v (lime_window_set_icon);
	DEFINE_PRIME2 (lime_window_set_maximized);
	DEFINE_PRIME2 (lime_window_set_minimized);
	DEFINE_PRIME2v (lime_window_set_mouse_lock);
	DEFINE_PRIME2 (lime_window_set_resizable);
	DEFINE_PRIME2v (lime_window_set_text_input_enabled);
	DEFINE_PRIME2v (lime_window_set_text_input_rect);
	DEFINE_PRIME2 (lime_window_set_title);
	DEFINE_PRIME2 (lime_window_set_visible);
	DEFINE_PRIME2 (lime_window_set_vsync);
	DEFINE_PRIME3v (lime_window_warp_mouse);
	DEFINE_PRIME1 (lime_window_get_opacity);
	DEFINE_PRIME2v (lime_window_set_opacity);
	DEFINE_PRIME2 (lime_zlib_compress);
	DEFINE_PRIME2 (lime_zlib_decompress);


	#define _ENUM "?"
	#define _TAPPLICATION_EVENT _OBJ (_I32 _I32)
	#define _TBYTES _OBJ (_I32 _BYTES)
	#define _TCFFIPOINTER _DYN
	#define _TCLIPBOARD_EVENT _OBJ (_I32)
	#define _TDISPLAYMODE _OBJ (_I32 _I32 _I32 _I32)
	#define _TDROP_EVENT _OBJ (_BYTES _I32)
	#define _TGAMEPAD_EVENT _OBJ (_I32 _I32 _I32 _I32 _F64)
	#define _TJOYSTICK_EVENT _OBJ (_I32 _I32 _I32 _I32 _F64 _F64)
	#define _TKEY_EVENT _OBJ (_F64 _I32 _I32 _I32)
	#define _TMOUSE_EVENT _OBJ (_I32 _F64 _F64 _I32 _I32 _F64 _F64 _I32)
	#define _TORIENTATION_EVENT _OBJ (_I32 _I32 _I32)
	#define _TRECTANGLE _OBJ (_F64 _F64 _F64 _F64)
	#define _TRENDER_EVENT _OBJ (_I32)
	#define _TSENSOR_EVENT _OBJ (_I32 _F64 _F64 _F64 _I32)
	#define _TTEXT_EVENT _OBJ (_I32 _I32 _I32 _BYTES _I32 _I32)
	#define _TTOUCH_EVENT _OBJ (_I32 _F64 _F64 _I32 _F64 _I32 _F64 _F64)
	#define _TVECTOR2 _OBJ (_F64 _F64)
	#define _TVORBISFILE _OBJ (_I32 _DYN)
	#define _TWINDOW_EVENT _OBJ (_I32 _I32 _I32 _I32 _I32 _I32)

	#define _TARRAYBUFFER _TBYTES
	#define _TARRAYBUFFERVIEW _OBJ (_I32 _TARRAYBUFFER _I32 _I32 _I32 _I32)
	#define _TAUDIOBUFFER _OBJ (_I32 _I32 _TARRAYBUFFERVIEW _I32 _DYN _DYN _DYN _DYN _DYN _TVORBISFILE)
	#define _TIMAGEBUFFER _OBJ (_I32 _TARRAYBUFFERVIEW _I32 _I32 _BOOL _BOOL _I32 _DYN _DYN _DYN _DYN _DYN _DYN)
	#define _TIMAGE _OBJ (_TIMAGEBUFFER _BOOL _I32 _I32 _I32 _TRECTANGLE _ENUM _I32 _I32 _F64 _F64)

	#define _TARRAY _OBJ (_BYTES _I32)
	#define _TARRAY2 _OBJ (_ARR)


}


#ifdef LIME_CAIRO
extern "C" int lime_cairo_register_prims ();
#else
extern "C" int lime_cairo_register_prims () { return 0; }
#endif

#ifdef LIME_CURL
extern "C" int lime_curl_register_prims ();
#else
extern "C" int lime_curl_register_prims () { return 0; }
#endif

#ifdef LIME_HARFBUZZ
extern "C" int lime_harfbuzz_register_prims ();
#else
extern "C" int lime_harfbuzz_register_prims () { return 0; }
#endif

#ifdef LIME_OPENAL
extern "C" int lime_openal_register_prims ();
#else
extern "C" int lime_openal_register_prims () { return 0; }
#endif

#ifdef LIME_OPENGL
extern "C" int lime_opengl_register_prims ();
#else
extern "C" int lime_opengl_register_prims () { return 0; }
#endif

#ifdef LIME_VORBIS
extern "C" int lime_vorbis_register_prims ();
#else
extern "C" int lime_vorbis_register_prims () { return 0; }
#endif


extern "C" int lime_register_prims () {

	lime_cairo_register_prims ();
	lime_curl_register_prims ();
	lime_harfbuzz_register_prims ();
	lime_openal_register_prims ();
	lime_opengl_register_prims ();
	lime_vorbis_register_prims ();

	return 0;

}
