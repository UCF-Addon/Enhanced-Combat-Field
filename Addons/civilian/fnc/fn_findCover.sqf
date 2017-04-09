  #include "script_component.h"
/*
 * Author: Julius
 * calculcate the cover position
 *
 * Arguments:
 * 0: pos <POS3D>
 *
 * Return Value:
 * 0: pos3D of cover <POS3D>
 *
 * Public: No
 */

 params [["_pos", [0,0,0], [[]], 3]];
 private ["_cover", "_bInPos", "_bPos", "_bBox", "_mX", "_mY", "_c1", "_c2", "_c3", "_c4", "_extPos"];

_cover = nearestObjects [_pos, ["House_F"], 100];

_cover = selectRandom _cover;
_bInPos = _cover buildingPos -1;

if (count (_bInPos) > 0) then
{
	_cover = selectRandom _bInPos;
} else
{
	_bPos = getPos _cover;
	_bBox = boundingBoxReal _cover;

	_mX = abs ((_bBox select 1 select 0) - (_bBox select 0 select 0));
	_mY = abs ((_bBox select 1 select 1) - (_bBox select 0 select 1));

	_c1 = _bPos;
	_c2 = _bPos vectorAdd [_mX, 0, 0];
	_c3 = _bPos vectorAdd [0, _mY, 0];
	_c4 = _bPos vectorAdd [_mX, _mY, 0];

	_extPos = _pos;
	{
		if ((_pos distance _extPos) < (_pos distance _x)) then
		{
			_extPos = _x;
		};
	} forEach [_c1,_c2,_c3,_c4];

	_cover = _extPos;
};

_cover