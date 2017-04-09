#include "script_component.h"

private ["_pos", "_radius", "_houses", "_chance"];

_pos = _this select 0;
_radius = _this select 1;
_chance = _this select 2;

if (typeName _chance == "SCALAR") then
{
    while {_chance > 1} do
    {
        _chance = _chance / 100;
    };

    _houses = [];

    {
        if (((floor random 101) / 100) < _chance) then
        {
            _houses pushBack _x;
        };
    } forEach (_pos nearEntities ["House", _radius]);
} else
{
    _houses = (_pos nearEntities ["House", _radius]);
};

_houses