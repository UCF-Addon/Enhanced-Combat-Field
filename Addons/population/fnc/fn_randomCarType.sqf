#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: day / night modify <BOOL> [OPTIONAL]
 * 1: id <SCALAR> [OPTIONAL]
 *
 * Return Value:
 * 0: type <STRING>
 *
 * Public: No
 */

params [["_affect", false, [false]], ["_id", 0, [0]]];

if (_affect) then
{
	(selectRandom GMVAR(DOUBLE(car,types)))
} else
{
	(selectRandom GMVAR(DOUBLE(car,types)))
};