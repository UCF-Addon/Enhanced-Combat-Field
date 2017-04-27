#include "script_component.h"

params[["_unit", objNull, [objNull]], ["_coverCoef", 0, [0]], ["_coverDir", -1, [0]]];

private ["_near", "_obj", "_nearPos"];

/*
if (!canSuspend) exitWith
{
	_unit setVariable [QGMVAR(findCover), _false, false];
};
*/

_near = nearestObjects [_unit, ["Car", "Tank", "HouseBase", "Wall", "Wreck"], GMVAR(__maxCoverDistance)];

// Debug
diag_log format ["Found %1 Objects to cover for %2", (count _near), _unit];

{
	_x call BIS_fnc_boundingBoxDimensions params ["_width", "_length", "_height"];

	// Debug
	diag_log format ["Object ( %1 ): W %2 | L %3 | H %4", _x, _width, _length, _height];

	if ((_width > 0.5) && (_length > 0.5) && (_height > 0.3)) then
	{
		if (_x isKindOf "HouseBase") then
        {
        	if ((isNil "_obj" || isNull _obj) || ((_x distance _unit) < (_obj distance _unit))) then
        	{
        		_obj = _x;
        	};
       	};
       	// Debug fast Code
       	_nearPos pushBack _x;
	};
} forEach _near;

if (isNil "_obj" || isNull _obj) then
{
	_obj = _nearPos select 0;
};

systemChat format ["Get Cover: %1 at %2", typeOf _obj, getPos _obj];
_unit doStop;
/* Debug TODO: Test */sleep 0.1;
_unit doMove (getPos _obj);
waitUntil { ((_unit distance _obj) < 2) };

_unit setVariable [QGMVAR(findCover), _false, false];