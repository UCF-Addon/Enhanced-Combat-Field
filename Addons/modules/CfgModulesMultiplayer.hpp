class ECF_Module_Multiplayer_F: ECF_MODULES_M_F
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

/*class ECF_ModuleRespawnVehicle_F: ECF_Module_Multiplayer_F
{
    _generalMacro = "ECF_ModuleRespawnVehicle_F";
    scope = 2;
    displayName = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_0";
    category = "Multiplayer";

    functionPriority = 1;
    function = QFUNC(moduleRespawnVehicle);

    isGlobal = 0;
    isTriggerActivated = 0;

    icon = "\a3\Modules_f\data\iconRespawn_ca.paa";
    portrait = "\a3\Modules_f\data\portraitRespawn_ca.paa";

    class Arguments
    {
        class Delay
        {
            displayName = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Delay_0";
			description = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Delay_1";
			defaultValue = "";
        };

        class Position
        {
            displayName = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_0";
			description = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_1";

            class Values
            {
                class Start
                {
                    name = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_Start_0";
					value = 0;
                    default = 0;
                };

                class Death
                {
                    name = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_Death_0";
					value = 1;
                };

                class Synced
                {
                    name = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_Synced";
					value = 2;
                };
            };
        };

        class Type
        {
            displayName = "Type of Vehicle";
            description = "Describe Type of Vehicle";

            class Values
            {
                class Default
                {
                    name = "Standard";
                    value = 0;
                    default = 0;
                };

                class MobileHQ
                {
                    name = "Mobile Head-Quarter";
                    value = 1;
                };

                //class DeployableHQ
                //{
                //    name = "Deployable Head-Quarter";
                //    value = 2;
                //};
            };
        };

        class Wreck
        {
            displayName = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_0";
			description = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_1";

			class Values
			{
				class Preserve
				{
					name = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_values_Preserve_0";
					value = 0;
				};

				class Delete
				{
					name = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_values_Delete_0";
					value = 1;
                    default = 1;
				};

				class DeleteEffect
				{
					name = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_values_DeleteEffect_0";
					value = 2;
				};
			};
        };

        class Notification
        {
            displayName = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_ShowNotification_0";
			description = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_ShowNotification_1";

			class Values
			{
				class Enabled
				{
					name = "$STR_DISP_OPT_ENABLED";
					value = 1;
					default = 1;
				};
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = 0;
				};
			};
        };
    };

    class ModuleDescription: ModuleDescription
    {
        description = "$STR_A3_CfgVehicles_ModuleRespawnVehicle_F_ModuleDescription_0";
        position = 1;
        sync[] = {"AnyVehicle", "SideBLUFOR_F"};
    };
};*/