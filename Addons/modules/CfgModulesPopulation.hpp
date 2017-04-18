class ECF_Module_Population_F: ECF_MODULES_M_F
{
	class Edit;
	class ArgumentsBaseUnits
	{
		class Units;
	};
	class ModuleDescription
	{
		class AnyVehicle;
	};
};

class ECF_Population_Traffic_Settings: ECF_Module_Population_F
{
	_generalMacro = "ECF_Population_Traffic_Settings";
	scope = 2;
	displayName = "ECF Population Settings";
	function = QFUNC(modulePopulationSettings);

	class Arguments
	{
		class CivilianActiv
		{
			displayName = "Civilian Activ";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = _false;
					default = _false;
				};
				class Enabled
				{
					name = "$STR_DISP_OPT_ENABLED";
					value = _true;
				};
			};
		};
		class FurnitureActiv
		{
			displayName = "Furniture Activ";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = _false;
					default = _false;
				};
				class Enabled
				{
					name = "$STR_DISP_OPT_ENABLED";
					value = _true;
				};
			};
		};
		class TrafficActiv
		{
			displayName = "Traffic Activ";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = _false;
				};
				class Enabled
				{
					name = "$STR_DISP_OPT_ENABLED"
					value = _true;
					default = _true;
				};
			};
		};
		class CarActiv
		{
			displayName = "Car Traffic Activ";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = _false;
				};
				class Enabled
				{
					name = "$STR_DISP_OPT_ENABLED"
					value = _true;
					default = _true;
				};
			};
		};
		class HeliActiv
		{
			displayName = "Helicopter Traffic Activ";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = _false;
					default = _false;
				};
				// class Enabled
				// {
				// 	name = "$STR_DISP_OPT_ENABLED"
				// 	value = _true;
				// 	default = _true;
				// };
			};
		};
		class BoatActiv
		{
			displayName = "Boat Traffic Activ";
			description = "";
			typeName = "NUMBER";
			class values
			{
				class Disabled
				{
					name = "$STR_DISP_OPT_DISABLED";
					value = _false;
					default = _false;
				};
				// class Enabled
				// {
				// 	name = "$STR_DISP_OPT_ENABLED"
				// 	value = _true;
				// 	default = _true;
				// };
			};
		};
	};
};

class ECF_Population_Traffic_Settings_Adv: ECF_Module_Population_F
{
	_generalMacro = "ECF_Population_Traffic_Settings_Adv";
	scope = 2;
	displayName = "ECF Population Settings (Advanced)";
	function = QFUNC(modulePopulationSettingsAdv);

	class Arguments
	{
		//class Edit;

		class BlankCar
		{
			displayName = "";
			typeName = "STRING";
			class values
			{
				class Default
				{
					name = "-----Car Traffic Settings-----";
					value = "";
					default = "-----Car Traffic Settings-----";
				};
			};
		};
		class CarTriggerSpawnTimeout: Edit
		{
			displayName = "Trigger Spawn Timeout";
			description = "";
			defaultValue = "200";
		};
		class CarSpawnMinRadius: Edit
		{
			displayName = "Spawn Min Radius";
			description = "";
			defaultValue = "250";
		};
		class CarSpawnMaxRadius: Edit
		{
			displayName = "Spawn Max Radius";
			description = "";
			defaultValue = "580";
		};
		class CarDespawnRadius: Edit
		{
			displayName = "Despawn Radius";
			description = "";
			defaultValue = "750";
		};
		class CarWpAmount: Edit
		{
			displayName = "Waypoint Amount";
			description = "";
			defaultValue = "12";
		};
		class CarWpMinRadius: Edit
		{
			displayName = "Waypoint Min Distance";
			description = "";
			defaultValue = "650";
		};
		class CarWpMaxRadius: Edit
		{
			displayName = "Waypoint Max Distance";
			description = "";
			defaultValue = "75";
		};

		class HeliCar
		{
			displayName = "";
			typeName = "STRING";
			class values
			{
				class Default
				{
					name = "-----Heli Traffic Settings-----";
					value = "";
					default = "-----Heli Traffic Settings-----";
				};
			};
		};


		class BoatCar
		{
			displayName = "";
			typeName = "STRING";
			class values
			{
				class Default
				{
					name = "-----Boat Traffic Settings-----";
					value = "";
					default = "-----Boat Traffic Settings-----";
				};
			};
		};
	};
};