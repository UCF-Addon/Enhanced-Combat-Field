#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 * 1: stage <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_obj", objNull], ["_stage", 0, [0]]];

if (isNull _obj) exitWith {};

switch ((floor _stage)) do
{
	case 0:
	{
		_obj animateSource ["Lock_source", 0];
		_obj animateSource ["Sesame_source", 0];
		_obj animateSource ["Antenna_source", 0];
	};
	case 1:
	{
		_obj animateSource ["Lock_source", 1];
        _obj animateSource ["Sesame_source", 1];
        _obj animateSource ["Antenna_source", 1];
	};
	case 2:
	{
		_obj animateSource ["Lock_source", 2];
        _obj animateSource ["Sesame_source", 2];
        _obj animateSource ["Antenna_source", 2];
	};
	case 3:
	{
		_obj animateSource ["Lock_source", 3];
        _obj animateSource ["Sesame_source", 2.9];
        _obj animateSource ["Antenna_source", 3];
	};
	case 4:
	{
		_obj animateSource ["Lock_source", 3];
        _obj animateSource ["Sesame_source", 3];
        _obj animateSource ["Antenna_source", 3];
	};
};