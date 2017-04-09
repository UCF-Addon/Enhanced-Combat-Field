#include "script_component.h"
/*
 * Author: Lt. Julius
 * Event handler for near fired shoot to civilians
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];
private ["_cover", "_grp"];

if (isMultiplayer && !isServer) exitWith {};
if (isNull _unit || (side _unit != CIVILIAN) || isPlayer _unit) exitWith {};

if ((time - (_unit getVariable [QGMVAR(lastHandle), 0])) < 20) exitWith {};
if ((primaryWeapon _unit) != "" || (secondaryWeapon _unit) != "" || (handgunWeapon _unit) != "") exitWith {};

if (_unit getVariable [QGMVAR(prone), _false] == _true) exitWith {};
_unit setVariable [QGMVAR(prone), _true, false];

_cover = [];
if ((random 1) >= 0.30) then
{
	_cover = [(getPos _unit)] call DFUNC(findCover);
};

_grp = group _unit;
while {(count (waypoints _grp)) > 0} do
{
	deleteWaypoint ((waypoints _grp) select 0);
};
// doStop _unit;

if (count (_cover) < 1) exitWith
{
	[_unit, false] call DFUNC(setProne);
};

[_unit, true] call DFUNC(setProne);
_unit doMove _cover;

_unit setVariable [QGMVAR(lastHandle), time, false];