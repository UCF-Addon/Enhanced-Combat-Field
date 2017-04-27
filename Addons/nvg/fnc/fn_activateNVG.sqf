#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_class", nil, ["",nil]]];

if (isNil "_class") exitWith {};

private _data = [_class] call DFUNC(getNVGEffectData);

GMVAR(DOUBLE(PP,wetDist)) ppEffectEnable true;
GMVAR(DOUBLE(PP,filmGrain)) ppEffectEnable true;

GMVAR(DOUBLE(PP,wetDist)) ppEffectAdjust (_data select 0);
GMVAR(DOUBLE(PP,filmGrain)) ppEffectAdjust (_data select 1);

GMVAR(DOUBLE(PP,wetDist)) ppEffectCommit 0;
GMVAR(DOUBLE(PP,filmGrain)) ppEffectCommit 0;