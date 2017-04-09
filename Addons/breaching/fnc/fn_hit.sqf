#include "script_component.h"
/*
 * Author: Lt. Julius
 * Event handler of hit
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

 params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

 if (isNull _unit || isNull _source) exitWith {};

diag_log format ["Hit: %1, %2", _unit, _source];

/*
*[_unit, _player, _bullet, _posASL, _selection] call DFUNC(hitPart);
*
*/