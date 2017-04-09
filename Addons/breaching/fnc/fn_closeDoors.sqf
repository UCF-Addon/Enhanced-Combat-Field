#include "script_component.h"

private ["_houses", "_door", "_h"];

_door =
[
    "door",
    "door1",
    "door01_a",
    "door02_a",
    "door_1",
    "door_2",
    "door_1a",
    "door_1_1",
    "door_1_2",
    "door_2_1",
    "door_2_2"
];

_houses = _this;

{
    _h = _x;

    for "_i" from 1 to 8 do
    {
        _h animate [format ["door_%1_rot", _i], 0];
    };

    for "_i" from 1 to 14 do
    {
        _h animate [format ["dvere%1", _i], 0];
    };

    for "_i" from 1 to 6 do
    {
        _h animate [format ["door_0%1", _i], 0];
    };

    {
        _h animate [format ["%1", _x], 0];
    } forEach _door;

} forEach _houses;