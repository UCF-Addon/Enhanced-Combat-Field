#include "script_component.h"

private ["_marker", "_pos", "_radius", "_chance", "_houses"];

{
    _marker = (toArray _x) select 0;

    if ((_marker splitString "_") select 0 == "breaching") then
    {
        _pos = getMarkerPos _marker;
        _radius = getMarkerSize _marker;
        _radius = (_radius select 0) max (_radius select 1);
        _chance = parseNumber (_marker splitString "_") select 1;

        _houses = [_pos, _radius, _chance] call DFUNC(calcHouses);
        _houses call DFUNC(closeDoors);

        [_houses, objNull] call DFUNC(lockDoors);
    };
} forEach allMapMarkers;