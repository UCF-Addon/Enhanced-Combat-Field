class CfgMagazines
{
    class DemoCharge_Remote_Mag;

    class ECF_EXPLOSIV_E_CHARGE_F: DemoCharge_Remote_Mag
    {
        author = AUTHORS;
        scope = 0;
        dlc = "ECF_icon";
    };

    class ECF_EXPLOSIV_E_CHARGE_S: ECF_EXPLOSIV_E_CHARGE_F
    {
        scope = 2;
        displayName = "Breaching Charge";
        ammo = QUOTE(DOUBLE(ADDON,E_AMMO_S));
        mass = 15;
    };
};