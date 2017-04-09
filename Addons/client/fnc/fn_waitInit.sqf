#include "script_component.h"

params [["_code", {}, [{}]], ["_params", [], [[]]]];

_nul = [_code, _params] spawn
{
	//[] call DFUNC(loadingStart);
	waitUntil { (!isNull player) && (count (player getVariable [QGVAR(roles), []]) > 0) && (player getVariable ["ECF_var_isDBI", _false] == _true) };
	//[] call DFUNC(loadingFinish);

	sleep 1;

	(_this select 1) call (_this select 0);
};