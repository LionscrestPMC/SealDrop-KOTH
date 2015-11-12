/*
	File: initServer.sqf
	Author: DeadP4xel

	Description:
	Init the Server.
*/

// ERROR CHECK
if(!(_this select 0)) exitWith {};

// CALLING THE SERVER
[] call compile preprocessFileLineNumbers "\koth_server\init.sqf";
