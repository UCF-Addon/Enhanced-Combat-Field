#include "script_component.h"

private ["_player", "_equip", "_classid", "_container", "_item", "_amount"];

_player = _this select 0;
_classid = _this select 1;

// Main-Items without container Items
_equip = format ["loadEquipment:%1:%2", _classid, (getPlayerUID _player)] call DFUNC(dbSelectRow);

_player addHeadgear (_equip select 6); // Helmet / Headgear
_player forceAddUniform (_equip select 7); // Uniform
_player addVest (_equip select 8); // Vest
_player addBackpackGlobal (_equip select 9); // Bagpack

_player addWeaponGlobal (_equip select 0); // Primary Weapon
_player addWeaponGlobal (_equip select 1); // Secondary Weapon
_player addWeaponGlobal (_equip select 2); // Handgun

// Just a second to prevent problems
sleep 1;

_player linkItem (_equip select 3); // Add and assign NVG

_player addWeaponGlobal (_equip select 4); // Add and assign Goggles

_player addGoggles (_equip select 5); // Add and assign Glasses

_player linkItem (_equip select 10); // Add and assign Radio

// Just a second to prevent problems
sleep 1;

// Subitems into Container
_equip = format ["loadContainer:%1:%2", _classid, (getPlayerUID _player)] call DFUNC(dbSelectFull);

{
    sleep 0.2;
    _container = _x select 0;
    _item = _x select 1;
    _amount = _x select 2;

    if(_container != "" && _item != "") then
    {
        switch(_container) do
        {
            case "prime":
            {
                [_player, _item] remoteExec ["addPrimaryWeaponItem", _player];
            };
            case "second":
            {
                [_player, _item] remoteExec ["addSecondaryWeaponItem", _player];
            };
            case "handgun":
            {
                [_player, _item] remoteExec ["addHandgunItem", _player];
            };
            case "uniform":
            {
                for "_i" from 1 to _amount do
                {
                    _player addItemToUniform _item;
                };
            };
            case "vest":
            {
                for "_i" from 1 to _amount do
                {
                    _player addItemToVest _item;
                };
            };
            case "bagpack":
            {
                for "_i" from 1 to _amount do
                {
                    _player addItemToBackpack _item;
                };
            };
        };
    };
} forEach _equip;

[_player, _classid] call DFUNC(setInsignia);
_player call DFUNC(equipPlayer);
[_player, _classid] call DFUNC(setPlayerSkills);