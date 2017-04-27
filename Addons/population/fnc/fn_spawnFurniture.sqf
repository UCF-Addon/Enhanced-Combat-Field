#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 * 1: house <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_center", [], [[]]], ["_house", objNull, [objNull]]];

if ((count _center) != 3 || isNull _house) exitWith {};

private _spawnedObjs = [];
private _objects = [_house] call DFUNC(getFurnitureObjects);

if ((count _objects) < 1) exitWith {};

/*
{
	GMVAR(furCache) pushBack [_house, _x];
	nil
} count _objects;
*/

{
	_obj = [_house, _x] call DFUNC(furnish);

	if (!isNull _obj) then
	{
		_spawnedObjs pushBack _obj;
	};
	nil
} count _objects;

_house setVariable [QGMVAR(furniture), _spawnedObjs, false];
_house setVariable [QGMVAR(isFurnished), _true, false];

diag_log format ["Pushed %1 furniture objects to house %2", (count _objects), _house];