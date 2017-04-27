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

if (_mount) then
{
	// TODO: Check whether item is in inventory
    if ((currentWeapon _unit) == (primaryWeapon _unit)) then
    {
    	_unit playMoveNow "MountOptic";
    	_nul = [_unit, _scope] spawn
    	{
			sleep 1.7;
    		(_this select 0) removeItem (_this select 1);
			(_this select 0) addPrimaryWeaponItem (_this select 1);
		};
    };
    if ((currentWeapon _unit) == (secondaryWeapon _unit)) then
    {
    	_unit playMoveNow "MountOptic";
		_nul = [_unit, _scope] spawn
    	{
    		sleep 1.7;
    		(_this select 0) removeItem (_this select 1);
			(_this select 0) addSecondaryWeaponItem (_this select 1);
    	};
    };
} else
{
    if ((currentWeapon _unit) == (primaryWeapon _unit)) then
    {
    	_unit playMoveNow "DismountOptic";
		_nul = [_unit, _scope] spawn
		{
			sleep 2.1;
			(_this select 0) addItem (_this select 1);
			(_this select 0) removePrimaryWeaponItem (_this select 1);
		};
    };
    if ((currentWeapon _unit) == (secondaryWeapon _unit)) then
    {
    	_unit playMoveNow "DismountOptic";
    	_nul = [_unit, _scope] spawn
		{
			sleep 2.1;
			(_this select 0) addItem (_this select 1);
			(_this select 0) removeSecondaryWeaponItem (_this select 1);
		};
    };
};