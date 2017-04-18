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

if ((_logic getVariable "FurnitureActiv") == _true) then
{
	GVAR(DOUBLE(Population,objectpFH)) = true;
} else
{
	GVAR(DOUBLE(Population,objectpFH)) = false;
};

if ((_logic getVariable "CivilianActiv") == _true) then
{
	GVAR(DOUBLE(Population,civilianpFH)) = true;
} else
{
	GVAR(DOUBLE(Population,civilianpFH)) = false;
};

if ((_logic getVariable "TrafficActiv") == _false) exitWith {};
GVAR(DOUBLE(Population,trafficpFH)) = true;

if ((_logic getVariable "CarActiv") == _true) then
{
	GVAR(DOUBLE(Population,trafficpFHCar)) = true;
} else
{
	GVAR(DOUBLE(Population,trafficpFHCar)) = false;
};

if ((_logic getVariable "HeliActiv") == _true) then
{
	GVAR(DOUBLE(Population,trafficpFHHeli)) = true;
} else
{
	GVAR(DOUBLE(Population,trafficpFHHeli)) = false;
};

if ((_logic getVariable "BoatActiv") == _true) then
{
	GVAR(DOUBLE(Population,trafficpFHBoat)) = true;
} else
{
	GVAR(DOUBLE(Population,trafficpFHBoat)) = false;
};