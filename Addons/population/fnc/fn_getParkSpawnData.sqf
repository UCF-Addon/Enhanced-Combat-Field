#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: house <OBJECT>
 *
 * Return Value:
 * 0: type <STRING>
 * 1: position <POS3D>
 * 2: direction <SCALAR>
 * 3: fuel <SCALAR>
 *
 * Public: No
 */

params [["_house", objNull]];

if (isNull _house) exitWith { [] };

private _roads = _house nearRoads 25;
if (count _roads < 1) exitWith { [] };

private _road = _roads select 0;
for "_i" from 0 to ((count _roads) - 1) do
{
	if (((getPos (_roads select _i)) distance _house) < ((getPos _road) distance _house)) then
	{
		_road = _roads select _i;
	};
};

if (count (_road nearEntities ["Car", 25]) > 0) exitWith { [] };

private _connectedRoads = roadsConnectedTo _road;
if (count _connectedRoads < 1) exitWith { [] };

private _conRoad = _connectedRoads select 0;

private _roadDir = [_road, _conRoad] call BIS_fnc_dirTo;
_roadDir = _roadDir + (180 * round (random 1));
private _houseDir = _roadDir + 90;

private _pos = [(((getPosASL _road) select 0) + (4 * sin _houseDir)), (((getPosASL _road) select 1) + (4 * cos _houseDir)), 0];

[([false, ID_PARK] call DFUNC(randomCarType)), _pos, _roadDir, (random 0.45)]