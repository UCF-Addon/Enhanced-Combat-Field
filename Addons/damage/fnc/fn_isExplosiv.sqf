#include "script_component.h"

params [["_obj", objNull, [objNull]], ["_selection", nil, ["", nil, []]]];

if (isNull _obj) exitWith { false };
if (isNil "_selection" || _selection == "") then
{
	if ((getNumber (configFile >> "CfgVehicles" >> typeOf _obj >> QGMVAR(explosivType))) > EXP_NONE) exitWith { true };
} else
{
	if ((typeName _selection) == "ARRAY") then
    {
    	// TODO: calculate explosiv relative location to object
    } else
    {
		private _explosiv = false;
		private _zones = getArray (configFile >> "CfgVehicles" >> typeOf _obj >> QGMVAR(explosivZone));

		if ((count _zones) < 1) exitWith { false };

		_explosiv = {
			if ((typeName _x) == "STRING") then
			{
				if (_selection == _x) exitWith { true };
			};
		} forEach _zones;

		if (_explosiv) exitWith { true };
    };
};

false