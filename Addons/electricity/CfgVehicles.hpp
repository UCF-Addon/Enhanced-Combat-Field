class CBA_Extended_EventHandlers;

class CfgVehicles
{
	class ThingX;
	class Land_PortableGenerator_01_F: ThingX
    {
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
		};

		GMVAR(isGenerator) = _true;

		class ACE_Actions
		{
			class StartGenerator
			{
				displayName = "Start Generator";
				condition = "!(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", true, true];";
			};
			class StopGenerator
			{
				displayName = "Stop Generator";
				condition = "(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", false, true];";
			};
		};
	};

	class Land_Portable_generator_F: ThingX
	{
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
		};

		GMVAR(isGenerator) = _true;

		class ACE_Actions
		{
			class StartGenerator
			{
				displayName = "Start Generator";
				condition = "!(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", true, true];";
			};
			class StopGenerator
			{
				displayName = "Stop Generator";
				condition = "(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", false, true];";
			};
		};
	};

	class House_Small_F;
	class Land_PowerGenerator_F: House_Small_F
	{
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
		};

		GMVAR(isGenerator) = _true;

		class ACE_Actions
		{
			class StartGenerator
			{
				displayName = "Start Generator";
				condition = "!(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", true, true];";
			};
			class StopGenerator
			{
				displayName = "Stop Generator";
				condition = "(_target getVariable [""isStarted"", false])";
				distance = 4;
				exceptions[] = {};
				statement = "_target setVariable [""isStarted"", false, true];";
			};
		};
	};
};