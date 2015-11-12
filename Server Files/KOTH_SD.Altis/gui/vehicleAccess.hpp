class vehicleAccess
{
	idd = -1;
	duration = 3;
    movingEnable = 0;
    fadeIn = 0;
    fadeOut = 0;
	class controls
	{
		class MainBackground: sd_RscText
		{
			idc = -1;
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.375 * safezoneW;
			h = 0.16 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TextNoAccess: sd_RscText
		{
			idc = -1;
			text = "$STR_Script_TextNoAccess";
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.375 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class TitleHeader: sd_RscText
		{
			idc = -1;
			text = "$STR_Script_noAccessTitle";
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.375 * safezoneW;
			h = 0.06 * safezoneH;
			colorText[] = {0.608,0.129,0.129,1};
			sizeEx = 2 * GUI_GRID_H;
		};
	};
};