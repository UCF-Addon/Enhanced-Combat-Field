#include "script_component.h"

private ["_uid", "_exists"];

_uid = _this;
if(isNil "_uid" || _uid == "") exitWith { false };

_exists = format ["isRegisted:%1", _uid] call DFUNC(dbSelectField);
_exists