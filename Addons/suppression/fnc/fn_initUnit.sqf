#include "script_component.h"

params[["_unit", objNull, [objNull]]];

systemChat format ["%1 Unit: %2", name _unit, local _unit];

if (isNull _unit) exitWith {};
if (!local _unit) exitWith {};

_unit setVariable [QGMVAR(skill_aimingAccuracy), (_unit skill "aimingAccuracy"), false];
_unit setVariable [QGMVAR(skill_aimingShake), (_unit skill "aimingShake"), false];
_unit setVariable [QGMVAR(skill_aimingSpeed), (_unit skill "aimingSpeed"), false];
_unit setVariable [QGMVAR(skill_endurance), (_unit skill "endurance"), false];
_unit setVariable [QGMVAR(skill_spotDistance), (_unit skill "spotDistance"), false];
_unit setVariable [QGMVAR(skill_spotTime), (_unit skill "spotTime"), false];
_unit setVariable [QGMVAR(skill_courage), (_unit skill "courage"), false];
_unit setVariable [QGMVAR(skill_reloadSpeed), (_unit skill "reloadSpeed"), false];
_unit setVariable [QGMVAR(skill_commanding), (_unit skill "commanding"), false];
_unit setVariable [QGMVAR(skill_general), (_unit skill "general"), false];

_unit setVariable [QGMVAR(stance), (stance _unit), false];
_unit setVariable [QGMVAR(speedMode), (speedMode _unit), false];

_unit setVariable [QGMVAR(cover), _false, false];

_unit setVariable [QGMVAR(setup), _true, true];