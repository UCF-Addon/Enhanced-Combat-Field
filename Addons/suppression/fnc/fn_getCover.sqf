#include "script_component.h"

params[["_unit", objNull, [objNull]], ["_coef", 0, [0]], ["_coverDir", -1, [0]]];
private "_coverCoef";

if (isNil "_unit" || isNull _unit || !alive _unit) exitWith {};

if (_coef >= GMVAR(__coef_0)) then
{
	if (_coef >= GMVAR(__coef_1)) then
	{
		if (_coef >= GMVAR(__coef_2)) then
		{
			_coverCoef = 3;
		} else
		{
			_coverCoef = 2;
		};
	} else
	{
		_coverCoef = 1;
	};
} else
{
	_coverCoef = 0;
};

if (_coverCoef > 0) then
{
	if ((_unit getVariable [QGMVAR(findCover), _false]) == _false) then
	{
		_unit setVariable [QGMVAR(findCover), _true, false];
		_nul = [_unit, _coverCoef, _coverDir] spawn DFUNC(findCover);

		/*
		* AI System of ECF Core
		* add Command to AI System for Support against Suppression
		*
		if (ADDB(ECF_ai)) then
		{
			_cid = [side _unit, "SUPPORT", getPos _unit, [TODO: Direction _dir, Distance _dist], -1, -1] call DMFUNC(ai,addCommand);
			_unit setVariable [QGVAR(depTasks), ((_unit getVariable [QGVAR(depTasks), []]) pushBack _cid), true];
		};
		*/
	};
};