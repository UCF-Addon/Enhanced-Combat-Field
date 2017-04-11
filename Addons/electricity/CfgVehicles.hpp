class CfgVehicles
{
	class ThingX;
	class Land_PortableGenerator_01_F: ThingX
    {
		class ACE_Actions
		{
			class StartGenerator
			{
				displayName = "Start Generator";
				condition = "!(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", true, true];";
				position = "[0,0,0]";
				//icon = "";
			};
			class StopGenerator
			{
				displayName = "Stop Generator";
				condition = "(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", false, true];";
				position = "[0,0,0]";
				//icon = "";
			};
		};
	};

	class Land_Portable_generator_F: ThingX
	{
		class ACE_Actions
		{
			class StartGenerator
			{
				displayName = "Start Generator";
				condition = "!(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", true, true];";
				position = "[0,0,0]";
				//icon = "";
			};
			class StopGenerator
			{
				displayName = "Stop Generator";
				condition = "(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", false, true];";
				position = "[0,0,0]";
				//icon = "";
			};
		};
	};

	class House_Small_F;
	class Land_PowerGenerator_F: House_Small_F
	{
		class ACE_Actions
		{
			class StartGenerator
			{
				displayName = "Start Generator";
				condition = "!(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", true, true];";
				position = "[0,0,1]";
				//icon = "";
			};
			class StopGenerator
			{
				displayName = "Stop Generator";
				condition = "(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", false, true];";
				position = "[0,0,1]";
				//icon = "";
			};
		};
	};
};