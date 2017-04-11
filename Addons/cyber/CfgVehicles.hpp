class EventHandlers;
class CBA_Extended_EventHandlers;

class CfgVehicles
{
	class Land_DataTerminal_01_F;
	class ECF_Land_DataTerminal_01_F: Land_DataTerminal_01_F
	{
		_generalMacro = "ECF_Land_DataTerminal_01_F";
		//hiddenSelectionsTextures[] = {};

		powerOn = "[_this select 0, ""orange"", ""orange"", ""orange""] call BIS_fnc_DataTerminalColor; (_this select 0) setVariable [""ECF_Cyber_isActiv"", true, true]";
		powerOff = "[_this select 0, ""red"", ""red"", ""red""] call BIS_fnc_DataTerminalColor; (_this select 0) setVariable [""ECF_Cyber_isActiv"", false, true]";

		class EventHandlers
		{
			init = "[_this select 0, ""red"", ""red"", ""red""] call BIS_fnc_DataTerminalColor;";
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
		};

		class ACE_Actions
		{
			class Start
			{
				displayName = "Start Datacenter";
    			condition = QUOTE(_target getVariable [QUOTE(QGMVAR(isActiv)), false]);
    			exceptions[] = {};
    			statement = QUOTE([_target, -1] call DFUNC(openClient));
    			position = "[0,0,0.2]";
    			//icon = "";
			};
		};
	};
};