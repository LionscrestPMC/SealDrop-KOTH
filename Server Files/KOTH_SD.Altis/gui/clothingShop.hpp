class clothingShopGUI
{
    idd = 56000;
    movingEnable = true;
    fadeIn = 0;
    duration = 10e10;
    fadeOut = 0;
    name = "clothingShopGUI";
    onLoad = "uiNamespace setVariable ['clothingShopGUI',_this select 0]";
    objects[] = {};

    class controlsBackground
    {
		class MainBackground: sd_RscText
		{
			idc = -1;
			moving = 1;
			x = 0.325 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.36 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitleHeader: sd_RscText
		{
			idc = -1;
			moving = 1;
			text = "SealDrop Clothing Shop";
			x = 0.325 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {0.54,0.54,0.4,1};
		};
		class DropdownMenu: sd_RscCombo
		{
			idc = 56001;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call sd_fnc_clothingShopItemList";
			x = 0.475 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};

	class controls
	{

		class LevelInfoText: sd_RscStructuredText
		{
			idc = 56002;
			text = "";
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.06 * safezoneH;
		};
		class PlayerPicture: sd_RscStructuredText
		{
			idc = 56003;
			text = "";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class ButtonEquip: sd_RscButtonMenu
		{
			idc = 56004;
			text = "$STR_Global_Equip";
			onButtonClick = "[] call sd_fnc_clothingShopEquip";
			x = 0.39 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class ButtonClose: sd_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0";
			x = 0.325 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class ClothingList: sd_RscListbox
		{
			idc = 56005;
			onLBSelChanged = "_this call sd_fnc_clothingShopPriceSelect";
			x = 0.3375 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.32 * safezoneH;
		};
	};
};