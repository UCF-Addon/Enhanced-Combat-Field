#include "script_component.h"

private ["_player"];

_player = _this;

_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ACE_Altimeter";

if(/* isGroupLeader || isPlattonLeader */false) then
{
    _player linkItem "ACE_microDAGR";
}