#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: obj <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_unit", objNull], ["_obj", objNull]];

if (isNull _unit || isNull _obj) exitWith {};
if !([_unit] call DFUNC(haveCable)) exitWith {};

private _connection = _unit getVariable [QGMVAR(cableConnection), []];

if (_obj in _connection) exitWith {};
_connection pushBack _obj;

if (count _connection >= 2) then
{
	private _src = _connection select 0;
	private _dst = _connection select 1;

	if (getNumber (configFile >> "CfgVehicles" >> (typeOf (_connection select 1)) >> "") == _true) then
	{
		if (getNumber (configFile >> "CfgVehicles" >> (typeOf (_connection select 0)) >> "") == _true) exitWith
		{
			hint "You can't connect a generator with a generator";
		};

		_dst = _connection select 0;
		_src = _connection select 1;
	};

	[QGMEV(powerConnect), [_src, _dst]] call CBA_fnc_localEvent;
	_unit setVariable [QGMVAR(cableConnection), nil, true];
} else
{
	_unit setVariable [QGMVAR(cableConnection), _connection, true];
};