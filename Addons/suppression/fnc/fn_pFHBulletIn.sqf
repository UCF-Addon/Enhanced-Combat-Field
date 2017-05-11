#include "script_component.h"
/**
*   Per Frame Handler
*       Bullets
*/

private _caliber = getNumber (configFile >> "CfgAmmo" >> typeOf _ammo >> "caliber");
private _speed = velocity _bullet;
_speed = sqrt(((_speed select 0) * (_speed select 0)) + ((_speed select 1) * (_speed select 1)) + ((_speed select 2) * (_speed select 2)));

private _effStrength = _caliber * (_speed / 860) * (1 / (_dist / 5));
[(_effStrength / 100)] call DFUNC(applyDistortion);

[] call DFUNC(handleDistortion);