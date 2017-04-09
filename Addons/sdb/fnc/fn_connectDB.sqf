#include "script_component.h"

private ["_isConnected", "_error_locked", "_result", "_DBSessionId"];

_isConnected = false;
_error_locked = false;

_DBSessionId = "";

"Starting extDB3" call BIS_fnc_log;

try
{
    // Get Version of extDB3
    "Get version of extDB3" call BIS_fnc_log;
    _result = "extDB3" callExtension "9:VERSION";

    if (_result isEqualTo "") then
    {
        throw "Unable to locate extDB3 extension!";
    };

    if (parseNumber _result < 1) then
    {
        throw "Update extDB3 to version 0 or later";
    };


    // Check whether extDB3 is allready locked or in progress
    "Check for lock state extDB3" call BIS_fnc_log;
    _result = call compile ("extDB3" callExtension "9:LOCK_STATUS") select 0;

    if (_result isEqualTo 1) then
    {
        _error_locked = true;
        throw "Error extDB3 is already setup & locked!";
    };

    // Connect to database
    "Connect to db extDB3" call BIS_fnc_log;
    _result = call compile ("extDB3" callExtension "9:ADD_DATABASE:ecf");

    if (_result select 0 isEqualTo 0) then
    {
        throw format ["Could not add database: %1", _result];
    };

    // Generate randomized Protocol Name
    // load Protocol with extDB3
    _DBSessionId = str(round(random(999999)));
    "Set SessionID and Protocol for extDB3" call BIS_fnc_log;
    _result = call compile ("extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:ecf:SQL_CUSTOM:%1:ecf.ini", _DBSessionId]);

    if ((_result select 0) isEqualTo 0) then
    {
        throw format ["Failed to initialize database protocol: %1", _result];
    };

    // lock extDB3
    "Lock down Connection extDB3" call BIS_fnc_log;
    "extDB3" callExtension "9:LOCK";
    _isConnected = true;

    // store randomized ID
    uiNamespace setVariable ["db_session_Id", _DBSessionId];
} catch
{
    if (!_error_locked) then
    {
        uiNamespace setVariable ["db_session_Id", objNull];
        //"extDB3" callExtension "9:SHUTDOWN";
    } else
    {
        uiNamespace setVariable ["db_session_Id", objNull];
    }
};

_isConnected