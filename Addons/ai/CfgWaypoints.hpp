class CfgWaypoints
{
    class ADDON
    {
        displayName = "ECF";

        class ParadropInfantry
        {
            displayName = "Paradrop Infantry";//"$STR_WAY_PARADROP_INF"; // TODO: add to stringtable
            displayNameDebug = "Paradrop Infantry";
            file = QPATHOF(fnc\fn_wayParadropInf.sqf);
            icon = QPATHOF(ui\paradrop_inf.paa);
        };

        class ParadropVehicle
        {
            displayName = "Paradrop Vehicle";//"$STR_WAY_PARADROP_VEH"; // TODO: add to stringtable
            displayNameDebug = "Paradrop Vehicle";
            file = QPATHOF(fnc\fn_wayParadropVeh.sqf);
            icon = QPATHOF(ui\paradrop_veh.paa);
        };
    };
};