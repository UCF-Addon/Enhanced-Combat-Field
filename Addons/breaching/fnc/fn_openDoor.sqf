#include "script_component.h"

private ["_house", "_door", "_anim"];

_door = _this select 0;
_house = _this select 1;

_anim = [_house, _door] call ACE_Interaction_fnc_getDoorAnimations;
_anim = _anim select 0;

_house animate [_anim select 0, 1, true];
_house setVariable [format ["bis_disabled_%1", _door], 1, true];