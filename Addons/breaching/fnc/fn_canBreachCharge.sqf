#include "script_component.h"

private ["_hasMag", "_pos0", "_pos1", "_bool", "_objects"];

if ((player getVariable QGVAR(var_isBreacher)) != _true) exitWith { false };

if (isNull cursorTarget) exitWith { false };

_hasMag = false;
{
    if (_x == "ECF_EXPLOSIV_E_CHARGE_S") exitWith
    {
        _hasMag = true;
    };
} count magazines player;

if !(_hasMag) exitWith { false };

_pos0 = positionCameraToWorld [0,0,0];
_pos1 = positionCameraToWorld [0,0,2.5];

_bool = false;
_objects = [cursorTarget, "GEOM"] intersect [_pos0, _pos1];
{
	_select = _x select 0;
    if ((_select find "door" >= 0) OR (_select find "dvere" >= 0)) exitWith
    {
        _bool = true;
    };
} forEach _objects;
_bool