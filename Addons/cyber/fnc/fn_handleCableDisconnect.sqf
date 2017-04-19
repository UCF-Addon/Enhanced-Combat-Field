#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_obj", objNull]];

if (isNull _obj) exitWith {};

private _cons = _obj getVariable [QGMVAR(cableConnections), []];

{
	_arr = _x getVariable [QGMVAR(cableConnections), []];
	_arr = _arr - [_obj];
	_arr setVariable [QGMVAR(cableConnections), _arr, true];
	nil
} count _cons;

_obj setVariable [QGMVAR(cableConnections), nil, true];