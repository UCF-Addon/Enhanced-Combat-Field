class CfgVehicles
{
	// User Interface
	class ThingX;
	class ReammoBox_F: ThingX
    {
        class ACE_Actions
        {
        	class LoadObject
        	{
        		displayName = QUOTE(Load Object);
        		condition = QUOTE((count ([_target] call DFUNC(getSuitableZones))) > 0);
        		statement = QUOTE([_target, t1] call DFUNC(doLoadObject));
        	};
        };
    };


	class Truck_01_base_F;
	class B_Truck_01_transport_F: Truck_01_base_F
	{
		class ECF_logistic_Container
		{
			DOUBLE(logistic,maxLoad) = 1500;
			DOUBLE(logistic,area)[] = {0,-2.55,0.4};
			DOUBLE(logistic,size)[] = {0.85,2.45,2.3}; // Half Weidth / Half Length / Full Height

			DOUBLE(logistic,zones)[] = {"LoadingZone_1"};

			class LoadingZone_1
			{
				pos[] = {0,-5.6,-2.3};
				size[] = {0.95,0.5,2.8}; // Half Weidth / Half Length / Full Height
			};
		};
	};
};