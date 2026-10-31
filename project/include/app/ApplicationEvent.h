#ifndef LIME_APP_APPLICATION_EVENT_H
#define LIME_APP_APPLICATION_EVENT_H


#include <system/CFFI.h>
#include <system/ValuePointer.h>


namespace lime {


	enum ApplicationEventType {

		UPDATE,
		EXIT

	};


	struct ApplicationEvent {

		double deltaTime;
		ApplicationEventType type;

		static ValuePointer* callback;
		static ValuePointer* eventObject;

		ApplicationEvent ();

		static void Dispatch (ApplicationEvent* event);

	};


}


#endif