#include "script_component.h"
/*
 * Author: Julius
 * Return list of valid vehicles where object is in loading zone
 *
 * Arguments:
 * 0: object <OBJECT>
 *
 * Return Value:
 * 0: list of zones and vehicles <ARRAY>
 *
 * Public: No
 */

params [["_obj", objNull, [objNull]]];

if (isNull _obj) exitWith {};

_validZones = [];

{
	_vehicle  = _x;

	if ([_vehicle] call DFUNC(canLoadObjects)) then
	{
		_zones = getArray (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "ECF_logistic_Container" >> QUOTE(DOUBLE(logistic,zones)));

		{
			_pos = getArray (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "ECF_logistic_Container" >> _x >> "pos");
			_size = getArray (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "ECF_logistic_Container" >> _x >> "size");

			_posMin = _pos vectorAdd [-(_size select 0), -(_size select 1), 0];
			_posMax = _pos vectorAdd [(_size select 0), (_size select 1), (_size select 2)];

			_posObj = _vehicle worldToModel (getPos _obj);

			if ((((_posMin select 0) < (_posObj select 0)) && ((_posObj select 0) < _posMax select 0)) &&
				(((_posMin select 1) < (_posObj select 1)) && ((_posObj select 1) < _posMax select 1)) &&
				(((_posMin select 2) < (_posObj select 2)) && ((_posObj select 2) < _posMax select 2))) then
			{
				_validZones pushBack [_vehicle, _x];
			};
		} forEach _zones;
	};
} forEach ((getPos _obj) nearEntities [["Car", "Helicopter", "Tank"], 15]);

_validZones