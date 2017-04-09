#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: object <OBJECT>
 * 1: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_obj", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];

if (isNull _obj || isNull _vehicle) exitWith {};
if !([_vehicle] call DFUNC(canLoadObjects)) exitWith {};

if ([_obj, _vehicle] call DFUNC(inZone)) then
{
	if ([_vehicle, _obj] call DFUNC(canLoadObject)) then
	{
		[_vehicle, _obj] call DFUNC(loadObject);
	};
};