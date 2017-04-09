#include "script_component.h"
/*
 * Author: Julius
 * Function to attach Object to Vehicle
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 * 1: object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
 
 params [["_vehicle", objNull, [objNull]], ["_obj", objNull, [objNull]]];

 if (isNull _vehicle || isNull _obj) exitWith {};

_typeOf = typeOf _vehicle;
_area = getArray (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_area");
_size = getArray (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_size");

_loaded = [];
{
	if (_x isKindOf "ReammoBox_F") then
	{
		_loaded pushBack _x;
	};
} forEach (attachedObjects _vehicle);

_currentLength = 0;
{
	_bb = boundingBoxReal _x;
	_p1 = _bb select 0;
	_p2 = _bb select 1;

	_vectorDir = (vectorDir _vehicle) vectorAdd [-((vectorDir _x) select 0), -((vectorDir _x) select 1), -((vectorDir _x) select 2)];

	if (str _vectorDir != "[1,0,0]") then
	{
		_currentLength = _currentLength + (abs ((_p2 select 0) - (_p1 select 0)));
	} else
	{
		_currentLength = _currentLength + (abs ((_p2 select 1) - (_p1 select 1)));
	};
} forEach _loaded;

_offset = [(_area select 0), ((_area select 1) + (_size select 1) - _currentLength), (_area select 2)];
_dir = [0,0,0];

_bb = boundingBoxReal _obj;
_p1 = _bb select 0;
_p2 = _bb select 1;

_b = (abs ((_p2 select 0) - (_p1 select 0)));
_l = (abs ((_p2 select 1) - (_p1 select 1)));
_h = (abs ((_p2 select 2) - (_p1 select 2)));

if (_b > (_size select 0) * 2) then
{
	_dir = [0,0,0];
	_offset vectorAdd [0,(_l / 2),0];
} else
{
	_dir = [1,0,0];
	_offset vectorAdd [0,(_b / 2),0];
};

// ATTENTION !! TODO: replace local function to global effect
_obj attachTo [_vehicle, _offset];
_obj setVectorDirAndUp [_dir, [0,0,1]];