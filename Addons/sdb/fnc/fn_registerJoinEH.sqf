#include "script_component.h"

diag_log format ["%1 : %2 | %3", (typeName _uid), _uid, (isNil "_uid")];

if (isNil {uiNamespace getVariable "db_session_Id"}) exitWith {};
if (((_uid find "HC") >= 0) || (_uid == "")) exitWith {};
// add Eventhandler to fetch UID for DB
_nul = _uid spawn
{
	diag_log format ["Query Check: %1", _this];
    private _exists = _this call DFUNC(queryCheckExist);
    if (typeName _exists == "BOOL" && !_exists) exitWith
    {
    	diag_log format ["Player (%1) got kicked by SDB", _this];
    	"ECF-Game-Admin" serverCommand format ["#kick %1", _this];
    };

    private _player = objNull;

	_i = 0;
    while {isNull _player} do
    {
		if (_i > 1200) exitWith {};

        sleep 0.1;
        {
            if (getPlayerUID _x == _this) exitWith
            {
                _player = _x;
            };
        } forEach playableUnits - entities "HeadlessClient_F";
        _i = _i + 1;
    };

    diag_log format ["Query Player: %1 | %2 | %3", _player, getPlayerUID _player, _this];

	[_this, _player] try
	{
		_this call DFUNC(loadClassData);
	} catch
	{
		diag_log format ["Failed to load classdefinition for Player (%1).", getPlayerUID (_this select 1)];
		diag_log format ["%1", _exception];

		(_this select 1) setVariable ["ECF_var_isDBI", _false, true];
	};

    _player setVariable ["ECF_var_isDBI", _true, true];
};