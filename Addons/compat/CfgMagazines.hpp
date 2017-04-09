class CfgMagazines {
  // M107 / M82A1 Barrett
  class rhsusf_mag_10Rnd_STD_50BMG_M33;
  class rhsusf_mag_10Rnd_STD_50BMG_mk211;

  class ECF_ammo_10Rnd_STD_50BMG_M33: rhsusf_mag_10Rnd_STD_50BMG_M33 {
    ammo = QUOTE(ECF_ammo_127x99_M33_Ball);
    author = AUTHORS;
    descriptionShort = QUOTE(10RD .50BMG M33 Barrett STD Box);
    displayName = QUOTE(ECF 10RD .50BMG M33 STD Box);
  };

  class ECF_ammo_10Rnd_STD_50BMG_M33_apds: rhsusf_mag_10Rnd_STD_50BMG_M33 {
    ammo = QUOTE(ECF_ammo_127x99_M33_Ball_apds);
    author = AUTHORS;
    descriptionShort = QUOTE(10RD .50BMG APDS M33 Barrett STD Box);
    displayName = QUOTE(ECF 10RD .50BMG APDS M33 STD Box);
  };

  class ECF_ammo_10Rnd_STD_50BMG_mk211: rhsusf_mag_10Rnd_STD_50BMG_mk211 {
    ammo = QUOTE(ECF_ammo_127x99_mk211);
    author = AUTHORS;
    descriptionShort = QUOTE(10RD .50BMG Mk211 Barrett STD Box);
    displayName = QUOTE(ECF 10RD .50BMG Mk211 STD Box);
  };

  class ECF_ammo_10Rnd_STD_50BMG_mk211_apds: rhsusf_mag_10Rnd_STD_50BMG_mk211 {
    ammo = QUOTE(ECF_ammo_127x99_mk211);
    author = AUTHORS;
    descriptionShort = QUOTE(10RD .50BMG APDS Mk211 Barrett STD Box);
    displayName = QUOTE(ECF 10RD .50BMG APDS Mk211 STD Box);
  };

  // M570
  class rhsusf_5Rnd_00Buck;
  class rhsusf_5Rnd_Slug;
  class rhsusf_5Rnd_HE;
  class rhsusf_5Rnd_FRAG;

  class ECF_ammo_5Rnd_00Buck: rhsusf_5Rnd_00Buck
  {
  	ammo = QUOTE(ECF_ammo_12g_00buckshot);
  	author = AUTHORS;
  	descriptionShort = QUOTE(5RND 12G 00Buckshot);
  	displayName = QUOTE(5RND 12G 00Buckshot);
  };

  class ECF_ammo_5Rnd_Slug: rhsusf_5Rnd_Slug
  {
  	ammo = QUOTE(ECF_ammo_12g_slug);
  	author = AUTHORS;
  	descriptionShort = QUOTE(5RND 12G Slug);
  	displayName = QUOTE(5RND 12G Slug);
  };

  class ECF_ammo_5Rnd_HE: rhsusf_5Rnd_HE
  {
  	ammo = QUOTE(ECF_ammo_12g_HE);
  	author = AUTHORS;
  	descriptionShort = QUOTE(5RND 12G HE);
  	displayName = QUOTE(5RND 12G HE);
  };

  class ECF_ammo_5Rnd_FRAG: rhsusf_5Rnd_FRAG
  {
  	ammo = QUOTE(ECF_ammo_12g_FRAG);
  	author = AUTHORS;
  	descriptionShort = QUOTE(5RND 12G FRAG);
  	displayName = QUOTE(5RND 12G FRAG);
  };

};