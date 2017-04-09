#include "script_component.h"
/*
 * Author: Julius
 * Check whether a vehicle can load objects as logistic
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * 0: if vehicle could load <BOOL>
 *
 * Public: No
 */

params [["_vehicle", objNull, [objNull]]];

if (isNull _vehicle) exitWith { false };

_typeOf = typeOf _vehicle;

_area = [];
_maxLoad = 0;

if (isClass (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container")) then
{
	_area = getArray (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_area");
	_maxLoad = getNumber (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_maxLoad");
};

(count _area == 3) && (_maxLoad > 0)