#include "script_component.h"

private ["_obj", "_player", "_bullet", "_selection", "_direct", "_posASL"/*, "_direction"*/];

if (count _this > 9) then
{
	_direct = _this select 10;
    if (!_direct) exitWith {};
} else
{
	_direct = true;
};

_player = _this select 1;
if (!isPlayer _player) exitWith {};

_obj = _this select 0;
if !(_obj isKindOf "Building") exitWith {};

_bullet = _this select 2;
if !(_bullet call DFUNC(isBBullet)) exitWith {};

_selection = _this select 5;
if !(_selection call DFUNC(isDoor)) exitWith {};

diag_log format ["%1 : %2 : %3 : %4 : %5", _player, _obj, _bullet, _selection, _posASL];

_posASL = _this select 3;
if !([_posASL, _obj, _selection] call DFUNC(isDoorHitzone)) exitWith {};

//_direction = _this select 7;

_door = ([2.5] call ACE_Interaction_fnc_getDoor) select 1;
if (isNil "_door" || _door == "") exitWith {};

[_door, _obj] call DFUNC(openDoor);