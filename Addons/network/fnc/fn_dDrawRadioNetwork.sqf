#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: on <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_on", false, [false]]];

if (_on) then
{
	_markers = [];
	{
		_rx = (_x select 1);
		_ry = (_x select 2);
		_coef = (_x select 3);

		{
			if ((_x isKindOf "Land_TTowerBig_1_F" || _x isKindOf "Land_TTowerBig_2_F") ||
				((count (_x nearObjects ["Land_TTowerBig_1_F", 250])) < 1 &&
				(count (_x nearObjects ["Land_TTowerBig_2_F", 250])) < 1)) then
			{
				_marker = createMarkerLocal [(format ["trans-%1", (count _markers)]), (getPos _x)];
				_marker setMarkerShapeLocal "ELLIPSE";
				_marker setMarkerColorLocal "ColorRed";

				_n = count (_x nearObjects ["House", floor (sqrt (_rx * _ry))]);
				_red = _coef * _n;

				systemChat format ["Count: %1, Reduction: %2", _n, _red];
				_marker setMarkerSizeLocal [_rx - _red, _ry - _red];

				_loc = nearestLocation [(getPos _x), "Airport"];
				if (((getPos _loc) distance (getPos _x)) < 250) then
				{
					_marker setMarkerColorLocal "ColorBrown";
				};
				_markers pushBack _marker;
			};
        } forEach (player nearObjects [(_x select 0), 40000]);
	} forEach [["Land_Communication_F", 1250, 1250, 0.18], ["Land_TTowerBig_1_F", 3000, 3000, 0.28], ["Land_TTowerBig_2_F", 3750, 3750, 0.25], ["Land_TTowerSmall_1_F", 650, 650, 0.48], ["Land_TTowerSmall_2_F", 850, 850, 0.65]];

	missionNamespace setVariable [QGMVAR(debug_radioNetworkMarker), _markers, false];
} else
{
	{
		deleteMarkerLocal _x;
	} forEach (missionNamespace getVariable [QGMVAR(debug_radioNetworkMarker), []]);
};