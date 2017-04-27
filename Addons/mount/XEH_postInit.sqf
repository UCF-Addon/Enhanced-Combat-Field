#include "script_component.h"

/*
 * Mount-Scope-Event
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: class <STRING>
 * 2: mount <BOOL>
 *
 * Mode: Local
**/
[QGMEV(mountScope), DFUNC(mountScopeLocal)] call CBA_fnc_addEventHandler;

/*
 * Mount-Side-Event
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: class <STRING>
 * 2: mount <BOOL>
 *
 * Mode: Local
**/
[QGMEV(mountSide), DFUNC(mountSideLocal)] call CBA_fnc_addEventHandler;