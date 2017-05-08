#include "script_component.h"
/*
 * Author: Lt. Julius
 * Check whether caller is UAV-Gunner
 *
 * Arguments:
 * 0: caller <OBJECT>
 *
 * Return Value:
 * 0: whether is gunner <BOOL>
 *
 * Public: No
 */

params["_player"];

private _uavs = allUnitsUAV;
private _c = [];
private _isGunner = false;

if (count _uavs == 0) exitWith { false };

{
   _c = UAVControl _x;
   if ((_c select 0) == _player && (_c select 1) == "GUNNER") exitWith { _isGunner = true; };
} forEach _uavs;

_isGunner