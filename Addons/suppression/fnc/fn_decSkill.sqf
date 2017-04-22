#include "script_component.h"

params[["_unit", objNull, [objNull]], ["_coef", 0, [0]]];

if (isNull _unit || !alive _unit) exitWith {};

// switch for Class
_unit setSkill ["aimingAccuracy", ((_unit getVariable QGMVAR(skill_aimingAccuracy)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_aimingAccuracy))))];
_unit setSkill ["aimingShake", ((_unit getVariable QGMVAR(skill_aimingShake)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_aimingShake))))];
_unit setSkill ["aimingSpeed", ((_unit getVariable QGMVAR(skill_aimingSpeed)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_aimingSpeed))))];
_unit setSkill ["endurance", ((_unit getVariable QGMVAR(skill_endurance)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_endurance))))];
_unit setSkill ["spotDistance", ((_unit getVariable QGMVAR(skill_spotDistance)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_spotDistance))))];
_unit setSkill ["spotTime", ((_unit getVariable QGMVAR(skill_spotTime)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_spotTime))))];
_unit setSkill ["courage", ((_unit getVariable QGMVAR(skill_courage)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_courage))))];
_unit setSkill ["reloadSpeed", ((_unit getVariable QGMVAR(skill_reloadSpeed)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_reloadSpeed))))];
_unit setSkill ["commanding", ((_unit getVariable QGMVAR(skill_commanding)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_commanding))))];
_unit setSkill ["general", ((_unit getVariable QGMVAR(skill_general)) - ((2.56949 min (ln (_coef + 1))) / 2.56949) * (0.85 * (_unit getVariable QGMVAR(skill_general))))];