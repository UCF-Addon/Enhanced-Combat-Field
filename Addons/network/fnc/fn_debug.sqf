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
	[true] call DFUNC(dDrawRadioNetwork);
} else
{
	[false] call DFUNC(dDrawRadioNetwork);
};