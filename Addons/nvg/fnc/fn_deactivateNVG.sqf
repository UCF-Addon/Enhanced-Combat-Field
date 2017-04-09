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

GMVAR(DOUBLE(PP,wetDist)) ppEffectEnable false;
GMVAR(DOUBLE(PP,filmGrain)) ppEffectEnable false;

GMVAR(DOUBLE(PP,wetDist)) ppEffectCommit 0;
GMVAR(DOUBLE(PP,filmGrain)) ppEffectCommit 0;