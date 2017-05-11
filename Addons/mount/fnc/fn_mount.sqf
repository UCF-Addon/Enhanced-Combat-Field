#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: weaponIndex <SCALAR>
 * 2: attIndex <SCALAR>
 * 3: item <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_unit", objNull], ["_weaponIndex", 0], ["_attIndex", 0], ["_item", nil]];

if (isNull _unit || isNil "_item") exitWith {};

private _anim = [];

switch (_attIndex) do
{
	case 0 : { _anim = []; }; // Muzzle Slot
	case 1 : { _anim = ["MountOptic", 2, 0.5]; }; // Scope Slot
	case 2 : { _anim = ["MountSide", 6, 3]; }; // Side Slot
	case 3 : { _anim = ["MountSide", 6, 3]; }; // Bipod Slot
};

if (_anim isEqualTo []) exitWith {};

_unit playMoveNow (_anim select 0);
sleep (_anim select 1);

_unit removeItem _item;

switch (_weaponIndex) do
{
	case 0 : { _unit addPrimaryWeaponItem _item; }; // Primary
	case 1 : {}; // Secondary
	case 2 : { _unit addHandgunItem _item; }; // Handgun
};

sleep (_anim select 2);