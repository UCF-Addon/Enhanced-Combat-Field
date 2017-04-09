#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_logic", ["_units", []], ["_activated", true]];

if !(GVAR(DOUBLE(Population,trafficpFH))) exitWith {};

if (GVAR(DOUBLE(Population,trafficpFHCar))) then
{
	_value = compile (_logic getVariable "CarTriggerSpawnTimeout");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,triggerSpawnTimeout)) = _value;
	};

	_value = compile (_logic getVariable "CarSpawnMinRadius");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,spawnMinRadius)) = _value;
	};

	_value = compile (_logic getVariable "CarSpawnMaxRadius");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,spawnMaxRadius)) = _value;
	};

	_value = compile (_logic getVariable "CarDespawnRadius");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,despawnRadius)) = _value;
	};

	_value = compile (_logic getVariable "CarWpAmount");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,wpAmount)) = _value;
	};

	_value = compile (_logic getVariable "CarWpMinRadius");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,wpMinRadius)) = _value;
	};

	_value = compile (_logic getVariable "CarWpMaxRadius");
	if ((typeName _value) == "NUMBER") then
	{
		GMVAR(DOUBLE(car,wpMaxRadius)) = _value;
	};
};

if (GVAR(DOUBLE(Population,trafficpFHHeli))) then
{

};

if (GVAR(DOUBLE(Population,trafficpFHBoat))) then
{

};