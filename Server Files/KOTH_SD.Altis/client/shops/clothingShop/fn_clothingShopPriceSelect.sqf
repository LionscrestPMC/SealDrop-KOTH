/*
	File: fn_clothingShopPriceSelect.sqf
	Author: DeadP4xel

	Description:
	Sets the "LevelTag" and the "ItemPicture" to the dialog.
*/
private["_control","_index","_item","_itemInfo","_clothingText","_clothingPicture","_levelData"];
_control = 	[_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = 	[_this,1,-1,[0]] call BIS_fnc_param;
_item = 	lbData[56005,(lbCurSel 56005)];
_itemInfo = [_item] call sd_fnc_fetchCfgDetails;
_clothingText = ((findDisplay 56000) displayCtrl 56002);
_clothingPicture = ((findDisplay 56000) displayCtrl 56003);
_buttonEquip = ((findDisplay 56000) displayCtrl 56004);
_levelData = _control lbValue _index;

if(_levelData > sd_level) then {
	_clothingPicture ctrlSetStructuredText parseText format["<img size='7' image='%1'/>",parseText (_itemInfo select 2)];
	_clothingText ctrlSetStructuredText parseText format["<t size='0.8'>Need Level: <t color='#ff0000'>%1</t><br/>Current Level: <t color='#00A115'>%2</t></t>",str (_levelData),str (sd_level)];
	_buttonEquip ctrlShow false;
} else {
	_clothingPicture ctrlSetStructuredText parseText format["<img size='7' image='%1'/>",parseText (_itemInfo select 2)];
	_clothingText ctrlSetStructuredText parseText format["<t size='0.8'>You can wear this item<br/>Your Level: <t color='#00A115'>%1</t></t>",str (sd_level)];
	_buttonEquip ctrlShow true;
};