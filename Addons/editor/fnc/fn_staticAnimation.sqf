#include "script_component.h"

params [["_unit", objNull, [objNull]], ["_anim", nil, [nil, ""]]];

if (is3DEN) exitWith {};
if (isNil "_anim" || _anim == "" || _anim == "true") exitWith {};

if ((isMultiplayer || is3DENMultiplayer) && local _unit) then
{
	[[_unit, _anim], BIS_fnc_ambientAnim] remoteExec ["call"];
} else
{
	[_unit, _anim] call BIS_fnc_ambientAnim;
};