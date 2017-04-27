class ECF_MODULES_M_F;

class ECF_MODULES_M_BREACHING_SETSTATE: ECF_MODULES_M_F
{
	scope = 2;
	displayName = "Set Breacher-State";
	category = "ECF_Module_Breaching";

	function = QFUNC(moduleSetState);

	class ArgumentsBaseUnits
	{
		class Units;
	};

	class ModuleDescription
	{
		class AnyBrain;
	};
};

class ECF_MODULES_M_BREACKING_LOCK_AREA: ECF_MODULES_M_F
{
	scope = 2;
	displayName = "Lock Area";
	category = "ECF_Module_Breaching";

	function = QFUNC(moduleLockArea);

	class Arguments
	{
		class Range
		{
			displayName = "Range";
			description = "Range around the module to lock doors";
			defaultValue = "250";
		};

		class HousePercentage
		{
			displayName = "House Percentage";
			description = "Percentage of building in area to lock doors";
			defaultValue = "0.65";
		};

		class DoorPercentage
		{
			displayName = "Door Percentage";
			description = "Percentage of door per house to lock; -1 is a automatic calculated percentage";
			defaultValue = "-1";
		};
	};
};

class ECF_MODULES_M_BREACHING_LOCK_NEAREST: ECF_MODULES_M_F
{
	scope = 2;
	displayName = "Lock nearest Door";
	category = "ECF_Module_Breaching";

	function = QFUNC(moduleLockNearest);
};