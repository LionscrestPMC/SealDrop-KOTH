/*
	File: fn_receiveData.sqf
	Author: DeadP4xel

	Description:
	Receive the data from the server
*/

// ERROR CHECK
if(sd_clientLoad) exitWith {};

// ERROR CHECKS
if(isNil "_this") exitWith {[] call BASIS_fnc_sendNewData};
if(typeName _this isEqualTo "STRING") exitWith {[] call BASIS_fnc_sendNewData};
if(count _this isEqualTo 0) exitWith {[] call BASIS_fnc_sendNewData};
if((_this select 0) isEqualTo "Error") exitWith {[] call BASIS_fnc_sendNewData};
if((getPlayerUID player) != _this select 0) exitWith {[] call BASIS_fnc_sendData};

// SET VARIABLE DATA
sd_level 			= 	parseNumber(_this select 3);
sd_kills 			= 	parseNumber(_this select 4);
sd_punishBan 		= 	parseNumber(_this select 5);
sd_punish_warnings 	= 	parseNumber(_this select 6);
sd_xp 				=	parseNumber(_this select 7);
sd_deaths 			=	parseNumber(_this select 8);

// CLIENT IS READY AND SYNCED
sd_clientLoad 		= 	true;