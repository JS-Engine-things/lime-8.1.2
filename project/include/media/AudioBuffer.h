#ifndef LIME_MEDIA_AUDIO_BUFFER_H
#define LIME_MEDIA_AUDIO_BUFFER_H


#include <hx/CFFIPrime.h>
#include <utils/ArrayBufferView.h>


#define LOG_SOUND(args,...) printf(args, ##__VA_ARGS__)


namespace lime {


	struct AudioBuffer {

		int bitsPerSample;
		int channels;
		ArrayBufferView* data;
		int dataFormat;
		int sampleRate;

		AudioBuffer (value audioBuffer);
		~AudioBuffer ();
		value Value (value audioBuffer);
		value Value ();

	};


}


#endif