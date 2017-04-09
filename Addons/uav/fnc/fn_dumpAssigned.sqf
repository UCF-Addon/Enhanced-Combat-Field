#include "script_component.h"
/*
 * Author: Lt. Julius
 * Remove assigned target from network
 *
 * Arguments:
 * 0: The marked target <OBJECT, POS3D>
 * 1: The user to remove <OBJECT>
 * 2: The user who created <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_target", objNull, [[], objNull]], ["_shareTarget", objNull, [objNull]], ["_origin", objNull, [objNull]]];

if (isNull _origin) exitWith {};
if (isNull _target) exitWith {};
if (isNull _shareTarget || !isPlayer _shareTarget) exitWith {};

if (!local _shareTarget) exitWith
{
	[QFUNC(dumpAssigned), [_target, _shareTarget, _origin], _shareTarget] call CBA_fnc_targetEvent;
};

_assigned =
[
	_target,
	_origin
];

GMVAR(assignedTargets) = GMVAR(assignedTargets) - [_assigned];