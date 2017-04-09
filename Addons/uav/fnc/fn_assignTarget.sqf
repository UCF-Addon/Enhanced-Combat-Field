#include "script_component.h"
/*
 * Author: Lt. Julius
 * Event handler of assign
 *
 * Arguments:
 * 0: caller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params["_player"];

private _target = [] call DFUNC(getTarget);

// TODO: if Null get POS3D over intersect
if (isNull _target) exitWith {};
if (isNull _player) exitWith {};

_uav = getConnectedUAV _player;
if (isNull _uav) exitWith {};

[_target, _player, _uav] call DFUNC(shareAssigned);
_target setVariable [QGMVAR(isMarked), true, false];

if (_player != (leader group _player)) then
{
	[_target, (leader group _player), _uav] call DFUNC(shareAssigned);
};



