#include "script_component.h"

private ["_strength"];

if ((isNil "_strength") OR (isNull _strength)) then
{
    _strength = 0.2;
};

GMVAR(flashPPEffectCC) ppEffectEnable true;
GMVAR(flashPPEffectCC) ppEffectAdjust [1,1,(0.8 + _strength) min 1,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
GMVAR(flashPPEffectCC) ppEffectCommit 0.1;

[{
    params ["_strength"];

    GMVAR(flashPPEffectCC) ppEffectAdjust [1,1,0,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
    GMVAR(flashPPEffectCC) ppEffectCommit (10 * _strength);
}, [_strength], 7 * _strength] call CBA_fnc_waitAndExecute;

[{
    GMVAR(flashPPEffectCC) ppEffectEnable false;
}, [], 17 * _strength] call CBA_fnc_waitAndExecute;