/*
	File: fn_loadoutSendRequest.sqf 
	Author: DeadP4xel

	Description:
	Send first request to the server.
*/
private["_player","_pUID","_pName"];

// VARIABLES 
_player = player;
_pUID = (getPlayerUID player);

// SEND DATA TO SERVER
[[_pUID,_player],"LOUTS_fnc_loadoutHandler",false,false] call BIS_fnc_MP;