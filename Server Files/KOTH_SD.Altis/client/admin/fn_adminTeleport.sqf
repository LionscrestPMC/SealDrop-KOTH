/*
	File: fn_adminTeleport.sqf
	Author: DeadP4xel

	Description:
	Teleport for Admins
*/

// ERROR CHECKS
if(isNull player OR !alive player) exitWith {};
if(!((getPlayerUID player) in sd_admin_players)) exitWith {};

//Add Map
if(!("ItemMap" in (items player))) then {
	player addItem "ItemMap";
	player assignItem "ItemMap";
};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   uiSleep 0.05;
  };
};

teleportAction = {
	_pos = [_this select 0,_this select 1,_this select 2];
	(vehicle player) setPos [_pos select 0,_pos select 1,0];
	onMapSingleClick "";
	openMap[false,false];
};
openMap [true,false];
onMapSingleClick "[_pos select 0,_pos select 1,_pos select 2] call teleportAction";