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
		_marker = createMarkerLocal [(format ["radar-%1", (count _markers)]), (getPos _x)];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerColorLocal "ColorBlue";

		_marker setMarkerSizeLocal [8500, 8500];
		_markers pushBack _marker;
    } forEach (player nearObjects ["Land_Radar_F", 40000]);

	{
		_marker = createMarkerLocal [(format ["radar-%1", (count _markers)]), (getPos _x)];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerColorLocal "ColorBlue";

		_marker setMarkerSizeLocal [6500, 6500];
		_markers pushBack _marker;
    } forEach (player nearObjects ["Land_Radar_Small_F", 40000]);

	missionNamespace setVariable [QGMVAR(debug_radarNetworkMarker), _markers, false];
} else
{
	{
		deleteMarkerLocal _x;
	} forEach (missionNamespace getVariable [QGMVAR(debug_radarNetworkMarker), []]);
};