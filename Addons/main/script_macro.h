// Pre defines
#define MAINPREFIX u
#define PREFIX ecf

// CBA Include
#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"


//
#define _false 0
#define _true 1
#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
}


// Strings / Stringconstants
#define AUTHORS "Lt. Julius, Blackswater"


// Addon & Syspath
#define ADDON DOUBLE(ecf,COMPONENT)
#define SYSPATH \u\ecf\addons


// configFile Access
#define ADDB(var1) isClass (configFile >> "CfgPatches" >> "var1")


// Merge Parameter / Quote
#define QUOTE(var1) #var1
#define DQUOTE(var1) QUOTE(QUOTE(var1))
#define DOUBLE(var1,var2) ##var1##_##var2
#define TRIPPLE(var1,var2,var3) ##var1##_##var2##_##var3


// Variable Macros
#define GVAR(var1) DOUBLE(PREFIX,var1)
#define GMVAR(var1) DOUBLE(ADDON,var1)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QGMVAR(var1) QUOTE(GMVAR(var1))

// Event Macros
#define GEV(var1) TRIPPLE(PREFIX,event,var1)
#define GMEV(var1) TRIPPLE(ADDON,event,var1)
#define QGEV(var1) QUOTE(GEV(var1))
#define QGMEV(var1) QUOTE(GMEV(var1))


// Pathing
#define PATHOF_SYS(var1,var2) SYSPATH\##var1\##var2
//#define PATHTO_SYS(var1,var2) SYSPATH\##var1\##var2.sqf

#define PATHOF(var1) PATHOF_SYS(COMPONENT,var1)
//#define PATHTO(var1) PATHTO_SYS(COMPONENT,var1)

#define QPATHOF(var1) QUOTE(PATHOF(var1))
//#define QPATHTO(var1) QUOTE(PATHTO(var1))


// Merge Function Name
#undef QFUNC
#define DFUNC(var1) TRIPPLE(COMPONENT,fnc,var1)
#define QFUNC(var1) QUOTE(DFUNC(var1))
#define DMFUNC(var1,var2) TRIPPLE(var1,fnc,var2)
#define QMFUNC(var1,var2) QUOTE(DMFUNC(var1,var2))


// Compile Functions
#ifdef DISABLE_COMPILE_CACHE
    #define PREP(var1) DFUNC(var1) = compile preProcessFileLineNumbers QPATHOF(fnc\DOUBLE(fn,var1).sqf)
#else
    #define PREP(var1) [QPATHOF(fnc\DOUBLE(fn,var1).sqf), QFUNC(var1)] call CBA_fnc_compileFunction
#endif
