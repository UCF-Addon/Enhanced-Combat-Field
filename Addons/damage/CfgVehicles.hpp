class CfgVehicles
{
	// Fuel Station
	class House_Small_F;

	class Land_FuelStation_Feed_F: House_Small_F
	{
		GMVAR(explosivType) = EXP_PETROL;
		GMVAR(explosivZone)[] = {};
	};
};