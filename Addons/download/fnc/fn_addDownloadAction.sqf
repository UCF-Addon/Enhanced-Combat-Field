#include "script_component.h"

params ["_laptop"];
private _type = typeof _laptop;

if (getNumber(configfile >> "CfgVehicles" >> _type >> QGVAR(download)) != 1) exitWith{};

  // Exit if class already initialized
if (_type in GVAR(initializedClasses)) exitWith {};

/*GVAR(initializedClasses) pushBack (format ["%1_%2", _fnc, _type]);*/
 GVAR(initializedClasses) pushBack _type;

private _downloadAction = [
  QUOTE(Starte Download),
  localize LSTRING(Starte_Download),
  QPATHOF(data\download_ca.paa),
   {_this call DFUNC(downloadBar)},
  {true},
  {},
  [],
  [0, 0, 0],
  3
] call ace_interact_menu_fnc_createAction;

private _UploadAction = [
  QUOTE(Starte Upload),
  localize LSTRING(Starte_Upload),
  QPATHOF(data\upload_ca.paa),
  {_this call DFUNC(uploadBar)},
  {true},
  {},
  [],
  [0, 0, 0],
  3
] call ace_interact_menu_fnc_createAction;

[_type, 0, ["ACE_MainActions"], _downloadAction] call ace_interact_menu_fnc_addActionToClass;
[_type, 0, ["ACE_MainActions"], _uploadAction] call ace_interact_menu_fnc_addActionToClass;
