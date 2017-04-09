#include "script_component.h"

if (GMVAR(__enabled) != _true) exitWith {};

params[["_unit", objNull], "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if (isNull _unit) exitWith {};
if ((isNil "_projectile") || (isNull _projectile)) exitWith {};

GMVAR(bullets) pushBack [_projectile, (getPos _projectile), side _unit, getPos _unit];

// Get in Cover because of heard shot from muzzle
// TODO: Better Audible calculcation with extern method to muzzle, velocity speed and ammonition sound
{
    if (!isPlayer _x) then
    {
        GMVAR(bulletPos) pushBack [getPos _x, side _x, getPos _unit];
    };
} forEach (_unit nearEntities ["CAManBase", GMVAR(__hearingCover)]);