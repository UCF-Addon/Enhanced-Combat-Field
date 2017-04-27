#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_unit", objNull]];

if (isNull _unit) exitWith {};

if (currentWeapon player != primaryWeapon player) then
{
	player selectWeapon (primaryWeapon player);

	waitUntil
	{
		sleep 0.1;
		(!alive player) || (currentWeapon player == primaryWeapon player)
	};
};