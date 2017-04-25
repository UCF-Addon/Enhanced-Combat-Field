#include "script_component.h"

private ["_houses", "_chance", "_auto"];

_houses = _this select 0;
_chance = _this select 1;
_auto = !(typeName _chance == "SCALAR");

{
    if (_auto) then
    {
        _chance = (30 + floor random [0, 20, 40]);
    };

    private _h = _x;
    _doorSelections = _h call DFUNC(findSelections);

    {
        if ((floor random 100) < _chance) then
        {
            // object setVariable ["bis_disabled_door_2", 1];
            _h setVariable [format ["bis_disabled_%1", _x], 1, true];
        };
        nil
    } count _doorSelections;
    nil
} count _houses;