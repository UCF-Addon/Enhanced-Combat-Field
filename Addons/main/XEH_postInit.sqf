#include "script_component.h"

private ["_nul"];

// Initialize CityNames
if (ADDB(ECF_cn)) then
{
    [] call cn_fnc_postInit;
};