class CfgWeapons {
  class Gm6_base_F;

  class rhs_weap_M107_Base_F: GM6_base_F {
    magazines[] = {
      "ECF_ammo_10Rnd_STD_50BMG_M33",
      "ECF_ammo_10Rnd_STD_50BMG_M33_apds",
      "ECF_ammo_10Rnd_STD_50BMG_mk211",
      "ECF_ammo_10Rnd_STD_50BMG_mk211_apds",
      "rhsusf_mag_10Rnd_STD_50BMG_M33",
      "rhsusf_mag_10Rnd_STD_50BMG_mk211"
    };
    class WeaponSlotsInfo {
      mass = 240;
    };
  };

  class Rifle_Base_F;

  class rhs_weap_M590_5RD: Rifle_Base_F
  {
	magazines[] =
	{
		"rhsusf_5Rnd_00Buck",
		"rhsusf_5Rnd_Slug",
		"rhsusf_5Rnd_HE",
		"rhsusf_5Rnd_FRAG",
		"ECF_ammo_5Rnd_00Buck",
		"ECF_ammo_5Rnd_Slug",
		"ECF_ammo_5Rnd_HE",
		"ECF_ammo_5Rnd_FRAG"
	};
  };
};
