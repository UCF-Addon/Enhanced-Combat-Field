#include "script_component.h"

ADDON = false;

#include "XEH_PREP.h"

GMVAR(rblurPPEffectCC) = ppEffectCreate ["RadialBlur", 5556];

GMVAR(flashPPEffectCC) = ppEffectCreate ["ColorCorrections", 5555];
GMVAR(flashPPEffectCC) ppEffectForceInNVG true;

ADDON = true;