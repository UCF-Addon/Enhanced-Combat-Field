#include "script_component.h"

params [["_group", grpNull, [grpNull]], ["_position", [0, 0, 0], [[]], 3]];

if (isNull _group) exitWith {};

_vehicle = vehicle leader _group;
_driver = driver _vehicle;

if !(_driver in _group) then
{
	_driver = effectiveCommander _vehicle;
};

_speedMode = speedMode _group;

_height = 0;
_height = ([100, 200, 500] select _height);

_distance = (((count crew _vehicle) - (count units group (driver _vehicle))) * 12) max 50;

// Approach

if (_vehicle distance2D _position > _distance) then
{
    _group setSpeedMode "NORMAL";
    _vehicle flyInHeight _height + 40;
    _driver move _position;

	// Goto next Waypoint if too near the drop of position to prevent stand or stopping in air
    if (_distance < 15) then
    {
        _nextPosition = 1 + currentWaypoint (group _driver);
        _nextPosition = waypointPosition [(group _driver), _nextPosition];
        _driver doMove _nextPosition;
    };

    waitUntil { _vehicle distance2D _position < _distance };
};

// Deployment
[_vehicle, _height, "_ai_way_drop", true] spawn DFUNC(dropInfantry);

waitUntil { _vehicle getVariable ["_ai_way_drop", false] };
_vehicle setVariable ["_ai_way_drop", nil, true];

_group setSpeedMode _speedMode;