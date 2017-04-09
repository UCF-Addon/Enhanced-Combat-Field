#include "script_component.h"

private ["_logic", "_activated", "_modules", "_module", "_taskId", "_taskNewState", "_taskShowNotification"];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_activated = [_this, 2, true, [true]] call BIS_fnc_param;

if (isNull _logic) exitWith {};
if (!_activated) exitWith {};

// Find synchronized modules
_modules = _logic call BIS_fnc_moduleModules;
_module = objNull;

{
    if (typeOf _x == "ECF_ModuleTaskCreate_F") exitWith
    {
        _module = _x;
    };
} forEach _modules;

// Check whether module is found
if (isNull _module) exitWith { false };

_taskId = _module getVariable ["ID", ""];

// Check whether Task-ID exists
if (_taskId == "") exitWith { false };

// Erwarte Task
_taskCurrentState = [_taskId] call BIS_fnc_taskState;
_taskNewState = _logic getVariable "State";
_taskShowNotification = (_logic getVariable ["Notification", 1]) == 1;

if (_taskCurrentState == "AUTOASSIGNED") then
{
    _taskCurrentState = "ASSIGNED";
};

[(format ["Task: %1", _taskCurrentState]), "hint", true, true] call BIS_fnc_MP;

if (_taskNewState == "ASSIGNED") then
{
    if ((_taskCurrentState == "CREATED") OR (_taskCurrentState == "ASSIGNED")) then
    {
        _taskId call BIS_fnc_taskSetCurrent;
    };
} else
{
    if (_taskNewState == _taskCurrentState) then
    {
        _taskShowNotification = false;
    };

    [_taskId, _taskNewState, _taskShowNotification] call BIS_fnc_taskSetState;
};