#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: logic <OBJECT>
 * 1: units <ARRAY>
 * 2: activ <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_logic", objNull], ["_units", []], ["_activ", true]];

{
	_x setVariable [QGVAR(var_isBreacher), _true, true];
	nil
} count _units;