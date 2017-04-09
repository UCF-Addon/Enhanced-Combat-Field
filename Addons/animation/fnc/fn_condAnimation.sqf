#include "script_component.h"
/**
*	[] call DFUNC(condAnimation);
*
*	1. _unit - unit of execution and animation
*	2. _animation - animation for unit
*	3. _condition - condition for animation
*
*/
params[["_unit", objNull, [objNull]], "_animation", ["_condition", "", ["", {}]]];

if (isNull _unit) exitWith {};
if (isNil "_animation" || _animation == "") exitWith {};
if (isNil "_condition" || _condition == "") exitWith {};

if (!local _unit) then
{
	[QFUNC(condAnimation), [_unit, _animation, _condition], _unit] call CBA_fnc_targetEvent;
};

/* Local Part */

if (typeOf _condition == "STRING") then
{
	_condition = compile _condition;
};

_pFH = [
	{
		params["_unit", "_animation", "_condition"];
		
		if (animationState _unit == _animation) then
		{
			if (!(call _condition)) then
			{
				// TODO: Transition Animation -> Origin Animation
				// TODO: better solution for animation return
				[_unit, (_unit getVariable [QGMVAR(originAnimation), ""])] remoteExec ["switchMove", 0, false];

				[_unit getVariable [QGMVAR(condAnimation)]] call CBA_fnc_removePerFrameHandler;
				_unit setVariable [QGMVAR(condAnimation), nil, true];
			};
		} else
		{
			if (call _condition) then
			{
				// TODO: better solution for animation return
				_unit setVariable [QGMVAR(originAnimation), (animationState _unit)];

				[_unit, _animation] call DFUNC(execAnimation);
			} else
			{
				[_unit getVariable [QGMVAR(condAnimation)]] call CBA_fnc_removePerFrameHandler;
				_unit setVariable [QGMVAR(condAnimation), nil, true];
			};
		};
		true
	},
	0,
	[_unit, _animation, _condition]] call CBA_fnc_addPerFrameHandler;

_unit setVariable [QGMVAR(condAnimation), _pFH];
true