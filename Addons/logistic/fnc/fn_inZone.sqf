#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: object <OBJECT>
 * 1: vehicle <OBJECT>
 * 2: zone <STRING>
 *
 * Return Value:
 * 0: if is in zone <BOOL>
 *
 * Public: No
 */

params [["_obj", objNull, [objNull]], ["_vehicle", objNull, [objNull]], ["_zone", nil, [""]]];

if (isNull _obj || isNull _vehicle || isNil "_zone") exitWith { false };

_pos = getArray (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "ECF_logistic_Container" >> _zone >> "pos");

_size = getArray (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "ECF_logistic_Container" >> _zone >> "size");

_posMin = _pos vectorAdd [-(_size select 0), -(_size select 1), 0];
_posMax = _pos vectorAdd [(_size select 0), (_size select 1), (_size select 2)];

_posObj = _vehicle worldToModel (getPos _obj);

((((_posMin select 0) < (_posObj select 0)) && ((_posObj select 0) < _posMax select 0)) && (((_posMin select 1) < (_posObj select 1)) && ((_posObj select 1) < _posMax select 1)) && (((_posMin select 2) < (_posObj select 2)) && ((_posObj select 2) < _posMax select 2)))