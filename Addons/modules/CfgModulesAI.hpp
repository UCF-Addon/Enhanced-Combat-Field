class ECF_Module_AI_F: ECF_MODULES_M_F
{
    class ArgumentsBaseUnits
    {
        class Units;
    };
    class ModuleDescription
    {
        class AnyVehicle;
    };
};

/**
*
*   This class will be able to hold and assign Waypoints to Units
*
*/
class ECF_Module_AI_G: ECF_Module_AI_F
{
};

class ECF_Module_AI_Spawn_F: ECF_Module_AI_G
{
    _generalMacro = "ECF_Module_AI_Spawn_F";
    scope = 2;
    displayName = "AI Spawner";
    category = "ECF_AI";
    function = QFUNC(moduleAICreateSpawn);

    functionPriority = 1;
    isTriggerActivated = 1;
    isGlobal = 0;
    isDisposable = 1;

    class Arguments
    {
        class Side
        {
            displayName = "Side of Spawner";
            description = "";

            class Values
            {
                class Opfor
                {
                    name = "Opfor";
                    value = 0;
                    default = 0;
                };
                class Bluefor
                {
                    name = "Bluefor";
                    value = 1;
                };
                class Indipendent
                {
                    name = "Indipendent";
                    value = 2;
                };
                class Civilian
                {
                    name = "Civilian";
                    value = 3;
                };
                class Empty
                {
                    name = "Empty";
                    value = 4;
                };
            };
        };

        class Capable
        {
            displayName = "Capable";
            description = "";
            
            class Values
            {
                class Disabled
                {
                    name = "Disabled";
                    value = 0;
                    default = 0;
                };
                class Enabled
                {
                    name = "Enabled";
                    value = 1;
                };
            };
        };

        /**
        *
        *   Following Parameters are auto scaled by the system starting from 8 People to PlayerCount
        *   
        *   !!! Artillery is out of order !!!
        *
        */
        class Infantry
        {
            displayName = "Relative Amount of Infantry";
            description = "";
            typeName = "NUMBER";
            defaultValue = 24;
        };

        class LandVehicle_Light
        {
            displayName = "Relative Amount of Light Vehicles";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };

        class LandVehicle_Armored
        {
            displayName = "Relative Amount of Armored Vehicles";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };

        class LandArmor
        {
            displayName = "Relative Amount of Armor";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };

        class AirVehicle
        {
            displayName = "Relative Amount of Vehicles (AIR)";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };
        
        class AirVehicle_Combat
        {
            displayName = "Relative Amount of Vehicles (AIR COMBAT)";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };
    };
};

class ECF_Module_AI_Artillery_F: ECF_Module_AI_G
{
    _generalMacro = "ECF_Module_AI_Artillery_F";
    scope = 2;
    displayName = "AI Artillery";
    category = "ECF_AI";
    function = QFUNC(moduleAICreateArtillery);

    functionPriority = 1;
    isTriggerActivated = 1;
    isGlobal = 0;
    isDisposable = 1;

    class Arguments
    {
        class Side
        {
            displayName = "Side of Spawner";
            description = "";

            class Values
            {
                class Opfor
                {
                    name = "Opfor";
                    value = 0;
                    default = 0;
                };
                class Bluefor
                {
                    name = "Bluefor";
                    value = 1;
                };
                class Indipendent
                {
                    name = "Indipendent";
                    value = 2;
                };
                class Civilian
                {
                    name = "Civilian";
                    value = 3;
                };
                class Empty
                {
                    name = "Empty";
                    value = 4;
                };
            };
        };

        class Type
        {
            displayName = "Type of Artillery";
            description = "Classnames of Artillery in a Array";
            typeName = "ARRAY";
            defaultValue = "[""mortar_82mm"",""mortar_155mm_AMOS""]";
        };
    };
};

class ECF_Module_AI_Reinforce_F: ECF_Module_AI_G
{
    _generalMacro = "ECF_Module_AI_Reinforce_F";
    scope = 2;
    displayName = "AI Reinforce";
    category = "ECF_AI";
    function = QFUNC(moduleAICreateReinforcement);

    functionPriority = 1;
    isTriggerActivated = 1;
    isGlobal = 0;
    isDisposable = 0;

    class Arguments
    {
        class Side
        {
            displayName = "Side of Spawner";
            description = "";

            class Values
            {
                class Opfor
                {
                    name = "Opfor";
                    value = 0;
                    default = 0;
                };
                class Bluefor
                {
                    name = "Bluefor";
                    value = 1;
                };
                class Indipendent
                {
                    name = "Indipendent";
                    value = 2;
                };
                class Civilian
                {
                    name = "Civilian";
                    value = 3;
                };
                class Empty
                {
                    name = "Empty";
                    value = 4;
                };
            };
        };

        class Capable
        {
            displayName = "Capable";
            description = "";
            
            class Values
            {
                class Disabled
                {
                    name = "Disabled";
                    value = 0;
                    default = 0;
                };
                class Enabled
                {
                    name = "Enabled";
                    value = 1;
                };
            };
        };

        class Request
        {
            displayName = "Request of AI";
            description = "Enable or disable, whether the ai is allowed to call reinforment by herself. Trigger will work in any case";
        
            class Values
            {
                class Enabled
                {
                    name = "Enabled (Disabled because of missing ai code)";
                    value = 1;
                    default = 1;
                };
                class Disabled
                {
                    name = "Disabled";
                    value = 0;
                };
            }        
        };

        /**
        *
        *   Following Parameters are auto scaled by the system starting from 8 People to PlayerCount
        *   Pool means, that every activation reduce the amount of the left units for each type
        *   The Amount of Units taken by one activation is calculated by PlayerCount
        *
        *   !!! Artillery is out of order !!!
        *
        */
        class Infantry
        {
            displayName = "Pool of Infantry";
            description = "";
            typeName = "NUMBER";
            defaultValue = 50;
        };

        class LandVehicle_Light
        {
            displayName = "Pool of Light Vehicles";
            description = "";
            typeName = "NUMBER";
            defaultValue = 3;
        };

        class LandVehicle_Armored
        {
            displayName = "Pool of Armored Vehicles";
            description = "";
            typeName = "NUMBER";
            defaultValue = 1;
        };

        class LandArmor
        {
            displayName = "Pool of Armor";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };

        class AirVehicle
        {
            displayName = "Pool of Vehicles (AIR)";
            description = "";
            typeName = "NUMBER";
            defaultValue = 1;
        };
        
        class AirVehicle_Combat
        {
            displayName = "Pool of Vehicles (AIR COMBAT)";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };

        /**
        *
        *   Marker will show Position in any case
        *   -   Mark = Shows Position
        *   -   Mark Strict = Shows Position, Left Units and Spawned Units (like debug settings)
        *
        */
        class Marker
        {
            displayName = "Markup at Map";
            description = "";

            class Values
            {
                class Empty
                {
                    name = "Empty";
                    value = 0;
                    default = 0;
                };
                class Marker
                {
                    name = "Marker";
                    value = 1;
                };
                class MarkerStrict
                {
                    name = "Marker Strict";
                    value = 2;
                };
            };
        };
    };
};