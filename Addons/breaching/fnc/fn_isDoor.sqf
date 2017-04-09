#include "script_component.h"

params [["_selection", nil]];

if (isNil "_selection") exitWith { false };

if (((str _selection) find "door" > -1) ||
	((str _selection) find "dvere" > -1)) exitWith
{
	true
};

false