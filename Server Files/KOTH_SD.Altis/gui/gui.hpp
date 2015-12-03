/*
	File: gui.hpp
	Author: DeadP4xel
*/
class playerGUI
{
    idd = 38500;
    movingEnable = 0;
    fadeIn = 0;
    duration = 10e10;
    fadeOut = 0;
    name = "playerGUI";
    onLoad = "uiNamespace setVariable ['playerGUI',_this select 0]";
    objects[] = {};

    class controlsBackground
    {
		class MainBackgroundBlufor: sd_RscText
		{
			idc = -1;
			x = 0.775 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.08 * safezoneH;
			colorBackground[] = {0,0.3,0.6,1};
		};
		class MainBackgroundOpfor: sd_RscText
		{
			idc = -1;
			x = 0.85 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.08 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		class MainBackgroundIndependent: sd_RscText
		{
			idc = -1;
			x = 0.925 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.0499999 * safezoneW;
			h = 0.0800003 * safezoneH;
			colorBackground[] = {0,0.5,0,1};
		};
		class BackgroundTeamBlufor: sd_RscText
		{
			idc = 18003;
			x = 0.775 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class BackgroundTeamOpfor: sd_RscText
		{
			idc = 18004;
			x = 0.85 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class BackgroundTeamIndep: sd_RscText
		{
			idc = 18005;
			x = 0.925 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class PicturePlayersBlufor: sd_RscPicture
		{
			idc = -1;
			text = "texture\players.paa";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PicturePlayersOpfor: sd_RscPicture
		{
			idc = -1;
			text = "texture\players.paa";
			x = 0.925 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PicturePlayersIndep: sd_RscPicture
		{
			idc = -1;
			text = "texture\players.paa";
			x = 0.85 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class SD_TITEL: sd_RscText
		{
			idc = -1;
			text = "SealDrop KOTH";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.06 * safezoneH;
			sizeEx = 1.5 * GUI_GRID_H;
		};
	};
	class controls
	{
		class xpBar: sd_RscProgress
		{
			idc = 45011;
			x = 0.775 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class CountBluforKills: sd_RscText
		{
			idc = 45005;
			text = "";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.06 * safezoneH;
			sizeEx = 1.4 * GUI_GRID_H;
		};
		class CounterPlayersBlufor: sd_RscText
		{
			idc = 45002;
			text = "";
			x = 0.8 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class CounterPlayersIndep: sd_RscText
		{
			idc = 45004;
			text = "";
			x = 0.95 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class CounterPlayersOpfor: sd_RscText
		{
			idc = 45003;
			text = "";
			x = 0.875 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class countOpforKills: sd_RscText
		{
			idc = 45009;
			text = "";
			x = 0.85 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.06 * safezoneH;
			sizeEx = 1.5 * GUI_GRID_H;
		};
		class countIndependentKills: sd_RscText
		{
			idc = 45010;
			text = "";
			x = 0.925 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.06 * safezoneH;
			sizeEx = 1.5 * GUI_GRID_H;
		};
		class TeamBlufor: sd_RscText
		{
			idc = 18000;
			text = "";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class TeamOpfor: sd_RscText
		{
			idc = 18002;
			text = "";
			x = 0.85 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class TeamIndep: sd_RscText
		{
			idc = 18001;
			text = "";
			x = 0.925 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class xpText: sd_RscText
		{
			idc = 45012;
			text = "";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class healthBar: sd_RscProgress
		{
			idc = 45013;
			x = 0.775 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class levelTitle: sd_RscText
		{
			idc = 45100;
			text = "";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0.075,0.09,0.106,1};
		};
		class healthTitle: sd_RscText
		{
			idc = -1;
			text = "HEALTH";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0.075,0.09,0.106,1};
		};
		class kdTitle: sd_RscText
		{
			idc = -1;
			text = "K/D RATIO";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.075,0.09,0.106,1};
		};
		class healthText: sd_RscText
		{
			idc = 45014;
			text = "";
			x = 0.8625 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class kdBar: sd_RscProgress
		{
			idc = 45019;
			x = 0.775 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class kdRatioText: sd_RscText
		{
			idc = 45015;
			text = "";
			x = 0.775 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};
};