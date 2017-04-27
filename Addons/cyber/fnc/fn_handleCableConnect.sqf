#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: source <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_source", objNull], ["_target", objNull]];

if (isNull _source || isNull _target || _target == _source) exitWith {};

private _srcCons = _source getVariable [QGMVAR(cableConnections), []];
if (_target in _srcCons) exitWith {};
_srcCons pushBack _target;

private _dstCons = _target getVariable [QGMVAR(cableConnections), []];
_dstCons pushBack _source;

_source setVariable [QGMVAR(cableConnections), _srcCons, true];
_target setVariable [QGMVAR(cableConnections), _dstCons, true];

private _srcCode = getText (configFile >> "CfgVehicles" >> (typeOf _source) >> "onCableConnect");
private _dstCode = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "onCableConnect");

if (!isNil "_srcCode") then
{
	_nul = [_source] call compile _srcCode;
};

if (!isNil "_dstCode") then
{
	_nul = [_target] call compile _dstCode;
};