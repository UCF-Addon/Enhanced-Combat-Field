#include "script_component.h"

if(!hasInterface OR is3DEN OR is3DENMultiplayer OR (!isMultiplayer)) exitWith {};

if !(serverCommandAvailable "#logout") then
{
    disableUserInput true;
};
cutText["Deine Spielerdaten werden geladen.","BLACK OUT", 0.001];