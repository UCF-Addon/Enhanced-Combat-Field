#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: source <OBJECT>
 * 1: target <STRING>
 *
 * Return Value:
 * 0: connected <BOOL>
 *
 * Public: No
**/

params [["_source", objNull], ["_target", nil]];

if (isNull _source || isNil "_target") exitWith {};

private _cons = _source getVariable [QGMVAR(cableConnections), []];
if (count _cons < 1) exitWith { false };

private _isConnected = false;

{
	if (typeOf _x == _target) exitWith
	{
		_isConnected = true;
	};
	// TODO: scan for nodes and there clients whether there is a classtype in the network
} count _cons;

_isConnected