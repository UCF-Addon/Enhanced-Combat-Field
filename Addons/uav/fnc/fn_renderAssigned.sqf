#include "script_component.h"
/*
 * Author: Lt. Julius
 * Render the assigned targets to screen
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
 */

 params [];

 if (!alive player) exitWith {};
 if ((goggles player) != "G_Tactical_Clear") exitWith {};
 if (count GMVAR(assignedTargets) < 1) exitWith {};

_unaccessible = [];

 {
	_x params ["_target", "_origin"];

	if (isNull _target || !alive _origin) then
	{
		_unaccessible pushBackUnique _x;
	} else
	{
		_boundBox = boundingBoxReal _target;
        _estimationZ = abs (((_boundBox select 0) select 2) - ((_boundBox select 1) select 2));
        _target = (visiblePosition _target) vectorAdd [0, 0, (_estimationZ / 2)];

       	drawIcon3D
       	[
       		"a3\ui_f\data\IGUI\Cfg\Revive\overlayIcons\f75_ca.paa",
       		[1,0,0,1],
       		[
       			(_target select 0),
       			(_target select 1),
       			(_target select 2)
       		],
       		1,
       		1,
       		0
       	];
	};
 } forEach GMVAR(assignedTargets);

 if (count _unaccessible > 0) then
 {
	GMVAR(assignedTargets) = GMVAR(assignedTargets) - _unaccessible;
 };

