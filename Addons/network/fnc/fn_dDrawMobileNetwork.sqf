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
		_marker = createMarkerLocal [(format ["mobile-%1", (count _markers)]), (getPos _x)];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerColorLocal "ColorOrange";

		_marker setMarkerSizeLocal [550, 250];
		_marker setMarkerDirLocal ((getDir _x) + 80);
		_markers pushBack _marker;
    } forEach (player nearObjects ["Land_SatelliteAntenna_01_F", 40000]);

	missionNamespace setVariable [QGMVAR(debug_mobileNetworkMarker), _markers, false];
} else
{
	{
		deleteMarkerLocal _x;
	} forEach (missionNamespace getVariable [QGMVAR(debug_mobileNetworkMarker), []]);
};