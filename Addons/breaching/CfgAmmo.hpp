class CfgAmmo
{
    class DemoCharge_Remote_Ammo;

    class ECF_EXPLOSIV_E_AMMO_F: DemoCharge_Remote_Ammo
    {
        scope = 0;
    };

    class ECF_EXPLOSIV_E_AMMO_S: ECF_EXPLOSIV_E_AMMO_F
    {
        scope = 2;
        ace_explosives_Explosive = "ECF_EXPLOSIV_E_AMMO_S_Scripted";
        ace_explosives_magazine = "ECF_EXPLOSIV_E_CHARGE_S";

		explosive = 0;
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
    };

    class DemoCharge_Remote_Ammo_Scripted;
    class ECF_EXPLOSIV_E_AMMO_F_Scripted: DemoCharge_Remote_Ammo_Scripted
    {
        scope = 0;
    };

    class ECF_EXPLOSIV_E_AMMO_S_Scripted: ECF_EXPLOSIV_E_AMMO_F_Scripted
    {
        scope = 2;
        ace_explosives_Explosive = "ECF_EXPLOSIV_E_AMMO_S_Scripted";
        ace_explosives_magazine = "ECF_EXPLOSIV_E_CHARGE_S";

        soundActivation[] = {"A3\Sounds_F\weapons\mines\electron_activate_mine_1", 0.562341, 1, 50};
        soundDeactivaction[] = {"A3\Sounds_F\weapons\mines\deactivate_mine_3a", 0.562341, 1, 50};
        soundEngine[] = {"", 0, 1};
        soundFakeFall[] = {"soundFall", 1};
        soundFall[] = {"", 1, 1};
        soundFly[] = {"", 0, 1};
        soundHit[] = {"A3\Sounds_F\weapons\mines\mine_debris_5", 3.16228, 1, 1500};
        soundImpact[] = {"", 1, 1};
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\electron_trigger_1", 0.562341, 1, 50};
        supersonicCrackFar[] = {"", 1, 1};
        supersonicCrackNear[] = {"", 1, 1};

        suppressionRadiusBulletClose = -1;
        suppressionRadiusHit = -1;
        thrust = 210;
        thrustTime = 0;

        explosive = 1;
        hit = 1E-7;
        indirectHit = 0;
        indirectHitRange = 0;
    };
};