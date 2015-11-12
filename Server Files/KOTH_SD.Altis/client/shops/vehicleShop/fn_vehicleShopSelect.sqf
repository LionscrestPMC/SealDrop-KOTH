/*
	File: fn_vehicleShopSelect.sqf
	Author: DeadP4xel
*/
private["_control","_index","_item","_weaponTextDialog","_weaponInfoText","_levelText","_vehicleInfo","_levelData"];

// VARIABLES
_control = 	[_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = 	[_this,1,-1,[0]] call BIS_fnc_param;
_className = lbData[57001,(lbCurSel 57001)];
_vehicleInfo = [_className] call sd_fnc_fetchVehicleCfg;

// ERROR CHECKS
if(isNull _control OR _index isEqualTo -1) exitWith {closeDialog 0};

// START SELECTION
_vehicleLevel = ((findDisplay 57000) displayCtrl 57004);
_vehiclePicture = ((findDisplay 57000) displayCtrl 57003);
_buttonSpawn = ((findDisplay 57000) displayCtrl 57005);
_vehicleName = ((findDisplay 57000) displayCtrl 57006);

// SELECTIONS
_levelData = _control lbValue _index;
if(_levelData > sd_level) then {
	_vehicleName ctrlSetText format["%1",parseText (_vehicleInfo select 3)];
	_vehiclePicture ctrlSetStructuredText parseText format["<img size='4' image='%1'/>",parseText (_vehicleInfo select 2)];
	_vehicleLevel ctrlSetStructuredText parseText format["<t size='0.8'>Need Level: <t color='#FF0000'>%1</t><br/>Current Level: <t color='#00A115'>%2</t></t>",str (_levelData),str (sd_level)];
	if(sd_vehicleCooldown) then {
		_buttonSpawn ctrlEnable false;
		_buttonSpawn ctrlSetText "Cooldown";
	} else {
		_buttonSpawn ctrlEnable true;
	};
} else {
	_vehicleName ctrlSetText format["%1",parseText (_vehicleInfo select 3)];
	_vehiclePicture ctrlSetStructuredText parseText format["<img size='4' image='%1'/>",parseText (_vehicleInfo select 2)];
	_vehicleLevel ctrlSetStructuredText parseText format["<t size='0.8'>You can spawn this vehicle<br/>Your Level: <t color='#00A115'>%1</t></t>",str (sd_level)];
	if(sd_vehicleCooldown) then {
		_buttonSpawn ctrlEnable false;
		_buttonSpawn ctrlSetText "Cooldown";
	} else {
		_buttonSpawn ctrlEnable true;
	};
};