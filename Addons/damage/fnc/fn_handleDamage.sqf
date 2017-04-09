#include "script_component.h"

params [["_obj", objNull, [objNull]], ["_selection", nil, ["", nil]], ["_velocity", objNull, [[], objNull]], ["_size", 1, [0]]];

private _speed = sqrt ((_velocity select 0)*(_velocity select 0) + (_velocity select 1)*(_velocity select 1) + (_velocity select 2)*(_velocity select 2));

if (_speed > 420 && ((random 1) * (_speed/466) > 0.8)) then
{
	private _exp = "HelicopterExploSmall" createVehicle getPos (_obj);
	_obj setDamage 1;
};