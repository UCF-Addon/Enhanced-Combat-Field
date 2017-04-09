#include "script_component.h"

private ["_distance", "_skip", "_pos", "_pos0", "_pos1", "_inter1", "_inter2", "_diff"];

_distance = _this select 0;
_skip = _this select 1;

_pos0 = positionCameraToWorld [0,0,0];
_pos1_0 = positionCameraToWorld [-0.05,0,_distance];
_pos1_1 = positionCameraToWorld [0.05,0,_distance];

_inter1 = lineIntersectsSurfaces [AGLToASL _pos0, AGLToASL (_pos1_0), player];
_inter2 = lineIntersectsSurfaces [AGLToASL _pos0, AGLToASL (_pos1_1), player];

if ((count _inter1 > 0) OR (count _inter2 > 0)) then
{
   if (_skip) exitWith
   {
        false
   };
   []
};

if (_skip) exitWith { true };

_diff = (_inter1 select 0 select 0) vectorFromTo (_inter2 select 0 select 0);
_pos =
[
    ((_inter1 select 0 select 0 select 0) + (_inter2 select 0 select 0 select 0)) / 2,
    ((_inter1 select 0 select 0 select 1) + (_inter2 select 0 select 0 select 1)) / 2,
    ((_pos1_0 select 2) + (_pos1_1 select 2) + 0.15) / 2
];

[_pos, _diff, ([2.5] call DMFUNC(ACE_Interaction,getDoor))]