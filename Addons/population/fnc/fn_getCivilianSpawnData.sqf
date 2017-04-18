#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 *
 * Return Value:
 * 0: type <STRING>
 * 1: pos <POS3D>
 * 2: dir <SCALAR>
 * 3: attribute <SCRIPTS>
 * 4: house <OBJECT> [Optional]
 * 5: group <GROUP> [Optional]
 *
 * Public: No
 */

params [["_center", [], [[]]]];

private _type = [] call DFUNC(randomUnitType);
private _pos = [0,0,0];
private _dir = random 180;

private _houses = nearestObjects [_center, ["House"], GMVAR(DOUBLE(civ,spawnMaxRadius))];
if ((count _houses) < 2) exitWith { [] };

_houses = [_houses, [_center], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;

_pos = getPos (selectRandom _houses);

[_type, _pos, _dir, [{_this disableAI "AUTOTARGET"}, {_this disableAI "PATH"}, {_this disableAI "TARGET"}, {_this disableAI "SUPPRESSION"}, {_this disableAI "COVER"}, {_this disableAI "AUTOCOMBAT"}, {_this disableAI "CHECKVISIBLE"}, {_this setAnimSpeedCoef (0.8 + random 0.2)}, {_this setSpeedMode "LIMITED"}, {_this setBehaviour "CARELESS"}], objNull, grpNull]