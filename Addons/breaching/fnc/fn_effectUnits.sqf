#include "script_component.h"

params [["_charge", objNull, [objNull]]];

if (isNull _charge) exitWith {};

{
    if (isPlayer _x) then
    {
    	if (local _x) then
    	{
    		[4] call DMFUNC(ace_hearing,earRinging);
    		[_x, 0.08] call DMFUNC(ace_medical,adjustPainLevel);
    	} else
    	{
    		[[], {[4] call DMFUNC(ace_hearing,earRinging); [player, 0.08] call DMFUNC(ace_medical,adjustPainLevel);}] remoteExec ["call", _x, false];
    	}
        // if in direction
        // [] call DMFUNC(effect,effectBlind)

    } else
    {
        // if in direction
        _x spawn
        {
            _this disableAI "AUTOTARGET";
            [_this, "acts_CrouchingCoveringRifle01"] remoteExec ["switchMove", 0];

            _alive = true;
            _t = 0;

            while {_alive} do
            {
                sleep 0.1;
                _t = _t + 0.1;

                if ((_t > 15) OR !(alive _this)) then
                {
                    _alive = false;
                };
            };

            [_this, ""] remoteExec ["switchMove", 0];
            _this enableAI "AUTOTARGET";
        };
    };
} forEach ((getPos _charge) nearEntities ["Man", 7]);