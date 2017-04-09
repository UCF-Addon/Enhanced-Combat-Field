#include "script_component.h"

(_this select 0) params [["_target", objNull], ["_source", objNull], ["_projectile", objNull], ["_pos", objNull], ["_velo", objNull], ["_selection", nil], ["_ammo", nil], ["_dir", objNull], ["_rad", objNull], ["_sur", nil], ["_direct", true]];

diag_log format ["%1 hit direct (%6) by %2 in %3 ( Material: %7 ) using %4 with a speed of %5", _target, _source, _selection, _ammo, _velo, _direct, _sur];

private _sel = "";
{
	if ((_pos distance (_target modelToWorld (_target selectionPosition _x))) < (_pos distance (_target modelToWorld (_target selectionPosition _sel)))) then
	{
		_sel = _x;
	};
} forEach (selectionNames _target);

if (typeOf _target in ["StorageBladder_01_fuel_forest_F", "StorageBladder_01_fuel_sand_F", "Land_GasTank_02_F", "Land_fs_feed_F", "Land_FuelStation_02_pump_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_Feed_F", "Land_GasTank_01_blue_F", "Land_GasTank_01_khaki_F", "Land_GasTank_01_yellow_F"]) then
{
	[_target, _sel, _velo] call DFUNC(handleDamage);
};