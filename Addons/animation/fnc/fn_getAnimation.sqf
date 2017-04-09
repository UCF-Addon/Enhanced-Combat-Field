#include "script_component.h"

params [["_anim", "", [""]], ["_state", "", [""]]];

if (isNil _anim || _anim == "") exitWith {};


private _entry = nil;

switch (_anim) do
{
    case "cpl": { _entry = "Acts_TreatingWounded01"; };
    case "inject": { _entry = "Acts_TreatingWounded02"; };
    case "sew": { _entry = "Acts_TreatingWounded05"; };
    case "bandage": { if ((random 1) > 0) then { _entry = "Acts_TreatingWounded03"; } else { _entry = "Acts_TreatingWounded04"; }; };
    default {};
};

if (isNil "_entry") exitWith {};
_entry

// Selection for State (Standing, Prone, Kneeling) is available