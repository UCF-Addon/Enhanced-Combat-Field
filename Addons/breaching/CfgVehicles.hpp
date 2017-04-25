class CfgVehicles
{
	#include "CfgModules.hpp"

    // User Interface
    class Man;

    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class placeCharge
            {
                displayName = QUOTE(Place Charge);
                condition = QUOTE([] call DFUNC(canBreachCharge));
                exceptions[] = {};
                statement = QUOTE([] call DFUNC(setupExplosiv));
                icon = QPATHOF(data\ui\breaching_icon_ca.paa);
            };
        };
    };

    // Explosiv
    class ACE_Explosives_Place_DemoCharge;

    class ECF_EXPLOSIV_E_VEHICLE_F: ACE_Explosives_Place_DemoCharge
    {
        scope = 0;
        dlc = "ECF_Icon";
    };

    class ECF_EXPLOSIV_E_VEHICLE_S: ECF_EXPLOSIV_E_VEHICLE_F
    {
        displayName = "Breaching Charge";
        scope = 2;
        vehicleClass = "Magazines";
    };
};