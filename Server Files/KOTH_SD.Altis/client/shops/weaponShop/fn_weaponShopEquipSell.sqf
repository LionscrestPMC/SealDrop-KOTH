/*
	File: fn_weaponShopEquipSell.sqf
	Author: DeadP4xel
*/
private["_level","_item","_itemInfo","_bad"];
disableSerialization;

// VARIABLES AND ERROR CHECKS
if((lbCurSel 55003) isEqualTo -1) exitWith {};
_level = lbValue[55003,(lbCurSel 55003)]; if(isNil "_level") then {_level = 0;};
_item = lbData[55003,(lbCurSel 55003)];
_itemInfo = [_item] call sd_fnc_fetchCfgDetails;

// CONVERT THE DATA
if((uiNamespace getVariable["WeaponShopFilter",0]) isEqualTo 4) then
{
	[_item,false] call sd_fnc_handleItem;
	[nil,(uiNamespace getVariable["WeaponShopFilter",0])] call sd_fnc_weaponShopItemList;
} else {
	if(_level > sd_level) exitWith {};
	[_item,true] spawn sd_fnc_handleItem;
};