/*
	File: fn_playerJump.sqf
	Author: DeadP4xel

	Description:
	Players can jump while pressing a button
*/
private["_jumpHigh","_velocity","_speed","_direction","_animation"];

// VARIABLES
_player		= [_this,0,objNull,[objNull]] call BIS_fnc_param;
_running 	= [_this,1,true,[false]] call BIS_fnc_param;
_jumpHigh 	= 3.82;
_speed 		= 0.4;
_velocity 	= velocity _player;
_direction 	= direction _player;
_animation 	= animationState _player;

// ERROR CHECKS
if(!(call sd_jumpMaster)) exitWith {};
if(speed player < 2) exitWith {};
if(local _player && !_running) exitWith {};
if(isNull _player OR !alive _player) exitWith {};
if(animationState _player isEqualTo "AovrPercMrunSrasWrflDf") exitWith {};

// CONVERT DATA AND EXECUTE THE JUMP
_player switchMove "AovrPercMrunSrasWrflDf";
if(local _player) then {
	_player setVelocity [(_velocity select 0) + (sin _direction * _speed),(_velocity select 1) + (cos _direction * _speed),(_velocity select 2) + _jumpHigh];
	waitUntil {animationState _player != "AovrPercMrunSrasWrflDf"};
	_player switchMove _animation;
};