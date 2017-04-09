#include "script_component.h"

private ["_player"];

_player = _this;

_player call DFUNC(equipPlayer);
[_player, -1] call DFUNC(setPlayerSkills);