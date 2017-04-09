#include "script_component.h"

private ["_door", "_house", "_state", "_stance", "_hasMag"];

_hasMag = false;
{
    if (_x == "ECF_EXPLOSIV_E_CHARGE_S") exitWith
    {
        _hasMag = true;
    };
} count magazines player;

if !(_hasMag) exitWith {};

[] spawn
{
    _ccp = [2.5, false] call DFUNC(calcChargePos);
    _pos = _ccp select 0;
    _dir = _ccp select 1;
    _house = _ccp select 2 select 0;
    _door = _ccp select 2 select 1;

    _state = animationState player;

    player playMove "Acts_carFixingWheel";
    /*
    sleep 1.5;
    [player, "Acts_carFixingWheel"] remoteExecCall ["switchMove"];
    */
    sleep 10;
    [player,_state] remoteExecCall ["switchMove", 0];

    _charges = _house getVariable ["_charges", []];
    if (_door in _charges) exitWith { hint "Allready charged"; };
    _charges pushBack _door;
    _house setVariable ["_charges", _charges, true];

    player removeMagazineGlobal "ECF_EXPLOSIV_E_CHARGE_S";
    _charge = "ECF_EXPLOSIV_E_AMMO_S_Scripted" createVehicle _pos;

    // Quickfix
    _charge setVectorDirAndUp [_dir, [0,1,0]]; // only local for test
    if (lineIntersects [(getPosASL _charge), (eyePos player), _charge, player]) then
    {
		[_charge, [_dir, [0,-1,0]]] remoteExec ["setVectorDirAndUp"];
    } else
    {
    	[_charge, [_dir, [0,1,0]]] remoteExec ["setVectorDirAndUp"];
    };

    [{
    	[(_this select 1)] call DFUNC(effectUnits);
        [(_this select 0), -1, [(_this select 1), 0]] call DMFUNC(ACE_Explosives,detonateExplosive);
        [(_this select 2), (_this select 3)] call DFUNC(openDoor);
    }, [player, _charge, _door, _house], 5] call CBA_fnc_waitAndExecute;
};