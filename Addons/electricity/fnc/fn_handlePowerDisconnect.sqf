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

_src = _obj getVariable [QGMVAR(powerSource), objNull];

if (!isNull _src) then
{
	private _arr = _src getVariable [QGMVAR(collectors), []];
	_arr = _arr - [_obj];
	_src setVariable [QGMVAR(collectors), _arr, true];
};

_obj setVariable [QGMVAR(powerSource), nil, true];