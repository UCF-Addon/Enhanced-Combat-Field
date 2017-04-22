#include "script_component.h"

//["ThingX", "init", DFUNC(addGeneratorActions), nil, nil, true] call CBA_fnc_addClassEventHandler;

/*
 * Power-Target-Event
 *
 * Arguments:
 * 0: obj <OBJECT>
 * 1: power <BOOL>
 *
 * Mode: Global
**/
[QGMEV(powerTarget), DFUNC(handlePowerTarget)] call CBA_fnc_addEventHandler;

/*
 * Power-Connect-Event
 *
 * Arguments:
 * 0: source <OBJECT>
 * 1: target <OBJECT>
 *
 * Mode: Global
**/
[QGMEV(powerConnect), DFUNC(handlePowerConnect)] call CBA_fnc_addEventHandler;

/*
 * Power-Disconnect-Event
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Mode: Global
**/
[QGMEV(powerDisconnect), DFUNC(handlePowerDisconnect)] call CBA_fnc_addEventHandler;

/*
 * Power-Supply-Event
 *
 * Arguments:
 * 0: obj <OBJECT>
 * 1: power <BOOL>
 *
 * Mode: Global
**/
[QGMEV(powerSupply), DFUNC(handlePowerSupply)] call CBA_fnc_addEventHandler;