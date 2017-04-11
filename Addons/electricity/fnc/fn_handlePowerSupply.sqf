#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 * 1: power <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_obj", objNull], ["_power", true, [false]]];

if (isNull _obj) exitWith {};

{
	[QGMEV(powerTarget), [_x, _power]] call CBA_fnc_localEvent;
} forEach (_obj getVariable [QGMVAR(collectors), []]);