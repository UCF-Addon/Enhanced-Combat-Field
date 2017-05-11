#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: side <STRING>
 * 2: mount <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_unit", objNull], ["_side", nil], ["_mount", false]];

if (isNull _unit || isNil "_side") exitWith {};

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
    [_unit, _weaponIndex, 2, _side] spawn DFUNC(mount);
} else
{
	[_unit, _weaponIndex, 2, _side] spawn DFUNC(dismount);
};