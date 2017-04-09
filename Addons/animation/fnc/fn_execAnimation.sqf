#include "script_component.h"
/**
*	[] call DFUNC(execAnimation);
*
*	1. _unit - unit of execution and animation
*	2. _animation - animation for unit
*
*/
params[["_unit", objNull, [objNull]], "_animation"];

if (isNull _unit) exitWith {};
if (isNil "_animation" || _animation == "") exitWith {};

if (!isPlayer _unit) then
{
	if (local _unit) then
	{
	    // AI is local and execute
		// [QFUNC(execAnimation), _unit, _animation] call CBA_fnc_localEvent;
		_unit playMoveNow _animation; // playMoveNow - global space
	} else
	{
		[QFUNC(execAnimation), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
	};
} else
{
	if (local _unit) then
	// if ((isMultiplayer && !isServer) || !isMultiplayer) then
	{
		// Player is local and execute
	    // [QFUNC(execAnimation), _unit, _animation] call CBA_fnc_executeLocalEvent;
		_unit playMoveNow _animation; // playMoveNow - global space
	} else
	{
		[QFUNC(execAnimation), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
	};
};
true