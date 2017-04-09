#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: drone <OBJECT>
 * 1: mode <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#define MAX_LENGTH 500

params [["_drone", objNull], ["_mode", 0]];

if (isNull _drone || _mode > 2 || _mode < 0) exitWith {};

_vdnu = [_drone] call DFUNC(getCameraDirection);
_vdir = _vdnu select 0;
_vup = _vdnu select 1;
_vectorDir = [(_vdir select 0) + (_vup select 0), (_vdir select 1) + (_vup select 1), (_vdir select 2) + (_vup select 2)];


_length = sqrt((_vectorDir select 0)*(_vectorDir select 0) + (_vectorDir select 1)*(_vectorDir select 1) + (_vectorDir select 2)*(_vectorDir select 2));
_endVec = [(_vectorDir select 0) * (MAX_LENGTH / _length), (_vectorDir select 1) * (MAX_LENGTH / _length), (_vectorDir select 2) * (MAX_LENGTH / _length)];

_startPos = getPos _drone;
_endPos = [(_startPos select 0) + (_endVec select 0), (_startPos select 1) + (_endVec select 1), (_startPos select 2) + (_endVec select 2)];

_res = lineIntersectsSurfaces [_startPos, _endPos, _drone, objNull];

_intPos = (_res select 0) select 0;

{
	_marker = createMarker [format ["Test-%1", _forEachIndex], getPos _x];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "hd_dot";
	_marker setMarkerColor "ColorBlack";
} forEach (_intPos nearEntities ["CAManBase", 50]);