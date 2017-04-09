#include "script_component.h"

private ["_nul", "_eh0"];

missionNamespace setVariable [QGVAR(useDBI), GVAR(useDBI), true];

if (GVAR(useDBI) == _true) then
{
	// TODO: add lifetime support for allready connected players
	[QGMVAR(joinEH), "onPlayerConnected", DFUNC(registerJoinEH)] call BIS_fnc_addStackedEventHandler;
};