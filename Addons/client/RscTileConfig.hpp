#include "rsc_macro.h"

class RscPicture;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscText;

class ECF_Client_Menu
{
	idd = -1;
	movingEnable = 0;
	enableSimulation = false;

	objects[] = {};

	duration = 99999;
	name = "ECF Client Menu";
	onLoad = "";

	class controlsBackground
	{
		class menu_background: RscText
		{
			idc = 1000;
			x = 0.293749 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.902 * safezoneH;
			colorText[] = {-1,-1,-1,0};
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {-1,-1,-1,0};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Julius, v1.063, #Jyqino)
		////////////////////////////////////////////////////////
		class menu_list
		{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = CT_LISTBOX; // Control identification (without it, the control won't be displayed)
			type = CT_LISTBOX; // Type is 5
			style = ST_LEFT + LB_TEXTURES; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			//idc = 1500;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.55 * safezoneH;

			colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
			colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
			colorSelectBackground2[] = {0,0,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)

			font = "PuristaMedium";
			sizeEx = 0.04; // Text size
			shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
			colorText[] = {1,1,1,1}; // Text and frame color
			colorDisabled[] = {1,1,1,0.5}; // Disabled text color
			colorSelect[] = {1,1,1,1}; // Text selection color
			colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
			colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

			pictureColor[] = {1,1,1,1}; // Picture color
			pictureColorSelect[] = {1,1,1,1}; // Selected picture color
			pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

			tooltip = "CT_LISTBOX"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

			rowHeight = 0.056; // Row height
			itemSpacing = 0; // Height of empty space between items
			maxHistoryDelay = 1; // Time since last keyboard type search to reset it
			canDrag = 1; // 1 (true) to allow item dragging

			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class ListScrollBar //In older games this class is "ScrollBar"
			{
				width = 0; // width of ListScrollBar
				height = 0; // height of ListScrollBar
				scrollSpeed = 0.01; // scroll speed of ListScrollBar

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};

			onLBSelChanged = "player setVariable ['_client_ui_role', (_this select 1), false]; false";
		};
		class menu_picture: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class menu_submit: RscButtonMenuOK
		{
			idc = 1800;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;

			action = QUOTE(call DFUNC(updateRole));
		};
		class menu_cancel: RscButtonMenuCancel
		{
			idc = 1801;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;

			action = "closeDialog 0";
		};
		class menu_title: RscText
		{
			idc = 1500;
			text = "ECF Database Arsenal"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.12;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};