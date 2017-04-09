#include "script_component.h"

params [["_uid", "", [""]], ["_player", objNull, [objNull]]];
private ["_classes"];

// TODO: Debug
//if (_uid call DFUNC(isCached)) exitWith
//{
    // Player and Classes are cached
//};

// TODO: Debug
// _uid call DFUNC(createCache); // Create new Cache for Player

_classes = format ["loadClasses:%1", _uid] call DFUNC(dbSelectRow);

// TODO: Debug
//[_uid, _classes] call DFUNC(cstoreClasses);

// TODO: set array for unit classes
_array = [];
_amount = count _classes;

if ((_amount > 0) && (typeName (_classes select 0) == "SCALAR") && (_classes select 0) == 1) then { _array pushBack [1, "Schütze", nil]; };
if ((_amount > 1) && (typeName (_classes select 1) == "SCALAR") && (_classes select 1) == 1) then { _array pushBack [2, "Breacher", nil]; };
if ((_amount > 2) && (typeName (_classes select 2) == "SCALAR") && (_classes select 2) == 1) then { _array pushBack [3, "Grenadier", nil]; };
if ((_amount > 3) && (typeName (_classes select 3) == "SCALAR") && (_classes select 3) == 1) then { _array pushBack [4, "Marksman", nil]; };
if ((_amount > 4) && (typeName (_classes select 4) == "SCALAR") && (_classes select 4) == 1) then { _array pushBack [5, "Raketenspezialist", nil]; };
if ((_amount > 5) && (typeName (_classes select 5) == "SCALAR") && (_classes select 5) == 1) then { _array pushBack [6, "MG-Schütze", nil]; };
if ((_amount > 6) && (typeName (_classes select 6) == "SCALAR") && (_classes select 6) == 1) then { _array pushBack [7, "UAV-Operator", nil]; };
if ((_amount > 7) && (typeName (_classes select 7) == "SCALAR") && (_classes select 7) == 1) then { _array pushBack [8, "Sanitäter", nil]; };
if ((_amount > 8) && (typeName (_classes select 8) == "SCALAR") && (_classes select 8) == 1) then { _array pushBack [9, "Pilot", nil]; };

_player setVariable [QGVAR(roles), _array, true];