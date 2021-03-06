class Extended_PreStart_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_Hit_EventHandlers
{
	class All
	{
		ADDON = QUOTE(_this call DFUNC(handleHit));
	};
};

class Extended_HitPart_EventHandlers
{
	class All
	{
		ADDON = QUOTE(_this call DFUNC(handleHitPart));
	};
};