#include "script_component.h"

private ["_dialog", "_ctrl", "_roles"];

_roles = player getVariable [QGVAR(roles), []];

disableSerialization;
_dialog = createDialog "ECF_Client_Menu";
_ctrl = ((findDisplay -1) displayCtrl 5);

if ((count _roles) < 2) exitWith
{
    if ((count _roles) == 0) then
    {
        player setVariable ['_client_ui_role', -1, false];
    } else
    {
        player setVariable ['_client_ui_role', 0, false];
    };

    [] call DFUNC(updateRole);
};

{
    _ctrl lbAdd (_x select 1);

    if (!isNil (_x select 2)) then
    {
        _ctrl lbSetPicture [_foreachindex, QPATHOF(_x select 2)];
    };
    
    _ctrl lbSetTooltip [_foreachindex, (_x select 1)];
} forEach _roles;

_ctrl lbSetCurSel 0;