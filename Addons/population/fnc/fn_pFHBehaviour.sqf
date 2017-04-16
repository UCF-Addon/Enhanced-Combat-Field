#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments (is Per Frame Handler):
 * 0: civilian pFH <BOOL>
 * 1: traffic pFH <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

(_this select 0) params ["_isCivilianPFH", "_isTrafficPFH"];

if (_isCivilianPFH) then
{
	GMVAR(DOUBLE(civ,talk)) = GMVAR(DOUBLE(civ,talk)) + 1;

	if (GMVAR(DOUBLE(civ,talk)) >= 250) then
	{
		_civilians = allUnits select {(alive _x) && ((side _x) == civilian)};

		{
			_civ = _x;

			if ((_civ getVariable [QGMVAR(timeout), 0]) == 0) then
			{
				_rest = _civilians - [_civ] - (_civilians select { ((_x distance _civ) > 5) && ((_x getVariable [QGMVAR(timeout), 0]) == 0) });

				{
					if ((_x distance _civ) < GMVAR(DOUBLE(civ,interactDistance)) && (stance _civ) == "STAND" && (stance _x) == "STAND") exitWith
					{
						_civ setVariable [QGMVAR(timeout), -1, false];
						_x setVariable [QGMVAR(timeout), -1, false];

						_nul = [_civ, _x] spawn
						{
							params ["_unit", "_target"];

							_target disableAI "PATH";

							_bc = 0;
							waitUntil
							{
								sleep 0.5;

								_bc = _bc + 1;
								_unit doMove (getPos _target);
								((_unit distance _target) < 3 || _bc > 40)
							};

							if (_bc > 40 && (_unit distance _target) > 3) exitWith
							{
								_unit setVariable [QGMVAR(timeout), 0, false];
								_target setVariable [QGMVAR(timeout), 0, false];
							};

							_dirFrom = [_unit, _target] call BIS_fnc_dirTo;
							_dirTo = [_target, _unit] call BIS_fnc_dirTo;

							_unit setDir _dirFrom;
							_target setDir _dirTo;

							_unit disableAI "MOVE";

							sleep (random 3);

							// Animation Part
							// do animate

							sleep GMVAR(DOUBLE(civ,minTimeout));
							_unit enableAI "MOVE";
							_target enableAI "PATH";

							_unit setVariable [QGMVAR(timeout), 0, false];
							_target setVariable [QGMVAR(timeout), 0, false];
						};
					};
				} forEach _rest;
			};

			if ((_civ getVariable [QGMVAR(timeout), 0]) > 0) then
			{
				_civ setVariable [QGMVAR(timeout), ((_civ getVariable [QGMVAR(timeout), 0]) - 1), false];
			};
		} forEach _civilians;
	};
};

if (_isTrafficPFH) then
{
	GMVAR(DOUBLE(driver,speed)) = GMVAR(DOUBLE(driver,speed)) + 1;

    if (GMVAR(DOUBLE(driver,speed)) >= 25) then
    {
    	{
    		private _car = _x;

    		if (!isNull (driver _car) && ((!isPlayer _car) && (alive _car))) then
    		{
    			if ((({(isPlayer (driver _x) && alive (driver _x))} count (_car nearEntities ["Car", 70])) > 0) || (({!isNull (driver _x)} count (_car nearEntities ["Car", 150])) > 0)) then
    			{
    				(group (driver _car)) setSpeedMode "LIMITED";
    			} else
    			{
    				(group (driver _car)) setSpeedMode "NORMAL";
    			};
    		};
        } forEach vehicles;
    };
};