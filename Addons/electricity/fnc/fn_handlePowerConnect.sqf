#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: source <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_src", objNull], ["_target", objNull]];

if (isNull _src || isNull _target || _src == _target) exitWith {};

_obj = _src;
while { !isNull _obj } do
{
	_obj = _obj getVariable [QGMVAR(powerSource), objNull];

	if (_obj == _target) exitWith { hint "Do not build circle with power."; };
};

if (!isNull _obj) exitWith {};

private _arr = _src getVariable [QGMVAR(collectors), []];
_arr pushBack _target;
_src setVariable [QGMVAR(collectors), _arr, true];

_target setVariable [QGMVAR(powerSource), _src, true];