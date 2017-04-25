#include "script_component.h"
/*
 * Author: Julius
 * description
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

private _range = call compile (_logic getVariable "Range");
private _hPerc = call compile (_logic getVariable "HousePercentage");
private _dPerc = call compile (_logic getVariable "DoorPercentage");

if (typeName _range != "SCALAR" || typeName _hPerc != "SCALAR" || typeName _dPerc != "SCALAR") exitWith
{
	systemChat "Wrong configurated module. The Lock-Area-Module only accept numeric inputs.";
};

private _pos = getPos _logic;
private _houses = _pos nearObjects ["House", _range];
private _selected = [];

private _hc = count _houses;
private _nhc = _hPerc * _hc;

for "_i" from 1 to _nhc do
{
	_index = random (_hc - _i);
	_house = _houses select _index;
	_selected pushBack _house;
	_houses = _houses - [_house];
};

[_selected, _dPerc, (_dPerc < 0 || _dPerc > 1)] call DFUNC(lockDoors);