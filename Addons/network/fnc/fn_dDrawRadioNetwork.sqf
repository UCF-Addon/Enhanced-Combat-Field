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
		_marker = createMarkerLocal [(format ["trans-%1", _forEachIndex]), (getPos _x)];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerSizeLocal [1250, 1250];
		_marker setMarkerColorLocal "ColorRed";

		_markers pushBack _marker;
	} forEach (nearestTerrainObjects [player, ["TRANSMITTER"], 20000]);

	missionNamespace setVariable [QGMVAR(debug_radioNetworkMarker), _markers, false];
} else
{
	{
		deleteMarkerLocal _x;
	} forEach (missionNamespace getVariable [QGMVAR(debug_radioNetworkMarker), []]);
};