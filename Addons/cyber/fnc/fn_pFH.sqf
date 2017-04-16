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
**/

params [];

{
	[_x] call DFUNC(openClient);
	nil
} count (missionNamespace getVariable [QGMVAR(clients), []]);