/*
	File: fn_sendData.sqf
	Author: DeadP4xel

	Description:
	Send Player stats to server
*/
private["_uid","_side","_player"];

// ERROR CHECK
if(sd_clientLoad) exitWith {};

// GET DATA
_player 	= player;
_side 		= side _player;
_uid 		= getPlayerUID _player;

// PLAYER SCREEN
0 cutText[format[localize "STR_Script_GINFO",profileName],"BLACK FADED"];
0 cutFadeOut 9999999;

// SEND DATA TO SERVER
[[_uid,_side,_player],"DB_fnc_getData",false,false] spawn BIS_fnc_MP;