/*
	File: fn_weaponShopMenu.sqf
	Author: DeadP4xel
*/
private["_shop","_filter"];
// VARIABLES
uiNamespace setVariable ["WeaponShop",["weapons","ammo","explosive","scopes"]];
disableSerialization;

// ERROR CHECKS
if(!(createDialog "weaponShopGUI")) exitwith {};

_filter = ((findDisplay 55000) displayCtrl 55005);
lbClear _filter;
_filter lbAdd localize "STR_Script_weaponsText";
_filter lbAdd localize "STR_Script_magazinesText";
_filter lbAdd localize "STR_Script_rocketsText";
_filter lbAdd localize "STR_Script_scopesText";
_filter lbAdd localize "STR_Script_Inventory";
_filter lbSetCurSel 0;