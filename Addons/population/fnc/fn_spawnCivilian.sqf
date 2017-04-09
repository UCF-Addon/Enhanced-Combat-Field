#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_center", [], [[]]]];

if ((count _center) != 3) exitWith {};

private _spawnData = [_center] call DFUNC(getCivilianSpawnData);
if ((count _spawnData) != 6) exitWith {};

private _grp = _spawnData select 5;

if (isNull _grp) then
{
	_grp = createGroup civilian;
};

private _civ = _grp createUnit [(_spawnData select 0), (_spawnData select 1), [], 0, "FORM"];
_civ setDir (_spawnData select 2);
_civ setVariable [QGMVAR(isAmbient), _true, false];

{
	_civ call _x;
} forEach (_spawnData select 3);

if (!isNull (_spawnData select 4)) then
{
	_array = (_spawnData select 4) getVariable [QGMVAR(occupants), []];
	_array pushBack _civ;
	(_spawnData select 4) setVariable [QGMVAR(occupants), _array, false];

	_civ setVariable [QGMVAR(residence), (_spawnData select 4), false];
};

[_center, _grp, _civ] call DFUNC(assignCivilianWaypoints);