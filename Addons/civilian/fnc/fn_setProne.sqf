 #include "script_component.h"
/*
 * Author: Julius
 * set animation and speed for unit
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: moveCover <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
 
 params ["_unit", ["_moveCover", false, [false]]];

_rnd = 0;

if (_moveCover) then
{
	_rnd = floor random 3;
} else
{
	_rnd = floor random 2;
};

switch (_rnd) do
{
	case 0:
	{
		[_unit, "ApanPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove"];
		(group _unit) setSpeedMode "FULL";
	};
	case 1:
	{
		_unit playMoveNow "ApanPknlMstpSnonWnonDnon_G01";
		(group _unit) setSpeedMode "FULL";
	};
	case 2:
	{
		_unit playMoveNow "ApanPpneMstpSnonWnonDnon_G01";
		(group _unit) setSpeedMode "FULL";
	};
};