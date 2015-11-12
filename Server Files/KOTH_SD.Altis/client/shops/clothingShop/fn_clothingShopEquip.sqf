/*
	File: fn_clothingShopEquip.sqf
	Author: DeadP4xel

	Description:
	Handle the "Wear" Button.
*/
private["_level","_item","_itemInfo"];
disableSerialization;

// VARIABLES
_item = lbData[56005,(lbCurSel 56005)];
_itemInfo = [_item] call sd_fnc_fetchCfgDetails;
_level = lbValue[56005,(lbCurSel 56005)]; 

// ERROR CHECKS
if((lbCurSel 56005) isEqualTo -1) exitWith {hintSilent localize "STR_Script_selectVeh"};
if(isNil "_level") then {
	_level = 0;
};

// CONVERT THE DATA
if(_level > sd_level) then {
	hintSilent "Your level is to low to wear this item!";
} else {
	[_item,true] spawn sd_fnc_handleItem;
};