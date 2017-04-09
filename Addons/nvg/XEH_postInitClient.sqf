#include "script_component.h"

GMVAR(DOUBLE(PP,wetDist)) = ppEffectCreate ["WetDistortion", NVG_PP_WET_DIST_ID];
GMVAR(DOUBLE(PP,wetDist)) ppEffectForceInNVG true;
GMVAR(DOUBLE(PP,wetDist)) ppEffectAdjust [1, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0];
GMVAR(DOUBLE(PP,wetDist)) ppEffectCommit 0;

GMVAR(DOUBLE(PP,filmGrain)) = ppEffectCreate ["FilmGrain", NVG_PP_FILM_GRAIN_ID];
GMVAR(DOUBLE(PP,filmGrain)) ppEffectForceInNVG true;
GMVAR(DOUBLE(PP,filmGrain)) ppEffectAdjust [0.05, 0, 2, 2.77,1.96, true];
GMVAR(DOUBLE(PP,filmGrain)) ppEffectCommit 0;

["visionMode", DFUNC(triggerNVG)] call CBA_fnc_addPlayerEventHandler;