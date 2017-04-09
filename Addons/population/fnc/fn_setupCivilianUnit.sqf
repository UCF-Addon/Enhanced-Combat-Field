#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

_unit setSpeaker "NoVoice";
_unit setBehaviour "CARELESS";
_unit setSkill 0;
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";

_unit addEventHandler ["Hit", {_this call DFUNC(casualty)}];
_unit addEventHandler ["Killed", {_this call DFUNC(casualty)}];