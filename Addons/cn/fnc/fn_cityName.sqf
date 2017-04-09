#include "script_component.h"

[] spawn
{
    _lastLocation = "";
    _locationName = "";
    while {true} do
    {
        if(alive player) then
        {
            _locationName = [(getPos player)] call DFUNC(getNearestLocationName);

            if !(_locationName isEqualTo _lastLocation) then
            {
                [false, _locationName] call DFUNC(showCityName);
                _lastLocation = _locationName;
            };
        };

        sleep 15;
    };
};