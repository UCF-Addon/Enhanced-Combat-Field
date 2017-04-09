#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [];

private _index = 0;
private _colorIndex = 0;

private _colors = ["ColorBlack", "ColorRed", "ColorBrown", "ColorOrange", "ColorYellow", "ColorKhaki", "ColorGreen", "ColorBlue", "ColorPink", "ColorWhite"];

{
	private _array = _x;

	{
		_index = _index + 1;

		_mark = createMarker [(format ["MELC%1", _index]), getPos _x];
		_mark setMarkerShape "ICON";
		_mark setMarkerType "hd_dot";

		_mark setMarkerColor (_colors select _colorIndex);
	} forEach (_array);

	_colorIndex = _colorIndex + 1;
	if (_colorIndex >= (count _colors)) then
	{
		_colorIndex = 0;
	};
} forEach [(nearestTerrainObjects [player, ["POWER LINES"], 20000, false, true]), (nearestTerrainObjects [player, ["POWERSOLAR"], 20000, false, true]), (nearestTerrainObjects [player, ["POWERWAVE"], 20000, false, true]), (nearestTerrainObjects [player, ["POWERWIND"], 20000, false, true]), (player nearObjects ["Land_HighVoltageTower_F", 20000]), (player nearObjects ["Land_HighVoltageTower_large_F", 20000]), (player nearObjects ["Land_HighVoltageTower_largeCorner_F", 20000]), (player nearObjects ["Land_PowerLine_distributor_F", 20000]), (player nearObjects ["Land_PowerLine_part_F", 20000]), (player nearObjects ["Land_PowerPoleConcrete_F", 20000]), (player nearObjects ["Land_PowerPoleWooden_F", 20000]), (player nearObjects ["Land_PowerPoleWooden_L_F", 20000]), (player nearObjects ["Land_PowerPoleWooden_small_F", 20000]), (player nearObjects ["Land_PowLines_Transformer_F", 20000]), (player nearObjects ["Land_HighVoltageEnd_F", 20000]), (player nearObjects ["Land_HighVoltageColumn_F", 20000])];