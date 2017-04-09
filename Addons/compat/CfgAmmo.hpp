class CfgAmmo {
  class rhsusf_ammo_127x99_mk211;
  class rhsusf_ammo_127x99_M33_Ball;

  class ECF_ammo_127x99_mk211_apds: rhsusf_ammo_127x99_mk211 {
    hit = 60;
    caliber = 3.8;
  };
  class ECF_ammo_127x99_mk211: rhsusf_ammo_127x99_mk211 {
    hit = 35;
    caliber = 2.6;
  };
  class ECF_ammo_127x99_M33_Ball_apds: rhsusf_ammo_127x99_M33_Ball {
    hit = 60;
    caliber = 3.8;
  };
  class ECF_ammo_127x99_M33_Ball: rhsusf_ammo_127x99_M33_Ball {
    hit = 35;
    caliber = 2.6;
  };

  class rhs_ammo_12g_00buckshot;
  class rhs_ammo_12g_slug;
  class rhs_ammo_12g_HE;
  class rhs_ammo_12g_FRAG;

  class ECF_ammo_12g_00buckshot: rhs_ammo_12g_00buckshot
  {
	hit = 12.3;
	caliber = 0.24;
  };
  class ECF_ammo_12g_slug: rhs_ammo_12g_slug
  {
	hit = 34.51;
	caliber = 0.3048;
  };
  class ECF_ammo_12g_HE: rhs_ammo_12g_HE
  {
	hit = 2.7;
	indirectHit = 1.6;
	indirectHitRange = 0.986;
	caliber = 0.1;
  };
  class ECF_ammo_12g_FRAG: rhs_ammo_12g_FRAG
  {
	hit = 8.7;
	indirectHit = 1.6;
	indirectHitRange = 1.972;
	caliber = 0.2;
  };
};