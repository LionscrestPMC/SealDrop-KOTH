/*
	File: fn_hudCreate.sqf
	Author: DeadP4xel
*/
private["_damage","_xp","_kills","_deaths","_level","_countWestTrigger","_countIndepTrigger","_countWestKillsGlobal","_countOpforKillsGlobal"];
disableSerialization;

2 cutRsc ["playerGUI","PLAIN"];
[] call sd_fnc_hudConfig;

[] spawn
{
	private["_dam"];
	while {true} do
	{
		_damage = (damage player);
		waitUntil {(damage player) != _damage};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_xp"];
	while {true} do
	{
		_xp = sd_xp;
		waitUntil {sd_xp != _xp};
		[] call sd_fnc_hudConfig;
		[] call sd_fnc_levelData;
	};
};
[] spawn
{
	private["_kills"];
	while {true} do
	{
		_kills = sd_kills;
		waitUntil {sd_kills != _kills};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_deaths"];
	while {true} do
	{
		_deaths = sd_deaths;
		waitUntil {sd_deaths != _deaths};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_level"];
	while {true} do
	{
		_level = sd_level;
		waitUntil {sd_level != _level};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_countWestTrigger"];
	while{true} do
	{
		_countWestTrigger = (playersNumber west);
		waitUntil {(playersNumber west) != _countWestTrigger};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_countOpforTrigger"];
	while{true} do
	{
		_countOpforTrigger = (playersNumber opfor);
		waitUntil {(playersNumber opfor) != _countOpforTrigger};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_countIndepTrigger"];
	while{true} do
	{
		_countIndepTrigger = (playersNumber independent);
		waitUntil {(playersNumber independent) != _countIndepTrigger};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_countWestKillsGlobal"];
	while{true} do
	{
		_countWestKillsGlobal = sd_westCounterToClients;
		waitUntil {sd_westCounterToClients != _countWestKillsGlobal};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_countOpforKillsGlobal"];
	while{true} do
	{
		_countOpforKillsGlobal = sd_eastCounterToClients;
		waitUntil {sd_eastCounterToClients != _countOpforKillsGlobal};
		[] call sd_fnc_hudConfig;
	};
};
[] spawn
{
	private["_countIndepKillsGlobal"];
	while{true} do
	{
		_countIndepKillsGlobal = sd_independentCounterToClients;
		waitUntil {sd_independentCounterToClients != _countIndepKillsGlobal};
		[] call sd_fnc_hudConfig;
	};
};
