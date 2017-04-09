#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: house <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_house", objNull]];

if (isNull _house) exitWith {};

private _objects = _house getVariable [QGMVAR(furniture), []];

{
	deleteVehicle _x;
} forEach _objects;

_house setVariable [QGMVAR(furniture), nil, false];