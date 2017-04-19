#include "script_component.h"

GMVAR(pFH) = [DFUNC(pFH), 2, []] call CBA_fnc_addPerFrameHandler;

/*
 * Cable-Connect-Event
 *
 * Arguments:
 * 0: source <OBJECT>
 * 1: target <BOOL>
 *
 * Mode: Global
**/
[QGMEV(cableConnect), DFUNC(handleCableConnect)] call CBA_fnc_addEventHandler;

/*
 * Cable-Disconnect-Event
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Mode: Global
**/
[QGMEV(cableDisconnect), DFUNC(handleCableDisconnect)] call CBA_fnc_addEventHandler;

/*
 * Data-Connect-Event
 *
 * Arguments:
 * 0: source <OBJECT>
 * 1: target <BOOL>
 * 2: nodes <ARRAY>
 *
 * Mode: Global
**/
[QGMEV(dataConnect), DFUNC(handleDataConnect)] call CBA_fnc_addEventHandler;

/*
 * Data-Disconnect-Event
 *
 * Arguments:
 * 0: client <OBJECT>
 * 1: remote <BOOL>
 *
 * Mode: Global
**/
[QGMEV(dataDisconnect), DFUNC(handleDataDisconnect)] call CBA_fnc_addEventHandler;

/*
 * Start-System-Event
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Mode: Global
**/
[QGMEV(startSystem), DFUNC(handleStartSystem)] call CBA_fnc_addEventHandler;

/*
 * Shutdown-System-Event
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Mode: Global
**/
[QGMEV(shutdownSystem), DFUNC(handleShutdownSystem)] call CBA_fnc_addEventHandler;