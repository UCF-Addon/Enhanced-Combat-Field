#include "script_component.h"

params [["_logic", objNull, [objNull]], ["_units", [], [[]]], ["_activated", true, [true]]];
private ["_owner", "_taskOwner", "_ID", "_PID", "_taskName", "_taskTitle", "_taskDesc", "_taskMarker", "_taskDestination", "_taskState", "_taskShowNotification", "_taskType", "_taskVisibility"];

if (isNull _logic) exitWith {};
if (!_activated) exitWith {};

_owner = _logic getVariable ["Owner", 0];

// Task Owner and distribution
_taskOwner = [];
switch _owner do
{
    case 0: {
		_taskOwner = _units;
	};
	case 1: {
		{
			_xGroup = group _x;
			if !(_xGroup in _taskOwner) then {_taskOwner set [count _taskOwner,_xGroup];};
		} foreach _units;
	};
	case 2: {
		{
			_xSide = side _x;
			if !(_xSide in _taskOwner) then {_taskOwner set [count _taskOwner,_xSide];};
		} foreach _units;
	};
	case 3: {
		_taskOwner = true
	};
	case 4: {_taskOwner = west;};
	case 5: {_taskOwner = east;};
	case 6: {_taskOwner = resistance;};
	case 7: {_taskOwner = civilian;};
};

// Name or Parent
_ID = _logic getVariable ["ID", "taskDefault"];
_PID = _logic getVariable ["PID", ""];

_taskName = [];
if (_PID != "") then
{
    _taskName = [_ID, _PID];
} else
{
    _taskName = _ID;
};

// Title
_taskTitle = _logic getVariable ["Title", ""];

// Description
_taskDesc = _logic getVariable ["Description", ""];

// Marker
_taskMarker = "";

// Destination
_taskDestination = _logic getVariable ["Destination", 0];

// State
_taskState = _logic getVariable ["State", "CREATED"];

// Notification
_taskShowNotification = (_logic getVariable ["Notification", 1]) == 1;

// Task Type
_taskType = _logic getVariable ["Type", "Default"];

// Visibility
_taskVisibility = (_logic getVariable ["AlwaysVisible", 0]) == 1;

[
    _taskOwner,
    _taskName,
    [_taskDesc, _taskTitle, _taskMarker],
    if (_taskDestination > 0) then {getPosATL _logic} else { nil },
    _taskState,
    /*_taskPriority*/nil,
    _taskShowNotification,
    _taskType,
    _taskVisibility
] call BIS_fnc_taskCreate;