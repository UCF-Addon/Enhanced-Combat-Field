#include "script_component.h"

params[["_coef", 1, [0]], ["_type", 0, [0]]];

GMVAR(rblurPPEffectCC) ppEffectEnable true;
GMVAR(rblurPPEffectCC) ppEffectAdjust [_coef, _coef, 0.06, 0.06];
GMVAR(rblurPPEffectCC) ppEffectCommit 0.1;

waitUntil { ppEffectCommitted GMVAR(rblurPPEffectCC) };
uiSleep 3;

GMVAR(rblurPPEffectCC) ppEffectEnable false;
ppEffectDestroy GMVAR(rblurPPEffectCC);