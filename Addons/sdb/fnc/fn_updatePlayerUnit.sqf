#include "script_component.h"

params[["_player", objNull]];

if (isNull _player) exitWith {};

_nul = _player spawn
{
    _this setVariable ["loading", true, true];

    _this call DFUNC(prepareUnit);
    private _classid = _this getVariable ["_classid", -1];
    if (_classid > 0) then
    {
		[_this, _classid] call DFUNC(loadPlayerData);
    };
    _this call DFUNC(finishUnit);

    _this setVariable ["loading", false, true];
};

/**
    *
    *   Call back Inventory Sets of player which chose the role
    *   Cache Inventory to quickload
    *   Add Callback for Respawn to restore the Inventory ( Respawn Items == Death Items )
    *
    */