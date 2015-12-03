/*
	File: fn_repairVehicle.sqf 
	Author: DeadP4xel

	Description:
	Script to repair trucks
*/
private["_vehicle","_progress"];

// VARIABLES 
_vehicle = cursorTarget;

// ERROR CHECKS 
if((damage _vehicle) >= 1) exitWith {hintSilent "This vehicle is destroyed! You can't repair it anymore"};
if(isNull _vehicle) exitWith {};
if(!alive player OR isNull player) exitWith {};
if(vehicle player != player) exitWith {hintSilent "You can't repair a vehicle while stay in a vehicle."};


if((_vehicle isKindOf "Car") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then 
{
	if("ToolKit" in (items player)) then {
		_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		cutText [format ["REPARIERE %1",_vehicleName],"PLAIN DOWN"];
		_progress = 0.01;
		while {true} do
		{
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1") then {
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			uiSleep 0.195;
			_progress = _progress + 0.01;
			if(_progress >= 1) exitWith {};
		};
		player playActionNow "stop";
		_vehicle setDamage 0;
		player removeItem "ToolKit";
		cutText [format ["%1 IS NOW FULLY REPAIRED",_vehicleName],"PLAIN DOWN"];
	} else {
		hintSilent "You don't have a Toolkit in your inventory!";
	};
};