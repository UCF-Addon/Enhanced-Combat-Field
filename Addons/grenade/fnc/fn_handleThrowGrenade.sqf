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
 */

params ["_unit", ["_weapon", ""], "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if (_weapon != "Throw") exitWith {};

if (isNull _projectile) then
{
	_projectile = nearestObject [_unit, _ammo];
};

if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QGMVAR(irritatingGas))) == _true) then
{
	private _fuseTime = getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosionTime");

	private _lifespan = getNumber (configFile >> "CfgAmmo" >> _ammo >> "timeToLive");
	private _outflow = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGMVAR(gasOutflow));
	private _color = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGMVAR(color));

	[DMFUNC(gas,createIrrGasEmitter), [_projectile, _lifespan, _outflow, _color], _fuseTime] call CBA_fnc_waitAndExecute;
};