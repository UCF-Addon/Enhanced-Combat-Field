#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: strenght <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_strenght", 0]];

if (_strength <= 0) exitWith {};

GMVAR(DOUBLE(dist,strength)) = GMVAR(DOUBLE(dist,strength)) + (0.08 / GMVAR(DOUBLE(dist,strength))) * _strength;

// Clamp between 0 ... 1
GMVAR(DOUBLE(dist,strength)) = GMVAR(DOUBLE(dist,strength)) min 1;
GMVAR(DOUBLE(dist,strength)) = GMVAR(DOUBLE(dist,strength)) max 0;