#include "script_component.h"

[] call DFUNC(prepareUpdate);

_nul = [] spawn
{
    private ["_time", "_res"];

    _time = 0;
    _res = [player] remoteExec [QMFUNC(sdb,updatePlayerUnit), 2, false];

    if (!isNil "_res") then
    {
        [] call DFUNC(loadingStart);

        while {_time < 30} do
        {
            if (!(player getVariable ["loading", true])) exitWith
            {
                // Player Role loaded

                [] call DFUNC(loadingFinish);
            };

            sleep 2;
            _time = _time + 2;
        };

        // Error while loading player role OR timeout of 30sec ( Could cause error because of overused db request !!!)
        // This includes the time to setup the inventory of a unit
        [] call DFUNC(loadingFinish);
        if (true) exitWith {};
    };

    // Error while asking server to load player role
};