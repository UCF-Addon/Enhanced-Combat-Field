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
			class MainActions
			{
				displayName = "Interaction";
				distance = 4;
				condition = QUOTE(true);
				statement = "";
				icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";

				class StartGenerator
    			{
    				displayName = "Start Generator";
    				condition = "!(_target getVariable [""isStarted"", false])";
    				distance = 4;
    				exceptions[] = {};
    				statement = "_target setVariable [""isStarted"", true, true]; [""ecf_electricity_event_powerSupply"", [_target, true]] call CBA_fnc_localEvent;";
    			};
    			class StopGenerator
    			{
    				displayName = "Stop Generator";
    				condition = "(_target getVariable [""isStarted"", false])";
    				distance = 4;
    				exceptions[] = {};
    				statement = "_target setVariable [""isStarted"", false, true];  [""ecf_electricity_event_powerSupply"", [_target, false]] call CBA_fnc_localEvent;";
    			};
    			class ConnectCable
    			{
    				displayName = "Connect Cable";
    				condition = "(count (player getVariable [""ecf_electricity_cableConnection"", []]) < 1) && ([player] call Electricity_fnc_haveCable) && !([_target] call Electricity_fnc_haveConnection)";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[player, _target] call Electricity_fnc_connectCable;";
    			};
    			class DisconnectCable
    			{
    				displayName = "Disconnect Cable";
    				condition = "[_target] call Electricity_fnc_haveConnection";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[""ecf_electricity_event_powerDisconnect"", [_target]] call CBA_fnc_localEvent;";
    			};
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
			class MainActions
			{
				displayName = "Interaction";
				distance = 4;
				condition = QUOTE(true);
				statement = "";
				icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";

				class StartGenerator
    			{
    				displayName = "Start Generator";
    				condition = "!(_target getVariable [""isStarted"", false])";
    				distance = 4;
    				exceptions[] = {};
    				statement = "_target setVariable [""isStarted"", true, true]; [""ecf_electricity_event_powerSupply"", [_target, true]] call CBA_fnc_localEvent;";
    			};
    			class StopGenerator
    			{
    				displayName = "Stop Generator";
    				condition = "(_target getVariable [""isStarted"", false])";
    				distance = 4;
    				exceptions[] = {};
    				statement = "_target setVariable [""isStarted"", false, true];  [""ecf_electricity_event_powerSupply"", [_target, false]] call CBA_fnc_localEvent;";
    			};
    			class ConnectCable
    			{
    				displayName = "Connect Cable";
    				condition = "(count (player getVariable [""ecf_electricity_cableConnection"", []]) < 1) && ([player] call Electricity_fnc_haveCable) && !([_target] call Electricity_fnc_haveConnection)";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[player, _target] call Electricity_fnc_connectCable;";
    			};
    			class DisconnectCable
    			{
    				displayName = "Disconnect Cable";
    				condition = "[_target] call Electricity_fnc_haveConnection";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[""ecf_electricity_event_powerDisconnect"", [_target]] call CBA_fnc_localEvent;";
    			};
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
			class MainActions
			{
				displayName = "Interaction";
				distance = 4;
				condition = QUOTE(true);
				statement = "";
				icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";

				class StartGenerator
    			{
    				displayName = "Start Generator";
    				condition = "!(_target getVariable [""isStarted"", false])";
    				distance = 4;
    				exceptions[] = {};
    				statement = "_target setVariable [""isStarted"", true, true]; [""ecf_electricity_event_powerSupply"", [_target, true]] call CBA_fnc_localEvent;";
    			};
    			class StopGenerator
    			{
    				displayName = "Stop Generator";
    				condition = "(_target getVariable [""isStarted"", false])";
    				distance = 4;
    				exceptions[] = {};
    				statement = "_target setVariable [""isStarted"", false, true];  [""ecf_electricity_event_powerSupply"", [_target, false]] call CBA_fnc_localEvent;";
    			};
    			class ConnectCable
    			{
    				displayName = "Connect Cable";
    				condition = "(count (player getVariable [""ecf_electricity_cableConnection"", []]) < 1) && ([player] call Electricity_fnc_haveCable) && !([_target] call Electricity_fnc_haveConnection)";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[player, _target] call Electricity_fnc_connectCable;";
    			};
    			class DisconnectCable
    			{
    				displayName = "Disconnect Cable";
    				condition = "[_target] call Electricity_fnc_haveConnection";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[""ecf_electricity_event_powerDisconnect"", [_target]] call CBA_fnc_localEvent;";
    			};
			};
		};
	};

	class Land_DataTerminal_01_F;
	class ECF_Land_DataTerminal_01_F: Land_DataTerminal_01_F
	{
		class ACE_Actions
		{
			class MainActions
			{
				class ConnectCable
    			{
    				displayName = "Connect Cable";
    				condition = "(count (player getVariable [""ecf_electricity_cableConnection"", []]) > 0) && !([_target] call Electricity_fnc_haveConnection)";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[player, _target] call Electricity_fnc_connectCable;";
    			};
    			class DisconnectCable
    			{
    				displayName = "Disconnect Cable";
    				condition = "[_target] call Electricity_fnc_haveConnection";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[""ecf_electricity_event_powerDisconnect"", [_target]] call CBA_fnc_localEvent;";
    			};
			};
		};
	};
};