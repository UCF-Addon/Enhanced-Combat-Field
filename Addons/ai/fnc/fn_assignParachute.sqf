#include "script_component.h"

params [["_unit", objNull, [objNull]], ["_steerable", true, [true]]];

private _crea = ((backpack _x) in ["B_Parachute"]);

[_unit] allowGetIn true;
_unit enableAI "MOVE";

if (_crea) exitWith
{
    if (isPlayer _unit) then
    {
        _unit action ["openParachute", _unit];
    };
};

_parachute = "Steerable_Parachute_F";
if (!_steerable) then
{
    _parachute = "NonSteerable_Parachute_F";
};

_pos = (getPosASLVisual _unit) vectorAdd [0,0,3];

_parachute = createVehicle [_parachute, (AGLToASL _pos), [], 0, "FLY"];
_parachute setPosASL _pos;
_parachute setVectorDirAndUp [vectorDirVisual _unit, vectorUpVisual _unit];

_unit assignAsDriver _parachute;
_unit moveInDriver _parachute;