/*
  File: fn_removeGear.sqf
  Author: DeadP4xel

  Deescription:
  Removes everything from player
*/
private["_player"];
_player = player;

removeAllItems _player;
removeVest _player;
removeUniform _player;
removeAllWeapons _player;
removeHeadgear _player;
removeGoggles _player;
removeBackpack _player;
removeAllAssignedItems _player;
removeAllHandgunItems _player;
{
	_player removeMagazine _x;
} forEach (magazines player);
