#include "script_component.h"

params[["_unit", objNull, [objNull]]];

if (isNil "_unit" || isNull _unit || !alive _unit) exitWith {};

_unit setSkill ["aimingAccuracy", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["aimingShake", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["aimingSpeed", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["endurance", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["spotDistance", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["spotTime", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["courage", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["reloadSpeed", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["commanding", _unit getVariable QGMVAR(skill_aimingAccuracy)];
_unit setSkill ["general", _unit getVariable QGMVAR(skill_aimingAccuracy)];