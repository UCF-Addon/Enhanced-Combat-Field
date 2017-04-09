#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: house <OBJECT>
 * 1: itemData <ARRAY>
 *
 * Return Value:
 * 0: object <OBJECT>
 *
 * Public: No
 */

params [["_house", objNull], ["_data", []]];

if ((count _data) < 3 || (count _data) > 4) exitWith { objNull };

_data params ["_type", "_relPos", "_relAngle", ["_relDir", -361, [0]]];

private _pos = _house modelToWorld _relPos;
private _obj = objNull;

if ((getNumber (configFile >> "CfgVehicles" >> _type >> "ace_sitting_canSit")) == _true) then
{
	_obj = _type createVehicle [0,0,0];
} else
{
	_obj = createSimpleObject [_type, [0,0,0]];
};

_obj setPosATL _pos;

if (_relDir < -360) then
{
	_angleX = ((vectorDir _house) select 0) - (_relAngle select 0);
    _angleY = ((vectorDir _house) select 1) - (_relAngle select 1);
    _angleZ = ((vectorUp _house) select 2) - (_relAngle select 2);

    _obj setVectorDirAndUp [[_angleX, _angleY, 0], [0, 0, _angleZ]];
} else
{
	_obj setDir ((getDir _house) - _relDir);
};

// TODO: eventually rewrite with macro for better performance
if (isMultiplayer) then
{
	_obj enableSimulationGlobal false;
} else
{
	_obj enableSimulation false;
};

_obj