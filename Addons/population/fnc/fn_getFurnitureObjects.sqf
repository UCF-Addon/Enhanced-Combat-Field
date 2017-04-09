#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: house <OBJECT>
 *
 * Return Value:
 * 0: data <ARRAY>
 *
 * Public: No
 */

params [["_house", objNull]];

if (isNull _house) exitWith { [] };

private _data = [];

if (isClass (configFile >> "CfgVehicles" >> (typeOf _house) >> QGVAR(Furniture))) then
{
	_i = 0;

	while { (isArray (configFile >> "CfgVehicles" >> (typeOf _house) >> QGVAR(Furniture) >> (format ["Item%1", _i]))) } do
	{
		_data pushBack (getArray (configFile >> "CfgVehicles" >> (typeOf _house) >> QGVAR(Furniture) >> (format ["Item%1", _i])));
		_i = _i + 1;
	};
};

_data