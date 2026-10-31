#ifndef LIME_UI_TEXT_EVENT_H
#define LIME_UI_TEXT_EVENT_H


#include <system/ValuePointer.h>
#include <stdint.h>


namespace lime {


	enum TextEventType {

		TEXT_INPUT,
		TEXT_EDIT

	};


	struct TextEvent {

		int id;
		int length;
		int start;
		vbyte* text;
		TextEventType type;
		int windowID;

		static ValuePointer* callback;
		static ValuePointer* eventObject;

		TextEvent ();

		static void Dispatch (TextEvent* event);

	};


}


#endif