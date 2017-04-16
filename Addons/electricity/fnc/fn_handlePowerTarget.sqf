#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 * 1: power <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_obj", objNull], ["_power", true, [false]]];

if (isNull _obj) exitWith{};

_entry = configFile >> "CfgVehicles" >> (typeOf _obj);
_code = "";

if (_power) then
{
	_code = getText (_entry >> "powerOn");
} else
{
	_code = getText (_entry >> "powerOff");
};

if (_code != "") then
{
	[_obj] call compile _code;
};

if (getNumber (_entry >> "powerDistributor") == _true) then
{
	{
		[_x, _power] call CBA_fnc_localEvent;
	} forEach (_obj getVariable [QGMVAR(collectors), []]);
};