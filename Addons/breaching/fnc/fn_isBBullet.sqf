#include "script_component.h"

params [["_bullet", objNull]];

if (isNull _bullet) exitWith { false };

if ((_bullet isKindOf "ECF_ammo_12g_00buckshot") ||
	(_bullet isKindOf "ECF_ammo_12g_slug") ||
	(_bullet isKindOf "ECF_ammo_12g_HE") ||
	(_bullet isKindOf "ECF_ammo_12g_FRAG")) exitWith
{
	true
};

false