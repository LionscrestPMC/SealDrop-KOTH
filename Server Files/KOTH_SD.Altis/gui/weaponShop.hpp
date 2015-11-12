/*
	Author: DeadP4xel
*/
class weaponShopGUI
{
    idd = 55000;
    movingEnable = 0;
    fadeIn = 0;
    duration = 10e10;
    fadeOut = 0;
    name = "weaponShopGUI";
    onLoad = "uiNamespace setVariable ['weaponShopGUI',_this select 0]";
    objects[] = {};

    class controlsBackground
    {
		class MainBackground: sd_RscText
		{
			idc = -1;
			x = 0.325 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.32 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitleHeader: sd_RscText
		{
			idc = -1;
			text = "SealDrop Weapon Shop";
			x = 0.325 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0.54,0.54,0.4,1};
		};
		class WeaponText: sd_RscStructuredText
		{
			idc = 55001;
			text = "";
			sizeEx = 0.035;
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class WeaponInfotext: sd_RscStructuredText
		{
			idc = 55006;
			text = "";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.2 * safezoneH;
		};
		class WeaponFilterList: sd_RscCombo
		{
			idc = 55005;
			onLBSelChanged = "_this call sd_fnc_weaponShopItemList";
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};

	class controls
	{
		class EquipWeapon: sd_RscButtonMenu
		{
			idc = 55002;
			text = "$STR_Global_Equip";
			onButtonClick = "[] spawn sd_fnc_weaponShopEquipSell; true";
			x = 0.39 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class ButtonClose: sd_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.325 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class WeaponListbox: sd_RscListbox
		{
			idc = 55003;
			onLBSelChanged = "_this call sd_fnc_weaponShopSelect";
			x = 0.3375 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class LevelNeedWeapon: sd_RscStructuredText
		{
			idc = 55004;
			text = "";
			sizeEx = 0.035;
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.06 * safezoneH;
		};
	};
};