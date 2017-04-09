#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: projectile <OBJECT>
 * 1: lifespan <SCALAR>
 * 2: outflow <SCALAR>
 * 3: color <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_projectile", objNull], ["_lifespan", -1], ["_outflow", 1], ["_color", []]];

if (isNull _projectile || _lifespan < 0 || (count _color) != 3) exitWith {};