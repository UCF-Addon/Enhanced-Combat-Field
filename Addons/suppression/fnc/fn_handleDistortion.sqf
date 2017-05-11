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

private _strength = GMVAR(DOUBLE(dist,strength));

if (_strength > 0) then
{
	GMVAR(DOUBLE(PP,dist)) ppEffectEnable true;
	GMVAR(DOUBLE(PP,dist)) ppEffectAdjust [_strength];
    GMVAR(DOUBLE(PP,dist)) ppEffectCommit 0.02;
};

_strength = _strength - 0.0036; // Reduction of 0.18 per Second
GMVAR(DOUBLE(dist,strength)) = _strength;