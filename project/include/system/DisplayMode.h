#ifndef LIME_SYSTEM_DISPLAY_MODE_H
#define LIME_SYSTEM_DISPLAY_MODE_H


#include <graphics/PixelFormat.h>


namespace lime {


	class DisplayMode {

		public:

			int height;
			PixelFormat pixelFormat;
			int refreshRate;
			int width;

			DisplayMode ();
			DisplayMode (value DisplayMode);
			DisplayMode (int width, int height, PixelFormat pixelFormat, int refreshRate);

			void CopyFrom (DisplayMode* other);
			void* Value ();

	};


}


#endif