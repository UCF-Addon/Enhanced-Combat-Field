#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_veh", objNull]];

if (isNull _veh) exitWith {};

if (count (crew _veh) > 0) then
{
	_grp = group (driver _veh);

	{
    	deleteVehicle _x;
    } forEach units _grp;

    deleteGroup _grp;
};

// TODO: cache damaged vehicle to prevent unrealistic despawning / moveable vehicle could be driven away
deleteVehicle _veh;