#include "script_component.h"

params ["_uid"];

if (isNil QGMVAR(cache)) then
{
    GMVAR(cache) = [];
};

if (_uid call DFUNC(isCached)) exitWith {};

private _entry = [_uid, []];
GMVAR(cache) pushBack _entry;