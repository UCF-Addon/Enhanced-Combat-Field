#include "script_component.h"
/**
*   Per Frame Handler
*       Bullets
*/

private _bullets = GMVAR(bullets);
GMVAR(bullets) = [];

{
    _projectile = _x select 0;
    _oldPos = _x select 1;
    _side = _x select 2;
    _origin = _x select 3;

    /* //~ Reason of above 200 Bullets for intersect at server ~\\
    _vs = velocity _projectile;
    _speed = sqrt ((_vs select 0)*(_vs select 0) + (_vs select 1)*(_vs select 1) + (_vs select 2)*(_vs select 2));
    _currentFrames = 50;

    _distance = (1 / _currentFrames) * _speed + 0.1;
    _vectorDistance = _vs vectorMultiply _distance;

    _intersect = lineIntersectsSurfaces [AGLToASL (getPos _projectile), AGLToASL ((getPos _projectile) vectorAdd _vectorDistance), objNull, objNull, true, 1, "GEOM", "FIRE"];

    //
    if ((count _intersect) > 0) then
    */
    if ((isNull _projectile) || ((_oldPos distance _projectile) < 5)) then
    //
    {
        if (isNull _projectile) then
        {
            GMVAR(bulletPos) pushBack [_oldPos, _side, _origin]; // Push Back Position
        } else
        {
            GMVAR(bulletPos) pushBack [_projectile, _side, _origin]; // Push Back Position
        };
    } else
    {
        GMVAR(bullets) pushBack [_projectile, (getPos _projectile), _side, _origin];
    };
} forEach _bullets;

true