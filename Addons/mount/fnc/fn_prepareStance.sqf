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

private _stance = stance player;

if (_stance == "CROUCH") then
{
	_unit playMoveNow "crouch";
};

if (_stance == "PRONE") then
{
	_unit playMoveNow "crouch";
};

if (_stance == "STAND") then
{
	_unit playMoveNow "crouch";
};

if (weaponLowered _unit) then
{
	_unit playActionNow "primaryWeapon";
	sleep 1;
};