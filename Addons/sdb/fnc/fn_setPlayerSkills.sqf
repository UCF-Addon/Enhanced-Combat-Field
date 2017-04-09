#include "script_component.h"

private ["_player", "_classid"];

_player = _this select 0;
_classid = _this select 1;

// Set default class attributes
_player setVariable [QGVAR(var_isBreacher), _false, true];
_player setVariable [QGVAR(var_isUAVOperator), _false, true];
_player setVariable ["ace_medical_medicClass", 0, true];
_player setVariable ["ace_isEOD", false, true];
_player setVariable ["ace_isEngineer", 0, true];

// Set special class attributes
switch(_classid) do
{
    case 2: // Breacher
    {
    	_player setVariable ["ace_isEOD", true, true];
    	_player setVariable ["ace_isEngineer", 2, true];
        _player setVariable [QGVAR(var_isBreacher), _true, true];
    };
    case 7: // UAV Operator
    {
    	_player setVariable [QGVAR(var_isUAVOperator), _true, true];
    };
    case 8: // Sanitäter
    {
        _player setVariable ["ace_medical_medicClass", 2, true];
    };
};