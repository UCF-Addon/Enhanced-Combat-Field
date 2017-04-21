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
	[QGMEV(cableConnect), [_connection select 0, _connection select 1]] call CBA_fnc_localEvent;
	_unit setVariable [QGMVAR(cableConnection), nil, true];
} else
{
	_unit setVariable [QGMVAR(cableConnection), _connection, true];
};