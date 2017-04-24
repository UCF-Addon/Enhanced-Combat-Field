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

if (!hasInterface) exitWith {};

disableSerialization;

// TODO: Check whether unit has a vehicle of weapon to fix a workaround of the effects
// TODO: Check whether unit is using a scope to prevent worse nvg effects
private _hmd = hmd player;
private _visionMode = currentVisionMode player;

diag_log format ["Player with hmd: %1 is in vision mode: %2 with disable the nvg effect (%3)", _hmd, _visionMode, ((_hmd == "") || (_visionMode != 1) || (cameraView == "GUNNER"))];

if ((_hmd == "") || (_visionMode != 1) || (cameraView == "GUNNER")) exitWith
{
	[] call DFUNC(deactivateNVG);
};

[_hmd] call DFUNC(activateNVG);