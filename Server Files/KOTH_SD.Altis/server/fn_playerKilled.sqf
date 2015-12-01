/*
  File: fn_playerKilled.sqf
  Author: DeadP4xel

  Description:
  PUNISH AND KILL SYSTEM
*/
// VARIABLES
_player = _this select 0;
_killer = _this select 1;

// AUTOMATIC PUNISH SYSTEM
if(call sd_punishSystemMaster) then {
  if(side _killer == side _player) then {
    if(_killer isEqualTo _player) exitWith {};
    sd_statsAddTK = [_killer];
    owner _killer publicVariableClient "sd_statsAddTK";
  };
};

// ADD KILL TO THE KILLER
if(call sd_levelSystemMaster) then {
  if(_killer != _player) then {
    if((side _killer) isEqualTo (side _player)) exitWith {};
    if(_killer isKindOf "Man") then {
      sd_statsAddKill = [100,1];
      owner _killer publicVariableClient "sd_statsAddKill";
    } else {
      sd_statsAddKill = [100,1];
      _crew = crew _killer;
      {
        owner _x publicVariableClient "sd_statsAddKill";
      } forEach _crew;
    };
  };
};
