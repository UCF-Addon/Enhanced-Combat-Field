#include "script_component.h"

params [["_logic", objNull, [objNull]], ["_units", [], [[]]], ["_activated", true, [true]]];

if (typeof _logic != "ECF_ModuleRespawnVehicle_F") exitWith {};
if (count _units < 1) exitWith {};
if (!_activated) exitWith {};

if (isNil GVAR(DOUBLE(module,respawnVehicle))) then
{
	GVAR(DOUBLE(module,respawnVehicle)) = [];
};

//_vehicle = _vehicle;
/**/_side = WEST;/**/

// TODO: remove Logic Module from array or fetch error caused by wrong type of vehicle

_delay = _logic getVariable ["Delay", ""];
_position = _logic getVariable ["Position", 0];
_type = _logic getVariable ["Type", 0];
_wreck = _logic getVariable ["Wreck", 1];
_notification = (_logic getVariable ["Notification", 1]) == 1;

{
	_respawnVehicle = _x;

	// Check whether Object allready exists
	{
		if ((_x select 0) == _respawnVehicle) then
		{
			exitWith { _respawnVehicle = objNull; };
		}
	} forEach GVAR(DOUBLE(module,respawnVehicle));
	//

	if (!isNull _respawnVehicle) then
	{
		if ((typeName _delay == "NUMBER") && (_delay > 0)) then
		{
			_respawnDelay = _delay;
		} else
		{
			// TODO: add parameter of default mission delay for vehicle respawn
			_respawnDelay = missionNamespace getVariable ["VehicleRespawn", 900];
		};

		switch _position do
		{
			case 0:
			{
				_respawnPosition = (getPosASL _respawnVehicle);
			};
			case 1:
			{
				_respawnPosition = {getPosASL _this};
			};
			case 2:
			{
				// TODO: replace logic with synced marker or respawn logic
				_respawnPosition = (getPosASL _logic);
			};
		};

		_respawnType = _type;
		_respawnWreck = _wreck;
		_respawnNotification = _notification;

		_entry = [
			_respawnVehicle,
			_respawnDelay,
			_respawnPosition,
			_respawnType,
			_respawnWreck,
			_respawnNotification
		];

		GVAR(DOUBLE(module,respawnVehicle)) pushBack _entry;
	};

} forEach _units;