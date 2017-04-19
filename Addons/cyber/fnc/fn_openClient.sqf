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

if (_stage == -1) then
{
	_arr = missionNamespace getVariable [QGMVAR(clients), []];
	_arr pushBack _obj;
	missionNamespace setVariable [QGMVAR(clients), _arr, true];
};

if (_stage == -2) then
{
	_arr = missionNamespace getVariable [QGMVAR(clients), []];
	_arr = _arr - [_obj];
	missionNamespace setVariable [QGMVAR(clients), _arr, true];

	_obj setVariable [QGMVAR(stage), 0];
};

if (_obj isKindOf "Land_DataTerminal_01_F") then
{
	_stage = _obj getVariable [QGMVAR(stage), 0];

	switch (_stage) do
	{
		case 0:
		{
			if (_obj getVariable [QGMVAR(isActiv), false]) then
			{
				_stage = 1;
			} else
			{
				hint "Waiting for power plug";
			};
		};
		case 1:
		{
			if (_obj getVariable [QGMVAR(isConnected), false]) then
			{
				_stage = 2;
			} else
			{
				hint "Wait for physical connection";
			};
		};
		case 2:
		{
			if (_obj getVariable [QGMVAR(isStarted), false]) then
			{
				_stage = 3;
			} else
			{
				hint "Wait until datacenter is fully started";
			};
		};
		case 3:
		{
			if (_obj getVariable [QGMVAR(hasDataTunnel), false]) then
			{
				_stage = 4;
				[_obj, "blue", "blue", "blue"] call BIS_fnc_DataTerminalColor;
			} else
			{
				hint "Could not fetch a data tunnel over wireless network";
			};
		};
		case 4:
		{
			// TODO: Remove from pFH
			// TODO: handle data transfer ( HQ <---> MHQ )
			hint "Allready started";
		};
	};

	if (!(_obj getVariable [QGMVAR(hasDataTunnel), false])) then
	{
		_stage = 3;
	};
	if (!(_obj getVariable [QGMVAR(isStarted), false])) then
	{
		_stage = 2;
	};
	if (!(_obj getVariable [QGMVAR(isConnected), false])) then
	{
		_stage = 1;
	};
	if (!(_obj getVariable [QGMVAR(isActiv), false])) then
	{
		_stage = 0;
	};

	if ((_obj getVariable [QGMVAR(stage), 0]) != _stage) then
	{
		[_obj, _stage] call DFUNC(openClientDataTerminal);
		_obj setVariable [QGMVAR(stage), _stage, true];
	};
};