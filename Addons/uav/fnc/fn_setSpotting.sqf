#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: drone <OBJECT>
 * 1: on <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_drone", objNull], ["_on", false]];

if (isNull _drone) exitWith {};
_drone setVariable [QGMVAR(isSpotting), _on, true];