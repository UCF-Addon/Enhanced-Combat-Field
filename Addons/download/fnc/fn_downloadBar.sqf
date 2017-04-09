#include "script_component.h"

params["_laptop"];
private  ["_hasItem","_time","_t"];
_hasItem = "ECF_Download" in (items player);
_t = 20;
_time =_t + floor random [5,40,120];

if(!_hasItem) exitWith {hint (localize LSTRING(NO_USB))};

_laptop setVariable [QGVAR(isDownloading), true, true];

[
  _time,
  _laptop,
  {
    player removeItem "ECF_Download";
    hint (localize LSTRING(Download_finish));
    (_this select 0) setVariable [QGVAR(hasDownloaded), true, true];
    (_this select 0) setVariable [QGVAR(isDownloading), false, true];
  },
  {
    hint (localize LSTRING(Download_aborted))
  },
  localize LSTRING(Download_standby)
] call ace_common_fnc_progressBar;
