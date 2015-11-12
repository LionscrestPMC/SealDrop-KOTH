/*
	Author: DeadP4xel
*/
class vehicleShopGUI
{
    idd = 57000;
    movingEnable = 0;
    fadeIn = 0;
    duration = 10e10;
    fadeOut = 0;
    name = "vehicleShopGUI";
    onLoad = "uiNamespace setVariable ['vehicleShopGUI',_this select 0]";
    objects[] = {};

    class controlsBackground
    {
		class MainBackground: sd_RscText
		{
			idc = -1;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.42 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitleHeader: sd_RscText
		{
			idc = -1;
			text = "SealDrop Vehicle Shop";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0.54,0.54,0.4,1};
		};
	};

	class controls
	{
		class VehicleList: sd_RscListbox
		{
			idc = 57001;
			onLBSelChanged = "_this call sd_fnc_vehicleShopSelect";
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.34 * safezoneH;
		};
		class DropdownMenu: sd_RscCombo
		{
			idc = 57002;
			onLBSelChanged = "_this call sd_fnc_vehicleShopVehicleList";
			x = 0.3125 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class VehiclePicture: sd_RscStructuredText
		{
			idc = 57003;
			text = "";
			x = 0.4875 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class VehicleInformation: sd_RscStructuredText
		{
			idc = 57004;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.06 * safezoneH;
		};
		class ButtonClose: sd_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class ButtonSpawnVehicle: sd_RscButtonMenu
		{
			idc = 57005;
			text = "Spawn";
			onButtonClick = "[] spawn sd_fnc_vehicleShopSpawn; true";
			x = 0.365 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class VehicleName: sd_RscText
		{
			idc = 57006;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
};