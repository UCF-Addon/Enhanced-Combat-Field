#include "script_component.h"

if ((player getVariable QGVAR(var_isBreacher)) != _true) exitWith { false };
if (isNull cursorTarget) exitWith { false };

private _hasMag = false;
{
    if (_x == "ECF_EXPLOSIV_E_CHARGE_S") exitWith
    {
        _hasMag = true;
    };
} count magazines player;

if !(_hasMag) exitWith { false };

private _pos0 = positionCameraToWorld [0,0,0];
private _pos1 = positionCameraToWorld [0,0,2.5];

private _objects = [cursorTarget, "GEOM"] intersect [_pos0, _pos1];
private _door = "";
{
	_select = _x select 0;
    if ((_select find "door" >= 0) OR (_select find "dvere" >= 0)) exitWith
    {
    	_door = _select;
    };
} forEach _objects;

if (_door in (cursorTarget getVariable ["_charges", []])) then
{
	_door = "";
};

(_door != "")