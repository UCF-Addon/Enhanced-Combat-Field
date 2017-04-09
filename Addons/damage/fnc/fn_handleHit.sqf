#include "script_component.h"

(_this select 0) params [["_unit", objNull], ["_causedBy", objNull], ["_damage", 0], ["_instigator", objNull]];

/*
* Land_CanisterFuel_F
*/
if ((typeOf _unit) in ["StorageBladder_01_fuel_forest_F", "StorageBladder_01_fuel_sand_F", "Land_GasTank_02_F", "Land_fs_feed_F", "Land_FuelStation_02_pump_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_Feed_F", "Land_GasTank_01_blue_F", "Land_GasTank_01_khaki_F", "Land_GasTank_01_yellow_F"]) then
{
	[_unit, nil, [_damage * 30000, 0, 0]] call DFUNC(handleDamage);
}