#include "script_component.h"

if (missionNamespace getVariable [QGVAR(useDBI), _false] == _true) then
{
	[DFUNC(openRoleD), []] call DFUNC(waitInit);
};