class CfgWeapons {
  class Binocular;

  class NVGoggles: Binocular
  {
	ECF_NVG_wetDist[] = {2, 0.056,0.056, 0,0,0,0, 0,0,0.2,0.02, 0,0, 0,0};
	ECF_NVG_filmGrain[] = {0.02, 0.05, 1.2, 1.44,0.67, _true};
  };

  class NVGoggles_OPFOR: NVGoggles {};
  class NVGoggles_INDEP: NVGoggles {};

  class ACE_NVG_Gen1: NVGoggles_OPFOR
  {
	ECF_NVG_wetDist[] = {10, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
	ECF_NVG_filmGrain[] = {0.045, 0, 2.2, 2.77,1.96, _true};
  };
  class ECF_NVG_Gen1_Green: NVGoggles_INDEP {
    author = "ECF";
    mod = "ECF_icon";
    displayName = "$STR_Gen1_Green";
    ACE_NightVision_grain = 2.25;
    ACE_NightVision_blur = 0.22;
    ACE_NightVision_radBlur = 0.004;

    ECF_NVG_wetDist[] = {10, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.045, 0, 2.2, 2.77,1.96, _true};
  };
  class ECF_NVG_Gen1_Brown: NVGoggles {
    author = "ECF";
    mod = "ECF_icon";
    displayName = "$STR_Gen1_Brown";
    ACE_NightVision_grain = 2.25;
    ACE_NightVision_blur = 0.22;
    ACE_NightVision_radBlur = 0.004;

    ECF_NVG_wetDist[] = {10, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.045, 0, 2.2, 2.77,1.96, _true};
  };

  class ACE_NVG_Gen2: NVGoggles_INDEP
  {
	ECF_NVG_wetDist[] = {6, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.02, 0, 1.8, 2.44,1.78, _true};
  };
  class ECF_NVG_Gen2_Black: NVGoggles_OPFOR {
    author = "ECF";
    mod = "ECF_icon";
    displayName = "$STR_Gen2_Black";
    ACE_NightVision_grain = 1.5;
    ACE_NightVision_blur = 0.11;
    ACE_NightVision_radBlur = 0.002;

	ECF_NVG_wetDist[] = {6, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.02, 0, 1.8, 2.44,1.78, _true};
  };
  class ECF_NVG_Gen2_Brown: NVGoggles {
    author = "ECF";
    mod = "ECF_icon";
    displayName = "$STR_Gen2_Brown";
    ACE_NightVision_grain = 1.5;
    ACE_NightVision_blur = 0.11;
    ACE_NightVision_radBlur = 0.002;

	ECF_NVG_wetDist[] = {6, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.02, 0, 1.8, 2.44,1.78, _true};
  };

  class ACE_NVG_Wide: NVGoggles
  {
	ECF_NVG_wetDist[] = {7, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.03, 0, 1.9, 2.44,1.78, _true};
  };
  class ECF_NVG_Wide_Black: NVGoggles_OPFOR {
    author = "ECF";
    mod = "ECF_icon";
    displayName = "$STR_Wide_Black";
    modelOptics = "\z\ace\addons\nightvision\models\ace_nvg_wide_optics.p3d";
    ACE_NightVision_grain = 0.75;
    ACE_NightVision_blur = 0.055;
    ACE_NightVision_radBlur = 0.001;

	ECF_NVG_wetDist[] = {7, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.03, 0, 1.9, 2.44,1.78, _true};
  };
  class ECF_NVG_Wide_Green: NVGoggles_INDEP {
    author = "ECF_icon";
    mod = "ECF_icon";
    displayName = "$STR_Wide_Green";
    modelOptics = "\z\ace\addons\nightvision\models\ace_nvg_wide_optics.p3d";
    ACE_NightVision_grain = 0.75;
    ACE_NightVision_blur = 0.055;
    ACE_NightVision_radBlur = 0.001;

	ECF_NVG_wetDist[] = {7, 0.056,0.056, 0,0,0,0, 0,0,0.1,0, 0,0, 0,0};
    ECF_NVG_filmGrain[] = {0.03, 0, 1.9, 2.44,1.78, _true};
  };
};
