class CfgVehicles {
  class logic;
  class Module_F: logic {
    class ArgumentsBaseUnits {
    };
  };
  class ECF_Module_Basic;
  class ECF_cityNameLocationsModule: ECF_Module_Basic {
    scope = 2;
    displayName ="$STR_cityLocationName";
    function = "showCityName = (param [0, objNull, [objNull]] getVariable ""ShowCityName"")";
    class Arguments {
      class ShowCityName {
        displayName = "$STR_cityName";
        description = "$STR_citName_des";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "$STR_ja";
            value = 1;
            default = 1;
          };
          class No {
            name = "$STR_nein";
            value = 0;
          };
        };
      };
    };
  };
};
