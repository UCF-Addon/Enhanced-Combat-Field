class RscControlsGroupNoHScrollbars;
class RscPicture;
class RscText;
class RscHTML;
class RscButtonMenu;
class RscStandardDisplay;

class RscDisplayMain: RscStandardDisplay
{
    class Spotlight
    {
        class ECF
        {
            text = "UNITED-CYBER-FORCES"; // Text displayed on the square button, converted to upper-case
            textIsQuote = 0; // 1 to add quotation marks around the text
            picture = QPATHOF(gui\ecf_SpotLight_ca.paa); // Square picture, ideally 512x512
            video = "\a3\Ui_f\Video\spotlight_1_Apex.ogv"; // Video played on mouse hover
            action = ""; // Code called upon clicking, passed arguments are [<button:Control>]
            actionText = "ECF Website"; // Text displayed in top left corner of on-hover white frame
            condition = "isClass (configFile >> 'CfgPatches' >> 'ECF_main')";
        };
    };
    class controls
    {
        class ECF_news: RscControlsGroupNoHScrollbars
        {
            idc = 90090;
            x = "safezoneX + safezoneW - 10 * (pixelW * pixelGrid * 2) - (4 * pixelH)";
            y = "safezoneY + safezoneH - (3 * 2 + 3) * (pixelH * pixelGrid * 2) - 3 * (4 * pixelH)";
            w = "10 * (pixelW * pixelGrid * 2)";
            h = "2 * (pixelH * pixelGrid * 2)";

            class Controls
            {
                class Background: RscPicture
                {
                    idc = 90091;
                    text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradientMods_ca.paa";
                    colorText[] = {0,0,0,0.75};
                    x = "(10 - 4 * 2) * (pixelW * pixelGrid * 2)";
                    y = 0;
                    w = "4 * 2 * (pixelW * pixelGrid * 2)";
                    h = "2 * (pixelH * pixelGrid * 2)";
                    angle = 180;
                };

                class BackgroundIcon: RscPicture
                {
                    access = 0;
                    colorBackground[] = {0,0,0,0};
                    colorText[] = {0,0,0,0.75};
                    deletable = 0;
                    fade = 0;
                    font = "TahomaB";
                    lineSpacing = 0;
                    shadow = 0;
                    style = 48;
                    tooltipColorBox[] = {1,1,1,1};
                    tooltipColorShade[]= {0,0,0,0.65};
                    tooltipColorText[] = {1,1,1,1};
                    type = 0;
                    idc = 90092;
                    text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\backgroundModsIcon_ca.paa";
                    x = "(10 - 2 * 2) * (pixelW * pixelGrid * 2)";
                    y = 0;
                    w = "2 * 2 * (pixelW * pixelGrid * 2)";
                    h = "2 * (pixelH * pixelGrid * 2)";
                    angle = 180;
                };

                class Icon: RscPicture
                {
                    idc = 90093;
                    text = QPATHOF(gui\ecf_MenuIcon_ca.paa);
                    colorText[] = {1,1,1,0.5};
                    x = "(10 - 2) * (pixelW * pixelGrid * 2)";
                    y = 0;
                    w = "2 * (pixelW * pixelGrid * 2)";
                    h = "2 * (pixelH * pixelGrid * 2)";
                };

                class CurrentVersionInfo: RscText
                {
                    idc = 90094;
                    style = 1;
                    text = "";
                    sizeEx = "(pixelH * pixelGrid * 1.5)";
                    font = "RobotoCondensedLight";
                    shadow = 1;
                    colorBackground[] = {0,0,0,0};
                    x = 0;
                    y = 0;
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    h = "2 * (pixelH * pixelGrid * 1)";
                    onLoad = "(_this select 0) ctrlenable false;";
                };
                class HTTPVersionInfo: RscHTML
                {
                    idc = 90095;
                    shadow = 0;
                    class H1
                    {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                        font = "RobotoCondensedLight";
                        fontBold = "RobotoCondensedLight";
                        align = "right";
                    };
                    class H2: H1
                    {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                    };
                    class P: H1
                    {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                    };
                    x = 0;
                    y = "2 * (pixelH * pixelGrid * 1)";
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    h = "2 * (pixelH * pixelGrid * 1)";
                    onLoad = "(_this select 0) ctrlenable false;";
                };

                class Button: RscButtonMenu
                {
                    idc = 90096;
                    colorBackground[] = {0,0,0,0};
                    colorBackgroundFocused[] = {0,0,0,0};
                    colorBackground2[] = {0,0,0,0};
                    x = 0;
                    y = 0;
                    w = "10 * (pixelW * pixelGrid * 2)";
                    h = "2 * (pixelH * pixelGrid * 2)";

                    tooltip = "Mehr Informationen unter:";
                    url = "https://ucyf.neogc.de/";
                };

                class News: RscText
                {
                    access = 0;
                    colorBackground[] = {0,0,0,0};
                    colorShadow[] = {0,0,0,0,,5};
                    colorText[] = {1,1,1,1};
                    deletable = 0;
                    fadte = 0;
                    fixedWith = 0;
                    font = "RobotoCondensedLight";
                    h = "2 *(pixelH * pixelGrid *2)";
                    idc = -1;
                    linespacing = 1;
                    onLoad = "(_this select 0) ctrlenable false;";
                    shadow = 1;
                    sizeEx = "(pixelH * pixelGrid *2)";
                    style = 1;
                    text = "ECF";
                    tooltipColorBox[] = {1,1,1,1};
                    tooltipColoShade[] = { 0,0,0,0.65};
                    tooltipColorText[]= {1,1,1,1};
                    type = 0;
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    x = 0;
                    y = 0;
                };
            };
        };
    };
};
