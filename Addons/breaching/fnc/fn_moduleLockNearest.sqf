#include "script_component.h"
/*
 * Author: Julius
 * Locks the nearest door to the logic
 *
 * Arguments:
 * 0: logic <OBJECT>
 * 1: units <ARRAY>
 * 2: activ <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_logic", objNull], ["_units", []], ["_activ", true]];

private _pos = getPos _logic;

// TODO: Check whether 30m is enought for big buildings
private _house = _pos nearObjects ["House", 30];
private _nearest = _house select 0;
{
	if ((_nearest distance _pos) > (_x distance _pos)) then
	{
		_nearest = _x;
	};
	nil
} count _house;

private _selctions = (selectionNames _nearest) select {[_x] call DFUNC(isDoor)};
private _nearestSelection = _selctions select 0;
{
	_pos0 = _nearest modelToWorld (_nearest selectionPosition _x);
	_pos1 = _nearest modelToWorld (_nearest selectionPosition _nearestSelection);

	if ((_pos0 distance _pos) < (_pos1 distance _pos)) then
	{
		_nearestSelection = _x;
	};
	nil
} count _selctions;

_nearest setVariable [format ["bis_disabled_%1", _nearestSelection], _true, true];