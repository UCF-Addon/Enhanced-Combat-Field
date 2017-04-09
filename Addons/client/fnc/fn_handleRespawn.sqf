#include "script_component.h"

private ["_player", "_old"];

// Debug
(str _this) call BIS_fnc_log;

_player = _this select 0;
_old = _this select 1;

waitUntil { !isNull _player };
if ((!isPlayer _player) || (!local _player)) exitWith {};

_player setVariable ["_classid", (_old getVariable ["_classid", -1]), true];
_player setVariable ["ECF_var_isDBI", (_old getVariable ["ECF_var_isDBI", _false]), true];
_player setVariable [QGVAR(roles), (_old getVariable [QGVAR(roles), []]), true];

format ["Player (%1): variables transfered from %2", (getPlayerUID _player), _old] call BIS_fnc_log;

// TODO: Remove old Code Snippets
if (_player getVariable ["ECF_var_isDBI", _false] == _false) exitWith {};

if (!((player getVariable ["_classid", -1]) > -1)) then
{
	[DFUNC(openRoleD), []] call DFUNC(waitInit);
    //[] call DFUNC(openRoleD);
} else
{
    player setVariable ["loading", true];
    [] call DFUNC(callUpdate);
};