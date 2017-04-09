#include "script_component.h"

private ["_position", "_radius", "_locationTypes", "_locations", "_locationName", "_location"];

_position = _this select 0;
_radius = [_this, 1, 500] call BIS_fnc_param;

_locationTypes =
[
	"NameCityCapital",
	"NameCity",
	"NameVillage",
	"NameLocal",
	"Hill",
	"NameMarine"
];

_locations = nearestLocations [_position, _locationTypes, _radius];
_locationName = "";

if !((count _locations) isEqualTo 0) then
{
	_location = _locations select 0;
	_locationName = name _location;

	if (_locationName isEqualTo "") then
	{
		_locationName = text _location;
	};
};

_locationName