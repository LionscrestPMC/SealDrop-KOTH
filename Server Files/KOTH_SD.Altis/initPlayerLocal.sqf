/*
  File: initPlayerLocal.sqf
  Auhtor: DeadP4xel
*/
if(!hasInterface) exitWith {};

[] execVM "client\init.sqf";


//Dynamic Groups - Bohemia Interactive
["InitializePlayer",[player]] call BIS_fnc_dynamicGroups;
[] spawn {
	sleep 10;
	hintSilent 'Press U to open Group Manager';
	//hintSilent 'Druecke U um den Gruppen-Manager zu oeffnen';
};