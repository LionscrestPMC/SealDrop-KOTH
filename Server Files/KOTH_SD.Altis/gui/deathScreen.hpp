class deathScreen
{
	idd = 7500;
    movingEnable = 0;
    fadeIn = 0;
    duration = 10e10;
    fadeOut = 0;
	name = "deathScreen";
	onLoad = "uiNamespace setVariable ['deathScreen',_this select 0]";
	objects[] = {};

	class controlsBackground
	{
		class PictureMainBackground: sd_RscPicture
		{
			idc = -1;
			text = "texture\deathScreen.jpg";
			x = 2.45781e-008 * safezoneW + safezoneX;
			y = 0.14 * safezoneH + safezoneY;
			w = 0.99937 * safezoneW;
			h = 0.720426 * safezoneH;
		};
		class KOTHLOGO: sd_RscPicture
		{
			idc = -1;
			text = "texture\logo.paa";
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.375 * safezoneW;
			h = 0.32 * safezoneH;
		};
	};
	class controls
	{
		class BottomSide: sd_RscText
		{
			idc = 7501;
			text = "";
			x = 2.45781e-008 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;
			w = 0.99964 * safezoneW;
			h = 0.140029 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 2 * GUI_GRID_H;
		};
		class UpperSide: sd_RscText
		{
			idc = 7502;
			text = "";
			x = -2.45936e-008 * safezoneW + safezoneX;
			y = -1.6385e-008 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.14 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 2 * GUI_GRID_H;
		};
	};
};