#pragma once

#include <hx/CFFIPrime.h>
#include <system/ValuePointer.h>

namespace lime
{

	enum DropEventType
	{
		DROP_FILE,
		DROP_TEXT,
		DROP_BEGIN,
		DROP_COMPLETE
	};

	struct DropEvent
	{
		char *data;
		int windowID;
		DropEventType type;

		static ValuePointer *callback;
		static ValuePointer *eventObject;

		DropEvent();

		static void Dispatch(DropEvent *event);
	};

} // namespace lime