#ifndef LIME_SYSTEM_SENSOR_EVENT_H
#define LIME_SYSTEM_SENSOR_EVENT_H


#include <system/ValuePointer.h>


namespace lime {


	enum SensorEventType {

		SENSOR_ACCELEROMETER

	};


	struct SensorEvent {
		int id;
		double x;
		double y;
		double z;
		SensorEventType type;

		static ValuePointer* callback;
		static ValuePointer* eventObject;

		SensorEvent ();

		static void Dispatch (SensorEvent* event);

	};


}


#endif