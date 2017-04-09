class ECF_MODULES_M_F: Module_F
{
    scope = 0;
    author = AUTHORS;

    category = "ECF_Module";

    isGlobal = 1;
};

#include "CfgModulesIntel.hpp"
#include "CfgModulesPopulation.hpp"

class ECF_MODULES_M_DB: ECF_MODULES_M_F
{
    scope = 2;
    displayName = "$STR_Module_DB";

    function = QUOTE(GVAR(useDBI) = (param[0,objNull,[objNull]] getVariable DQUOTE(UseDBI)));

    class Arguments
    {
        class UseDBI
        {
            displayName = "$STR_Module_DB_USE";
            description = "$STR_Module_DB_USE_D";

            class values
            {
                class option_1
                {
                    name = "$STR_Module_DB_USE_0";
                    value = 0;
                    default = 0;
                };
                class option_2
                {
                    name = "$STR_Module_DB_USE_1";
                    value = 1;
                };
                class option_3
                {
                    name = "$STR_Module_DB_USE_2";
                    value = 2;
                };
            };
        };

        class ItemSlots
        {
            displayName = "$STR_Module_DB_IS";
            description = "$STR_Module_DB_IS_D";
            typeName = "STRING";

            class values
            {
                class option_1
                {
                    name = "$STR_Module_DB_IS_Watch";
                    value = "";
                    default = "";
                };
                class option_2
                {
                    name = "$STR_Module_DB_IS_Altimeter";
                    value = "";
                };
            };
        };
    };
};

class ECF_MODULES_M_HUD: ECF_MODULES_M_F
{
    scope = 2;
    displayName = "$STR_Module_HUD";

    function = QUOTE(GVAR(showCityName) = (param[0,objNull,[objNull]] getVariable DQUOTE(ShowCityName)));

    class Arguments
    {
        class ShowCityName
        {
            displayName = "$STR_Module_HUD_SCN";
            description = "$STR_Module_HUD_SCN_D";
            typeName = "BOOL";

            class values
            {
                class option_1
                {
                    name = "$STR_Common_Y";
                    value = 1;
                    default = 1;
                };
                class option_2
                {
                    name = "$STR_Common_N";
                    value = 0;
                };
            };
        };
    };
};