#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: drone <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_drone", objNull]];

if (isNull _drone) exitWith {};

(_drone getVariable [QGMVAR(isSpotting), false])