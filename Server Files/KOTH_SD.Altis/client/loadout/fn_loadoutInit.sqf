/*
	File: fn_loadoutInit.sqf 
	Author: DeadP4xel

	Description:
	Init the loadout script
*/
private["_dropdownMenu","_buttonSaveGear"];
disableSerialization;

if(!(call sd_loadoutMaster)) exitWith {};

if(!(createDialog "loadoutGUI")) exitWith {};

// DISPLAYS
_buttonSaveGear = ((findDisplay 75000) displayCtrl 75002);
_dropdownMenu = ((findDisplay 75000) displayCtrl 75004);

// DROPDOWN MENU 
lbClear _dropdownMenu;
_dropdownMenu lbAdd "Loadout Slot 1";
if(sd_level >= 20) then {
	_dropdownMenu lbAdd "Loadout Slot 2";
};
if(sd_level >= 30) then {
	_dropdownMenu lbAdd "Loadout Slot 3";
};
if(sd_level >= 40) then {
	_dropdownMenu lbAdd "Loadout Slot 4";
};
if(sd_level >= 50) then {
	_dropdownMenu lbAdd "Loadout Slot 5";
};
_dropdownMenu lbSetCurSel 0;

// BUTTON CONTROL 
if(sd_loadoutSyncCooldown) then {
	_buttonSaveGear ctrlEnable false;
	_buttonSaveGear ctrlSetText "COOLDOWN";
} else {
	_buttonSaveGear ctrlEnable true;
	_buttonSaveGear ctrlSetText "SYNC TO SERVER";
};