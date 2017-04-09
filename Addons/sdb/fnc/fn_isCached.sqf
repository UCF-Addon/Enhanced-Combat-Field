#include "script_component.h"

params ["_uid", ["_entry", objNull], ["_param", -1]];

private ["_index"];

if (isNil QGMVAR(cache)) then
{
    GMVAR(cache) = [];
};

_index = 0;
{

    if ((_x select 0) == _uid) exitWith {};
    _index = _index + 1;
} forEach GMVAR(cache);

if (isNull _entry) exitWith { (((GMVAR(cache) select _index) select 0) == _uid) };

switch (_entry) do
{
    case "class":
    {
        if ((count ((GMVAR(cache) select _index) select 1)) > 0) exitWith
        {
            if (_param > -1) then
            {
                if ((_param > -1) && !isNull (((GMVAR(cache) select _index) select 1) select _param)) then
                {
                    true
                } else
                {
                    false
                };
            } else
            {
                true
            };
        };
        if (true) exitWith { false };
    };
};