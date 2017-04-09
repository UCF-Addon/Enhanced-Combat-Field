class ECF_Module_Intel_F: ECF_MODULES_M_F
{
    class ArgumentsBaseUnits
    {
        class Units;
    };
    class ModuleDescription
    {
        class AnyBrain;
    };
};

class ECF_ModuleTaskCreate_F: ECF_Module_Intel_F
{
    _generalMacro = "ECF_ModuleTaskCreate_F";
    scope = 2;
    displayName = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_0";
    category = "Intel";
    function = QFUNC(moduleTaskCreate);
    isTriggerActivated = 1;

    class Arguments
    {
        class Owner
        {
            displayName = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_Arguments_Owner_0";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Unit
				{
					name = "$STR_A3_CfgVehicles_Module_F_ArgumentsBaseUnits_Units_values_Objects_0";
					value = 0;
				};
				class Group
				{
					name = "$STR_A3_CfgVehicles_Module_F_ArgumentsBaseUnits_Units_values_ObjectsAndGroups_0";
					value = 1;
					default = 1;
				};
				class Side
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_Arguments_Owner_values_Side_0";
					value = 2;
				};
				class All
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_Arguments_Owner_values_All_0";
					value = 3;
				};
				class West
				{
					name = "$STR_West";
					value = 4;
				};
				class East
				{
					name = "$STR_East";
					value = 5;
				};
				class Guer
				{
					name = "$STR_Guerrila";
					value = 6;
				};
				class Civ
				{
					name = "$STR_Civilian";
					value = 7;
				};
			};
        };

        class ID
        {
            displayName = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_Arguments_ID_0";
			description = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_Arguments_ID_1";
        };

        class PID
        {
            displayName = "Parent Task-ID"; // TODO: add to stringtable
			description = "Parent Task-ID so the child task will be a subtask of it."; // TODO: add to stringtable
        };

        class Title
        {
            displayName = "$STR_A3_CfgVehicles_ModuleTaskSetDescription_F_Arguments_Title_0";
			description = "";
        };

        class Description
        {
            displayName = "$STR_A3_CfgVehicles_ModuleTaskSetDescription_F_Arguments_Description_0";
			description = "";
        };

        class Destination
        {
            displayName = "$STR_A3_CfgVehicles_ModuleTaskSetDestination_F_Arguments_Destination_0";
			description = "";
			typeName = "NUMBER";
			class Values
			{

				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = 0;
				};

				class Module
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetDestination_F_Arguments_Destination_Values_Module_0";
					value = 1;
					default = 1;
				};
			};
        };

        class State
        {
            displayName = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_0";
			description = "";
			class Values
			{
				class Created
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Created_0";
					value = "CREATED";
					default = 1;
				};
				class Assigned
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Assigned_0";
					value = "ASSIGNED";
				};
				class Succeeded
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Succeeded_0";
					value = "SUCCEEDED";
				};
				class Failed
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Failed_0";
					value = "FAILED";
				};
				class Canceled
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Canceled_0";
					value = "CANCELED";
				};
			};
        };

        class Notification
        {
            displayName = "Show Notification"; // TODO: add stringtable
            typeName = "NUMBER";
            class Values
            {
                class Disabled
                {
                    name = "$STR_DISP_OPT_DISABLED";
                    value = 0;
                };

                class Enabled
                {
                    name ="$STR_DISP_OPT_ENABLED";
                    value = 1;
                    default = 1;
                };
            };
        };

        class Type
        {
            displayName = "$STR_A3_cfgvehicles_moduletaskcreate_f_arguments_type_0";
			description = "$STR_A3_cfgvehicles_moduletaskcreate_f_arguments_type_1";
        };

        class AlwaysVisible
        {
            displayName = "$STR_A3_cfgvehicles_moduletaskcreate_f_arguments_alwaysvisible_0";
			description = "$STR_A3_cfgvehicles_moduletaskcreate_f_arguments_alwaysvisible_1";
			typeName = "NUMBER";
			class Values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = 0;
					default = 1;
				};
				class Enabled
				{
					name = "$STR_DISP_OPT_ENABLED";
					value = 1;
				};
			};
        };
    };

    class ModuleDescription: ModuleDescription
    {
        description = "$STR_A3_CfgVehicles_ModuleTaskCreate_F_ModuleDescription_0";
		sync[] = {"AnyBrain"};
		class AnyBrain: AnyBrain
		{
			optional = 1;
		};
    };
};

class ECF_ModuleTaskSetState_F: ECF_Module_Intel_F
{
	_generalMacro = "ECF_ModuleTaskSetState_F";
    scope = 2;
    displayName = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_0";
    category = "Intel";
    function = QFUNC(moduleTaskSetState);
	functionPriority = 1;
    isTriggerActivated = 1;

	class Arguments
	{
		class State
		{
			displayName = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_0";
			description = "";
			class Values
			{
				class Created
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Created_0";
					value = "CREATED";
					default = 1;
				};
				class Assigned
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Assigned_0";
					value = "ASSIGNED";
				};
				class Succeeded
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Succeeded_0";
					value = "SUCCEEDED";
				};
				class Failed
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Failed_0";
					value = "FAILED";
				};
				class Canceled
				{
					name = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Canceled_0";
					value = "CANCELED";
				};
			};
		};

		class Notification
        {
            displayName = "Show Notification"; // TODO: add stringtable
            typeName = "NUMBER";
            class Values
            {
                class Disabled
                {
                    name = "$STR_DISP_OPT_DISABLED";
                    value = 0;
                };

                class Enabled
                {
                    name ="$STR_DISP_OPT_ENABLED";
                    value = 1;
                    default = 1;
                };
            };
        };
	};

	class ModuleDescription: ModuleDescription
	{
		description = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_ModuleDescription_0";
		sync[] = {"ECF_ModuleTaskCreate_F"};
		class ModuleTaskCreate_F
		{
			description = "$STR_A3_CfgVehicles_ModuleTaskSetState_F_ModuleDescription_ModuleTaskCreate_F_0";
		};
	};
};