#include "script_component.h"

private ["_charge", "_pos"];

hint format ["Array: %1", _this];
if (true) exitWith { "Debug - Functions deleted because of new system" call BIS_fnc_log; };

_charge = _this select 0;
_pos = getPos _charge;

if (GVAR(local)) then
{
    _vehicle = (_pos) call DFUNC(calcTargetParent);
    _target = _vehicle getVariable ["charges", []];

    if(count _target < 1) exitWith {};

    _c = _target select 0;
    {
        if ((_x select 0) distance _pos < 0.1) then
        {
            if ((_x select 0) distance _pos < (_c select 0) distance _pos ) then
            {
                _c = _x;
            };
        };
    } forEach _target;

    _target = _target - _c;
    _vehicle setVariable ["charges", _target, true];

    _vehicle animate [format ["door_%1_rot", (_c select 1)], 1];

    {
        if(!isPlayer _x) then
        {
            // AI in Angle of 120° (Left: -60°, Right +60°)
            //if((_charge getRelDir (getPos _x) < 240) && (_charge getRelDir (getPos _x) > 120)) then
            //{
                // Stun AI
                _nul = _x spawn
                {
                    _this disableAI "AUTOTARGET";
                    _this switchMove "acts_CrouchingCoveringRifle01";

                    _alive = true;
                    _t = 0;

                    while {_alive} do
                    {
                        sleep 0.1;
                        _t = _t + 0.1;

                        if ((_t > 7) OR !(alive _this)) then
                        {
                            _alive = false;
                        };
                    };

                    _this switchMove "";
                    _this enableAI "AUTOTARGET";
                };
            //};
        };
    } forEach (_pos nearEntities ["Man", 5]);
};

if (!hasInterface) exitWith {};

if((player distance _charge) > 5) exitWith {};

//_eyepos = eyePos player;
//_eyedir = eyeDirection player;
//_reldir = player getRelDir _charge;

//_eyedir = acos (_eyedir select 2);
//if((_eyedir < _reldir + 22.5) && (_eyedir > _reldir - 22.5)) then
//{
//    if(((_pos select 2) + 1.2 < _eyepos select 2) && ((_pos select 2) - 1.2 > _eyepos select 2)) then
//    {
        [] call Effect_fnc_effectBlind;
//    };
//};

if (isClass (configFile >> "CfgPatches" >> "ACE_Hearing")) then
{
    [4] call ace_hearing_fnc_earRinging;
};

if (isClass (configFile >> "CfgPatches" >> "ACE_Medical")) then
{
    [player, 0.05] call ace_medical_fnc_adjustPainLevel;
};