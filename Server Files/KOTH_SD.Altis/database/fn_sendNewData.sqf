/*
	File: fn_sendNewData.sqf
	Author: DeadP4xel

	Description:
	Send new data to the database
*/

// ERROR CHECKS
if(sd_clientLoad) exitWith {};

// SEND DATA TO SERVER
[[getPlayerUID player,profileName,playerSide,sd_level,sd_kills,sd_punishBan,sd_punish_warnings,sd_xp,sd_deaths,player],"DB_fnc_insertData",false,false] spawn BIS_fnc_MP;
