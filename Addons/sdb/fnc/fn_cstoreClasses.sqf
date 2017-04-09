#include "script_component.h"

params ["_uid", "_classes"];

private ["_index"];

_index = 0;
{

    if ((_x select 0) == _uid) exitWith {};
    _index = _index + 1;
} forEach GMVAR(cache);

//((GMVAR(cache) select _index) select 1) = [];

_classId = 0;
{
    if (_x == 1) then
    {
        ((GMVAR(cache) select _index) select 1) pushBack _classId;
    };
    _classId = _classId + 1;
} forEach _classes;