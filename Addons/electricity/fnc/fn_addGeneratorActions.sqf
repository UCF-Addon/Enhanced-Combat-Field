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

private _type = typeOf _obj;

if (getNumber (configFile >> "CfgVehicles" >> _type >> QGMVAR(isGenerator)) != 1) exitWith {};
if (_type in GMVAR(initializedClasses)) exitWith {};

GMVAR(initializedClasses) pushBack _type;

private _actionStart =
[
	"StartGenerator",
	"Start Generator",
	"",
	{_target setVariable ["isStarted", true, true]},
	{!(_target getVariable ["isStarted", false])},
	{},
	[],
	[0,0,1],
	4
] call ace_interact_menu_fnc_createAction;

private _actionStop =
[
	"StopGenerator",
	"Stop Generator",
	"",
	{_target setVariable ["isStarted", false, true]},
	{(_target getVariable ["isStarted", false])},
	{},
	[],
	[0,0,1],
	4
] call ace_interact_menu_fnc_createAction;

[_type, 0, [], _actionStart] call ace_interact_menu_fnc_addActionToClass;
[_type, 0, [], _actionStop] call ace_interact_menu_fnc_addActionToClass;