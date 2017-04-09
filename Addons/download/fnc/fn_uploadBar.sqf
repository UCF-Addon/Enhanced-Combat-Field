#include "script_component.h"

params ["_laptop"];
private  ["_hasItem","_time","_t"];
_hasItem = "ECF_Upload" in (items player);
_t = 20;
_time =_t + floor random [5,40,120];

if(!_hasItem) exitWith {hint (localize LSTRING(NO_USB))};

_laptop setVariable [QGVAR(isUploading), true, true];

[
  _time,
  _laptop,
  {
    player removeItem "ECF_Upload";
    hint (localize LSTRING(Upload_finish));
    (_this select 0) setVariable [QGVAR(hasUploaded),true,true];
    (_this select 0) setVariable [QGVAR(isUploading), false, true];
  },
  {
    hint (localize LSTRING(Upload_aborted))
  },
  localize LSTRING(Upload_standby)
] call ace_common_fnc_progressBar;
