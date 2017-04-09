/*
 * Author: Lt. Julius
 * Add an command as entry for ai system
 *
 * Arguments:
 * 0: Side the command is assigned to
 * 1: Type of the command
 * 2: Position of the command
 * 3: Parameter parsed to command execution
 * 4: Time the command will exist
 * 5: CommandID of the next command in chain
 *
 * Return Value:
 * 0: SCALAR - Command ID in Array
 *
 * Example:
 * [side _unit, "SUPPORT", _unit, [45, 300], -1, -1] call DFUNC(addCommand);
 *
 * Public: Yes
 */
#include "script_component.h"

params ["_side", ["_type", "UNKNOWN", [""]], ["_pos", objNull, [[], objNull]], ["_param", [], [[], ""]], ["_duration", -1, [0]], ["_next", -1, [0]]];

-1