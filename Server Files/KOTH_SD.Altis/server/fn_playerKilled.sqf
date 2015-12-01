/*
  File: fn_playerKilled.sqf
  Author: DeadP4xel

  Description:
  PUNISH AND KILL SYSTEM
*/

/*
// VARIABLES
_player = _this select 0;
_killer = _this select 1;

// AUTOMATIC PUNISH SYSTEM
if(call sd_punishSystemMaster) then {
  if((side _killer) isEqualTo (side _player)) then {
    if(_killer isEqualTo _player) exitWith {};
    sd_statsAddTKServer = [_killer];
    publicVariableServer "sd_statsAddTKServer";
  };
};

// ADD KILL TO THE KILLER
if(call sd_levelSystemMaster) then {
  if(_killer != _player) then {
    if((side _killer) isEqualTo (side _player)) exitWith {};
    if(_killer isKindOf "Man") then {
      sd_statsAddKillServer = [100,1,_killer];
      publicVariableServer "sd_statsAddKillServer";
    };
  };
};
*/