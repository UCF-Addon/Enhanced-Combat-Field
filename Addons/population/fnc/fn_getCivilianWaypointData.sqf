#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: group <GROUP>
 * 1: unit <OBJECT>
 * 2: index <SCALAR>
 * 3: significant positions <ARRAY>
 *
 * Return Value:
 * 0: position <POS3D>
 * 1: radius <SCALAR>
 *
 * Public: No
 */

params [["_grp", grpNull], ["_unit", objNull], ["_index", 0, [0]], ["_significantPos", [], [[]]]];

if (isNull _grp || isNull _unit) exitWith {};

private _lastPos = (getPos _unit);

if (_index > 1) then
{
	_lastPos = getWPPos [_grp, (_index - 1)];
};

// TODO: add function for better perfomance while calculate significant positions
private _subList = _significantPos select { ((_x distance2D _lastPos) > GMVAR(DOUBLE(civ,spawnMinRadius))) };

_significantPos = _significantPos - (_significantPos - _subList);

private _newPos = selectRandom _significantPos;

[(getPosASL _newPos), 5]