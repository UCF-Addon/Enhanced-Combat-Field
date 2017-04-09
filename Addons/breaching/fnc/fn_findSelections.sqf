#include "script_component.h"

private ["_parent", "_selections"];

_parent = _this;

_selections = selectionNames _parent;

_fnc_find =
{
    _hay = _this select 0;
    _needle = _this select 1;
    _bool = false;

    {
        if (_x find _needle >= 0) exitWith { _bool = true };
    } forEach _hay;
    _bool
};

if ([_selections, "dvere"] call _fnc_find) exitWith
{
    private _array = [];
    {
        if ((_x find "dvere" >= 0) && !((_x find "trigger" > -1) OR (_x find "handle" > -1))) then
        {
            _array pushBack _x;
        };
    } forEach _selections;
    if (true) exitWith { _array };
};

if !([_selections, "dvere"] call _fnc_find) exitWith { [] };

private _array = [];
{
    if ((_x find "door" >= 0) && !((_x find "trigger" > -1) OR (_x find "handle" > -1))) then
    {
        _array pushBack _x;
    };
} forEach _selections;
_array