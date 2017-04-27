#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: scope <STRING>
 * 2: mount <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_unit", objNull], ["_scope", nil], ["_mount", false]];

if (isNull _unit || isNil "_scope") exitWith {};

private _weaponIndex = -1;

if ((currentWeapon _unit) == (primaryWeapon _unit)) then
{
	_weaponIndex = 0;
};

if ((currentWeapon _unit) == (handgunWeapon _unit)) then
{
	_weaponIndex = 2;
};

if (_mount) then
{
    [_unit, _weaponIndex, 1, _scope] call DFUNC(mount);
} else
{
    [_unit, _weaponIndex, 1, _scope] call DFUNC(dismount);
};