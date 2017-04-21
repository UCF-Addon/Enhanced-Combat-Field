#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * 0: contains <BOOL>
 *
 * Public: No
**/

params [["_unit", objNull]];

if (isNull _unit) exitWith { false };

private _result = false;

{
	if (_x == "ToolKit") exitWith { _result = true; };
} count ((backpackItems _unit) + (vestItems _unit) + (uniformItems _unit));

_result;