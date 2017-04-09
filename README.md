# Enhanced-Combat-Field
United-Cyber-Forces addons/modifications and scripts for Arma
This is a **private** project of the UCF-Clan.
___

# License
This addon is only for **private use**!

Don't use this Addon without permission!
If you don't have the permisison from the authors you have to delete this Addon!
Don't use any code without permission!
___

# Macros

* `AUTHORS` Using for config cpp as author

* `ADDON` Using for merged name for addons
* `SYSPATH` Path of the root to the different addons

* `ADDB(var1)` check for addon var1

* `QUOTE(var1)` quotate var1 <br />(e.g. QUOTE(position) => `"position"`)
* `DQUOTE(var1)` double quotate var1 <br />(e.g. DQUOTE(position) => `""position""`)
* `DOUBLE(var1,var2)` merge var1 and var2 together by using _  <br />(e.g. DOUBLE(x,y) => `x_y`)
* `TRIPPLE(var1,var2,var3)` merge var1, var2 and var3 together by using _ <br />(e.g. TRIPPLE(x,y,z) => `x_y_z`)

* `GVAR(var1)` returns var1 as global variable <br />(e.g. GVAR(useDB) => `ucf_useDB`)
* `GMVAR(var1)` returns var1 as modular global variable <br />(e.g. GMVAR(useDB) => `ucf_sdb_useDB`)
* `QGVAR(var1)` returns GVAR quotated
* `QGMVAR(var1)` return GMVAR quotated

* `PATHOF(var1)` returns absolute path of var1 <br />(e.g. PATHOF(fnc\fn_showCityName.sqf) => `\u\ucf\addons\cn\fnc\fn_showCityName.sqf`)
* `QPATHOF(var1)` returns PATHOF(var1) quotated

* `DFUNC(var1)` declares function name <br />(e.g. DFUNC(showCityName) => `cn_fnc_showCityName`)
* `QFUNC(var1)` returns DFUNC(var1) quotated

* `PREP(var1)` compiles a preProcessedFile as function <br />(e.g. PREP(showCityName) => `cn_fnc_showCityName = compile preProcessFileLineNumbers "\u\ucf\addons\cn\fnc\fn_showCityName.sqf"`)
