/*
	File: fn_animSync.sqf
	Author: DeadP4xel

	Descrtiption:
	Execute the Animation to all clients in network
*/
private["_player","_animation"];

// VARIABLES
_player = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_animation = [_this,1,"",[""]] call BIS_fnc_param;

// EXECUTE ANIM
_player switchMove _animation;
