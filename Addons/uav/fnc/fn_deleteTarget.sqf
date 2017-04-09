#include "script_component.h"
/*
 * Author: Lt. Julius
 * Event handler of delete of assigned
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

// TODO: if Null get POS3D over intersect with "find nearby"
if (isNull _target) exitWith {};
if (isNull _player) exitWith {};

_uav = getConnectedUAV _player;
if (isNull _uav) exitWith {};

[_target, _player, _uav] call DFUNC(dumpAssigned);
_target setVariable [QGMVAR(isMarked), false, false];

if (_player != (leader group _player)) then
{
	[_target, (leader group _player), _uav] call DFUNC(dumpAssigned);
};