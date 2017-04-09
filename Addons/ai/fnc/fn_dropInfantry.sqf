#include "script_component.h"

params [["_vehicle", objNull, [objNull]], ["_height", 100, [0]], ["_var", "", [""]], ["_steerable", true, [true]]];
private ["_driver", "_last"];

if (isNull _vehicle) exitWith {};

_driver = driver _vehicle;

doParachute =
{
    params [["_unit", objNull, [objNull]], ["_height", 100, [0]], ["_steerable", true, [true]]];
    if (isNull _unit || (vehicle _unit) != _unit) exitWith {};

    waitUntil { (!alive _unit) || (((getPos _unit) select 2) < _height) };
    if (!alive _unit) exitWith {};

    [_unit, _steerable] call DFUNC(assignParachute);
};

_last = objNull;
_lastTime = time;

_groups = [];

{
    if (alive _x) then
    {
        if (!(_x in (units group _driver))) then
        {
        	_groups pushBackUnique (group _x);
        	_x leaveVehicle _vehicle;

        	_x disableAI "MOVE";
            _x disableCollisionWith _vehicle;

            moveOut _x;
            unassignVehicle _x;
            [_x] allowGetIn false;
            
            _x setDir (getDir _vehicle + 90);

            [_x, _height, _steerable] spawn doParachute;
            
			// Wait until distance of enought for next parachute or time interval is enought
            waitUntil
            {
                if ((!isNull _last && alive _last && ((_last distance _vehicle) > 20)) || ((_lastTime + 2) < time)) then
                {
                    true
                } else
                {
                    false
                };
            };

            _lastTime = time;
            _last = _x;
        };
    };
} forEach crew _vehicle;

// Prevent reenter vehicle of dropped groups
{
	_x leaveVehicle _vehicle;
} forEach _groups;