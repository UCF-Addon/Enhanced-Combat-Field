#include "script_component.h"
/*
 * Author: Blackswater
 * Check whether target is marked
 *
 * Arguments:
 *
 * Return Value:
 * 0: whether target is marked <BOOL>
 *
 * Public: No
 */

params [];

_ct = [] call DFUNC(getTarget);

if (isNull _ct) exitWith { false };

(_ct getVariable [QGMVAR(isMarked), false])