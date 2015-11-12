/*
	File: fn_clothingShopMenu.sqf
	Author: DeadP4xel

	Description:
	Master File for the Clothing Shop.
*/
private["_filter"];
disableSerialization;

// MASTER VARIABLE
uiNamespace setVariable ["ClothingShop",["uniforms","headgear","goggles","vest","backpacks"]];

// SET UP DROPDOWN MENU AND CLOTHING LIST
if(!(createDialog "clothingShopGUI")) exitWith {};

// DROPDOWN
_filter = (findDisplay 56000) displayCtrl 56001;
lbClear _filter;
_filter lbAdd localize "STR_Script_uniform";
_filter lbAdd localize "STR_Script_headgear";
_filter lbAdd localize "STR_Script_goggles";
_filter lbAdd localize "STR_Script_vests";
_filter lbAdd localize "STR_Script_backpack";
_filter lbSetCurSel 0;

// CAMERA
sd_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
if((date select 3) in [0,1,2,3,4,5,6,19,20,21,22,23,24]) then {
  camUseNVG true;
} else {
  camUseNVG false;
};
sd_shop_cam cameraEffect ["Internal", "Back"];
sd_shop_cam camSetTarget (player modelToWorld [0,0,1]);
sd_shop_cam camSetPos (player modelToWorld [1,4,2]);
sd_shop_cam camSetFOV .33;
sd_shop_cam camSetFocus [50, 0];
sd_shop_cam camCommit 0;
waitUntil {isNull (findDisplay 56000)};
sd_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy sd_shop_cam;