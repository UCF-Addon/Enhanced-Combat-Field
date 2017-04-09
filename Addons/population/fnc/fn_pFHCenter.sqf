#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
// TODO: better center algorithm to calculate ambient scripts
params [];

if (!isMultiplayer) then
{
	GMVAR(center) = [(getPos player)];
} else
{
	private _newCenter = [];
    private _playableUnits = (allUnits - entities "HeadlessClient_F") select { (isPlayer _x && alive _x) };

    {
    	_unit = _x;
    	_count = {((_x distance2D _unit) < 30)} count _newCenter;

    	if (_count < 1) then
    	{
			_newCenter pushBack (getPos _unit);
    	};
    } forEach _playableUnits;

    GMVAR(center) = _newCenter;
};