#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_obj", objNull]];

if (isNull _obj) exitWith {};

// TODO: handle delay of wake-up of the system and initialization
_obj setVariable [QGMVAR(isStarted), true, true];