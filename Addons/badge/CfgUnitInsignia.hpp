#define INSIGN(name, tex) \
class name { \
displayName = QUOTE(DOUBLE($STR_INSIGNIA,name)); \
author = "ECF"; \
texture = QPATHOF(data\tex); \
dlc = "ECF_Icon"; \
} \

class CfgUnitInsignia
{
  INSIGN(Private,private.paa)
  INSIGN(Corporal,corporal.paa);
  INSIGN(Sergeant,sergeant.paa);
  INSIGN(Master_Sergeant,master_sergeant.paa);
  INSIGN(Master_Chief,master_chief.paa);
  INSIGN(War_Chief,war_chief.paa);

  INSIGN(AT_Sergeant,antitank\sergeant.paa);
  INSIGN(AT_Master_Sergeant,antitank\master_sergeant.paa);
  INSIGN(AT_Master_Chief,antitank\master_chief.paa);
  INSIGN(AT_War_Chief,antitank\war_chief.paa);

  INSIGN(EOD_Sergeant,explosiv\sergeant.paa);
  INSIGN(EOD_Master_Sergeant,explosiv\master_sergeant.paa);
  INSIGN(EOD_Master_Chief,explosiv\master_chief.paa);
  INSIGN(EOD_War_Chief,explosiv\war_chief.paa);

  INSIGN(AIR_Sergeant,flight\sergeant.paa);
  INSIGN(AIR_Master_Sergeant,flight\master_sergeant.paa);
  INSIGN(AIR_Master_Chief,flight\master_chief.paa);
  INSIGN(AIR_War_Chief,flight\war_chief.paa);

  INSIGN(GL_Sergeant,grenadier\sergeant.paa);
  INSIGN(GL_Master_Sergeant,grenadier\master_sergeant.paa);
  INSIGN(GL_Master_Chief,grenadier\master_chief.paa);
  INSIGN(GL_War_Chief,grenadier\war_chief.paa);

  INSIGN(MG_Sergeant,machine\sergeant.paa);
  INSIGN(MG_Master_Sergeant,machine\master_sergeant.paa);
  INSIGN(MG_Master_Chief,machine\master_chief.paa);
  INSIGN(MG_War_Chief,machine\war_chief.paa);

  INSIGN(ME_Sergeant,medical\sergeant.paa);
  INSIGN(ME_Master_Sergeant,medical\master_sergeant.paa);
  INSIGN(ME_Master_Chief,medical\master_chief.paa);
  INSIGN(ME_War_Chief,medical\war_chief.paa);

  INSIGN(SN_Sergeant,sniper\sergeant.paa);
  INSIGN(SN_Master_Sergeant,sniper\master_sergeant.paa);
  INSIGN(SN_Master_Chief,sniper\master_chief.paa);
  INSIGN(SN_War_Chief,sniper\war_chief.paa);
};