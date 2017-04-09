#include "script_component.h"
/**
*	[] call DFUNC(execAfterAnim);
*
*	1. _unit - unit of execution and animation
*	2. _animation - animation for unit
*	3. _condition - condition for animation
*	4. _func - function which is executed after animation
*	5. _params - parameter for the function after the animation
*
*/
params[["_unit", objNull, [objNull]], "_animation", ["_condition", "", ["", {}]], ["_func", "", ["", {}]], ["_params", [], [[]]]];

if (isNull _unit) exitWith {};
if (isNil "_animation" || _animation == "") exitWith {};
if (isNil "_func" || _func == "") exitWith {};

if (isNil "_condition" || _condition == "") then
{
	[_unit, _animation, _condition] call DFUNC(condAnimation);
	waitUntil { isNil (_unit getVariable QGMVAR(condAnimation)) };
} else
{
	[_unit, _animation] call DFUNC(execAnimation);
	waitUntil { (_animation != (animationState _unit)) };
};

if ((typeName _func) == "STRING") then
{
	_func = compile _func;
};

_params call _func;
true