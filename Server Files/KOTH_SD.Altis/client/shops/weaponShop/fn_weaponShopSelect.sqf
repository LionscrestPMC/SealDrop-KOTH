/*
	File: fn_weaponShopSelect.sqf
	Author: DeadP4xel
*/
private["_control","_index","_item","_weaponTextDialog","_weaponInfoText","_levelText","_itemInfo","_levelData","_weaponType"];
_control = 	[_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = 	[_this,1,-1,[0]] call BIS_fnc_param;
_item = lbData[55003,(lbCurSel 55003)];
_itemInfo = [_item] call sd_fnc_fetchCfgDetails;
// ERROR CHECKS
if(isNull _control OR _index isEqualTo -1) exitWith {closeDialog 0};

// START SELECTION
_levelText = ((findDisplay 55000) displayCtrl 55004);
_weaponTextDialog = ((findDisplay 55000) displayCtrl 55001);
_weaponInfoText = ((findDisplay 55000) displayCtrl 55006);
_buttonEquip = ((findDisplay 55000) displayCtrl 55002);
_weaponType = _control lbData _index;
if((uiNamespace getVariable["weaponShopFilter",0]) isEqualTo 4) then {
	_weaponTextDialog ctrlSetStructuredText parseText format["<img size='7' image='%1'/>",parseText (_itemInfo select 2)];
} else {
	_levelData = _control lbValue _index;
	if(_levelData > sd_level) then {
		_weaponTextDialog ctrlSetStructuredText parseText format["<img size='7' image='%1'/>",parseText (_itemInfo select 2)];
		_weaponInfoText ctrlSetStructuredText parseText format["<t size='0.9'>%1</t>",parseText (_itemInfo select 15)];
		_levelText ctrlSetStructuredText parseText format["<t size='0.8'>Need Level: <t color='#ff0000'>%1</t><br/>Current Level: <t color='#00A115'>%2</t></t>",str (_levelData),str (sd_level)];
		_buttonEquip ctrlEnable false;
	} else {
		_weaponTextDialog ctrlSetStructuredText parseText format["<img size='7' image='%1'/>",parseText (_itemInfo select 2)];
		_weaponInfoText ctrlSetStructuredText parseText format["<t size='0.9'>%1</t>",parseText (_itemInfo select 15)];
		_levelText ctrlSetStructuredText parseText format["<t size='0.8'>You can equip this item<br/>Your Level: <t color='#00A115'>%1</t></t>",str (sd_level)];
		_buttonEquip ctrlEnable true;
	};
};