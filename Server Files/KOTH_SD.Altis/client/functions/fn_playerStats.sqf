/*
	File: fn_playerStats.sqf
	Author: DeadP4xel

	Descrtiption:
	Can request his personal Stats
*/
private["_xp","_deaths","_kills","_kdRatio"];

// VARIABLES 
_xp = sd_xp;
_deaths = sd_deaths;
_kills = sd_kills;
_kdRatio = "";

// ERROR CHECKS 
if(!alive player) exitWith {};

if(sd_deaths isEqualTo 0 OR sd_kills isEqualTo 0) then {
	_kdRatio = 0;
} else {
	_kdRatio = (round((sd_kills / sd_deaths) * (10 ^ 2)) / (10 ^ 2));
};

// START SCRIPT 
hintSilent parseText format 
["<t size='2'><t color='#0078ff'>PLAYER STATS</t><br/>------------------------<br/><t color='#feef00'>%1</t><br/><br/>KILLS: <t color='#8cff9b'>%2</t><br/>DEATHS: <t color='#ff0000'>%3</t><br/>K/D RATIO: <t color='#ffc000'>%4</t><br/>Experience:<br/><t color='#00a78d'>%5 EP</t></t>",
	profileName,
	sd_kills,
	sd_deaths,
	_kdRatio,
	sd_xp
];