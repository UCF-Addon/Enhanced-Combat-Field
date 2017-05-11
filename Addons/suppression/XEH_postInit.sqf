#include "script_component.h"

//if (!hasInterface) exitWith {};

//{
GMVAR(useAdvancedSuppression) = _true; // Debug Settings
//}

if (GMVAR(useAdvancedSuppression) != _true) exitWith {};
[] call DFUNC(setupArrays);

GMVAR(__enabled) = /* Debug = _true */if ((isMultiplayer && isServer) || (!isMultiplayer)) then { _true } else { _false };
GMVAR(__hearingCover) = 15; // Direct Cover distance
GMVAR(__maxCoverDistance) = 30;
GMVAR(__maxEffectDistance) = 30; // Coef for effective constant
GMVAR(__effectiveCoef) = 7;
GMVAR(__coef_0) = 2; // Cover
GMVAR(__coef_1) = 5; // Cover + Kneel
GMVAR(__coef_2) = 10; // Cover + Prone
GMVAR(__player) = _false; // Should effect Player Unit // Debug
GMVAR(__lastFrame) = diag_tickTime;

if ((isMultiplayer && isServer) || (!isMultiplayer)) then
{
	GMVAR(__pFHBullet) = [DFUNC(pFHBullet), 0, []] call CBA_fnc_addPerFrameHandler;
	GMVAR(__pFHUnit) = [DFUNC(pFHUnits), 0, []] call CBA_fnc_addPerFrameHandler;
};

if (hasInterface) then
{
	GMVAR(DOUBLE(PP,dist)) = ppEffectCreate ["DynamicBlur", SUPP_PP_DIST_ID];
	GMVAR(DOUBLE(PP,dist)) ppEffectForceInNVG false;
	GMVAR(DOUBLE(PP,dist)) ppEffectAdjust [0];
	GMVAR(DOUBLE(PP,dist)) ppEffectCommit 0;

	//GMVAR(pFHBulletIn) = [DFUNC(pFHBulletIn), 0, []] call CBA_fnc_addPerFrameHandler;
};