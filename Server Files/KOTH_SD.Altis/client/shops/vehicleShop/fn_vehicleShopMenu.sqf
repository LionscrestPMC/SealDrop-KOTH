/*
	File: fn_vehicleShopMenu.sqf
	Author: DeadP4xel

	Description:
	First VehicleShop File. Handle the DROPDOWN and the UI VARIABLE
*/
private ["_filters"];
disableSerialization;

// SET MASTER VEHICLE SHOP VARIABLE
uiNamespace setVariable ["VehicleShop",["vehiclesGROUNDU","vehiclesGROUNDA","vehiclesAIR","vehiclesBoat"]];

// ERROR CHECKS
if(!(createDialog "VehicleShopGUI")) exitWith {};

// CREATE DROPDOWN MENU
_filters = ((findDisplay 57000) displayCtrl 57002);
lbClear _filters;
_filters lbAdd localize "STR_Script_vehiclesGorund";
_filters lbAdd localize "STR_Script_vehiclesArmed";
_filters lbAdd localize "STR_Script_vehiclesAir";
_filters lbAdd localize "STR_Script_vehiclesShip";
_filters lbSetCurSel 0;


if(sd_vehicleCooldown) then {
	((findDisplay 57000) displayCtrl 57005) ctrlEnable false;
	((findDisplay 57000) displayCtrl 57005) ctrlSetText "Cooldown";
} else {
	((findDisplay 57000) displayCtrl 57005) ctrlEnable true;
};