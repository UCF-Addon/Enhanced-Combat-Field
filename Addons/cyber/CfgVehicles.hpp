class CBA_Extended_EventHandlers;

class CfgVehicles
{
	class Land_DataTerminal_01_F;
	class ECF_Land_DataTerminal_01_F: Land_DataTerminal_01_F
	{
		_generalMacro = "ECF_Land_DataTerminal_01_F";
		//hiddenSelectionsTextures[] = {};

		powerOn = "[_this select 0, ""orange"", ""orange"", ""orange""] call BIS_fnc_DataTerminalColor; (_this select 0) setVariable [""ECF_Cyber_isActiv"", true, true];";
		powerOff = "[_this select 0, ""red"", ""red"", ""red""] call BIS_fnc_DataTerminalColor; (_this select 0) setVariable [""ECF_Cyber_isActiv"", false, true];";
		onCableConnect = "(_this select 0) setVariable [""Ecf_Cyber_isConnected"", ([(_this select 0), ""Land_SatelliteAntenna_01_F""] call Cyber_fnc_isConnectedTo), true];";
		onCableDisconnect = "(_this select 0) setVariable [""Ecf_Cyber_isConnected"", false, true];";

		class EventHandlers
		{
			init = "[_this select 0, ""red"", ""red"", ""red""] call BIS_fnc_DataTerminalColor;";
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
		};

		class ACE_Actions
		{
			class OpenDatacenter
			{
				displayName = "Open Datacenter";
				// TODO:  Fetch whether  the terminal is allready -> hide interaction
    			condition = "(_target getVariable [""ECF_Cyber_isActiv"", false]) && !(_target getVariable [""Ecy_Cyber_isStarted"", false])";
    			distance = 3;
    			exceptions[] = {};
    			statement = "[_target, -1] call Cyber_fnc_openClient";
			};
			class CloseDatacenter
			{
				displayName = "Close Datacenter";
				condition = "false";
				distance = 3;
				exceptions[] = {};
				statement = "[_target, -2] call Cyber_fnc_openClient";
			};
			class StartSystem
			{
				displayName = "Start Datacenter";
				condition = "!(_target getVariable [""Ecy_Cyber_isStarted"", false])";
				distance = 3;
				exceptions[] = {};
				statement = "[""ecf_cyber_event_startSystem"", [_target]] call CBA_fnc_localEvent";
			};
			class StopSytem
			{
				displayName = "Stop Datacenter";
				condition = "_target getVariable [""Ecf_Cyber_isStarted"", false]";
				distance = 3;
				exceptions[] = {};
				statement = "[""ecf_cyber_event_shutdownSystem"", [_target]] call CBA_fnc_localEvent;";
			};
		};
	};
};