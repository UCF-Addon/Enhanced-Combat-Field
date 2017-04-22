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
			class MainActions
			{
				displayName = "Interaction";
				condition = QUOTE(true);
				distance = 4;
				exceptions[] = {};
				statement = "";

				class OpenDatacenter
    			{
    				displayName = "Open Datacenter";
        			condition = "(_target getVariable [""ECF_Cyber_isActiv"", false]) && !(_target in (missionNamespace getVariable [QGMVAR(clients), []]))";
        			distance = 4;
        			exceptions[] = {};
        			statement = "[_target, -1] call Cyber_fnc_openClient";
    			};
    			class CloseDatacenter
    			{
    				displayName = "Close Datacenter";
    				condition = "(_target in (missionNamespace getVariable [QGMVAR(clients), []]))";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[_target, -2] call Cyber_fnc_openClient";
    			};
    			class StartSystem
    			{
    				displayName = "Start Datacenter";
    				condition = "!(_target getVariable [""Ecy_Cyber_isStarted"", false]) && (_target in (missionNamespace getVariable [QGMVAR(clients), []]))";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[""ecf_cyber_event_startSystem"", [_target]] call CBA_fnc_localEvent";
    			};
    			class StopSytem
    			{
    				displayName = "Stop Datacenter";
    				condition = "_target getVariable [""Ecf_Cyber_isStarted"", false]";
    				distance = 4;
    				exceptions[] = {};
    				statement = "[""ecf_cyber_event_shutdownSystem"", [_target]] call CBA_fnc_localEvent;";
    			};
    			class ConnectDataCable
    			{
					displayName = "Connect Data Cable";
					condition = "([player] call Cyber_fnc_haveCable) && (count (_target getVariable [""ecf_cyber_cableConnections"", []]) > 0)";
					distance = 4;
					exceptions[] = {};
					statement = "[player, _target] call Cyber_fnc_connectCable";
    			};
    			class DisconnectDataCable
    			{
					displayName = "Disconnect Data Cable";
					condition = "count (_target getVariable [""ecf_cyber_cableConnections"", []]) > 0";
					distance = 4;
					exceptions[] = {};
					statement = "[""ecf_cyber_event_cabledisconnect"", [_target]] call CBA_fnc_localEvent;";
    			};
			};
		};
	};

	class ThingX;
	class Land_SatelliteAntenna_01_F: ThingX
	{
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
		};

		class ACE_Actions
		{
			class MainActions
			{
				displayName = "Interaction";
				condition = QUOTE(true);
				distance = 4;
				exceptions[] = {};
				statement = "";

    			class ConnectDataCable
    			{
					displayName = "Connect Data Cable";
					condition = "([player] call Cyber_fnc_haveCable) && (count (_target getVariable [""ecf_cyber_cableConnections"", []]) < 1)";
					distance = 4;
					exceptions[] = {};
					statement = "[player, _target] call Cyber_fnc_connectCable";
    			};
    			class DisconnectDataCable
    			{
					displayName = "Disconnect Data Cable";
					condition = "count (_target getVariable [""ecf_cyber_cableConnections"", []]) > 0";
					distance = 4;
					exceptions[] = {};
					statement = "[""ecf_cyber_event_cabledisconnect"", [_target]] call CBA_fnc_localEvent;";
    			};
			};
		};
	};
};