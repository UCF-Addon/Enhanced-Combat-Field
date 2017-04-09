#include "script_component.h"

private ["_param", "_query", "_result"];

_param = _this;
_query = [0, (uiNamespace getVariable "db_session_Id"), _param] joinString ":";
_result = call compile ("extDB3" callExtension _query);

switch (_result select 0) do
{
    case 0:
    {
        (format ["Database Error: %1", (_result select 1)]) call BIS_fnc_log;
    };
    case 2:
    {
        _result = (_result select 1) call DFUNC(dbFallbackBigdata);
    };
};

_result select 1