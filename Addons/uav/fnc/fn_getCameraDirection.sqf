#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: drone <OBJECT>
 *
 * Return Value:
 * 0: vectorDirAndUp <ARRAY>
 *
 * Public: No
 */

params [["_drone", objNull]];

if (isNull _drone) exitWith {};

_startPos = _drone selectionPosition "PiP0_pos";
_endPos = _drone selectionPosition "PiP0_dir";

_sideDir = _startPos vectorFromTo _endPos;
_upDir =_sideDir vectorCrossProduct [- (_sideDir select 1), _sideDir select 0, 0];

[_sideDir, _upDir]