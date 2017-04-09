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
_hmd = hmd player;
_visionMode = currentVisionMode player;

if ((_hmd == "") || (_visionMode != 1) || (cameraView == "GUNNER")) exitWith
{
	[] call DFUNC(deactivateNVG);
};

[_hmd] call DFUNC(activateNVG);