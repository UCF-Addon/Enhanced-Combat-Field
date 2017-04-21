#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Return Value:
 * 0: exits <BOOL>
 *
 * Public: No
**/

params [["_obj", objNull]];

if (isNull _obj) exitWith {};

if ((count (_obj getVariable [QGMVAR(collectors), []]) > 0) || !isNil {_obj getVariable [QGMVAR(powerSource), nil]}) exitWith { true };
false