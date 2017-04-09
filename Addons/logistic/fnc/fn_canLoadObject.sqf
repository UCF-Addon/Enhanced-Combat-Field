#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 * 1: object <OBJECT>
 *
 * Return Value:
 * 0: could load object <BOOL>
 *
 * Public: No
 */

params [["_vehicle", objNull, [objNull]], ["_obj", objNull, [objNull]]];

if (isNull _vehicle || isNull _obj) exitWith { false };
if !(_obj isKindOf "ReammoBox_F") exitWith { false };

if (_obj in (attachedObjects _vehicle)) exitWith { false };

_typeOf = typeOf _vehicle;

_area = getArray (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_area");
_size = getArray (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_size");
_maxLoad = getNumber (configFile >> "CfgVehicles" >> _typeOf >> "ECF_logistic_Container" >> "logistic_maxLoad");

_loaded = [];
_loadWeight = 0;

{
	if (_x isKindOf "ReammoBox_F") then
	{
		_loaded pushBack _x;
		// TODO: add weight of items
		_loadWeight = _loadWeight + (getMass _x);
	};
} forEach (attachedObjects _vehicle);

if ((_loadWeight + (getMass _obj)) >= _maxLoad) exitWith { false };

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

_bb = boundingBoxReal _obj;
_p1 = _bb select 0;
_p2 = _bb select 1;

_b = (abs ((_p2 select 0) - (_p1 select 0)));
_l = (abs ((_p2 select 1) - (_p1 select 1)));
_h = (abs ((_p2 select 2) - (_p1 select 2)));

if (_h > (_size select 2)) exitWith { false };

_length = 0;
if (_b > (_size select 0) * 2) then
{
	if (_l > (_size select 0) * 2) exitWith { false };
	if (_b > (_size select 1) * 2) exitWith { false };
	_length = _l;
} else
{
	if (_l > (_size select 1) * 2) exitWith { false };
	_length = _b;
};

if ((_currentLength + _length) >= ((_size select 1) * 2)) exitWith { false };
true