#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: class <STRING>
 * 2: mount <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_unit", objNull], ["_scope", nil], ["_mount", false]];

if (isNull _unit || isNil "_scope") exitWith {};

if (local _unit) then
{
	[QGMEV(mountScope), [_unit, _scope, _mount]] call CBA_fnc_localEvent;
} else
{
	[QGMEV(mountScope), [_unit, _scope, _mount], _unit] call CBA_fnc_targetEvent;
};