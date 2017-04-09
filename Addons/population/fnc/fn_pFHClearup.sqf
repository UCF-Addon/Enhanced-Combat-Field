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
 */

params [];

if (!isNil QGMVAR(centerpFH)) then
{

};

if (!isNil QGMVAR(objectpFH)) then
{
	_houses = [];

	{
		_center = _x;
		_houses = _houses + (_center nearObjects ["House", 150]);

		{
			if (!isNull (_x getVariable [QGMVAR(parked), objNull])) then
			{
				[(_x getVariable [QGMVAR(parked), objNull])] call DFUNC(dropCar);
				_x setVariable [QGMVAR(parked), nil, false];
			};
		} forEach ((_center nearObjects ["House", GMVAR(DOUBLE(par,despawnRadius))]) - (_center nearObjects ["House", GMVAR(DOUBLE(par,spawnRadius))]));
	} forEach GMVAR(center);

	{
		_center = _x;
		_houses = _houses - (_center nearObjects ["House", 75]);

	} forEach GMVAR(center);

	{
		if ((_x getVariable [QGMVAR(isFurnished), _false]) == _true) then
        {
        	[_x] call DFUNC(defurnish);
        	_x setVariable [QGMVAR(isFurnished), _false, false];
        };
	} forEach _houses;
};

if (!isNil QGMVAR(trafficpFH)) then
{
	{
		if ((_x getVariable [QGMVAR(isAmbient), _false]) == _true) then
		{
			if !([_x] call DFUNC(checkVisible)) then
			{
				[_x] call DFUNC(dropCar);
			};
		};
	} forEach vehicles;
};

if (!isNil QGMVAR(civilianpFH)) then
{
	{
		_civ = _x;
		_bool = false;

		{
			if ((_x distance _civ) < 450) then
			{
				_bool = true;
				break;
			};
		} forEach GMVAR(center);

		if (!_bool) then
		{
			_grp = group _civ;

			deleteVehicle _civ;

			if ((count (units _grp)) < 1) then
			{
				deleteGroup _grp;
			};
 		};
	} forEach (allUnits select {((side _x) == civilian) && ((_civ getVariable [QGMVAR(isAmbient), _false]) == _true)});
};