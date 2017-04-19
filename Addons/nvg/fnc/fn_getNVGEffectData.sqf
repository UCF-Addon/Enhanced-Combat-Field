#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: classname <STRING>
 *
 * Return Value:
 * 0: data <ARRAY>
 *
 * Public: No
 */

params [["_class", nil, [nil,""]]];

if (isNil "_class") exitWith {};

private _data = [];

private _value = getArray (configFile >> "CfgWeapons" >> _class >> QGMVAR(wetDist));
if ((count _value) == 15) then
{
	_data pushBack _value;
} else
{
	_data pushBack [1, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0];
};

_value = getArray (configFile >> "CfgWeapons" >> _class >> QGMVAR(filmGrain));
if ((count _value) == 6) then
{
	_value set [5, ((_value select 5) == _true)];
	_data pushBack _value;
} else
{
	_data pushBack [0.05, 0, 2, 2.77,1.96, true];
};

_data