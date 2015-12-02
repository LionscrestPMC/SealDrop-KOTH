/*
  File: fn_onPlayerKilled.sqf
  Author: DeadP4xel
*/
private["_player","_killer","_killCounter"];
disableSerialization;

// VARIABLES
_player = _this select 0;
_killer = _this select 1;
sd_isDead = true;

// ADD KILL
if(_player isKindOf "Man") then {
  sd_deaths = sd_deaths + 1;
};

// KILLCOUNTER GLOBAL
_killCounter = (side _killer) call {
  if(_this isEqualTo west) exitWith {'sd_westCounterToServer'};
  if(_this isEqualTo opfor) exitWith {'sd_eastCounterToServer'};
  if(_this isEqualTo independent) exitWith {'sd_independentCounterToServer'};
};
if !(_killCounter isEqualTo '') then {
  missionNameSpace setVariable [_killCounter,'']; 
  publicVariableServer _killCounter;
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

// AUTOMATIC PUNISH SYSTEM
if(call sd_punishSystemMaster) then {
  if((side _killer) isEqualTo (side _player)) then {
    if(_killer isEqualTo _player) exitWith {};
    sd_statsAddTKServer = [_killer];
    publicVariableServer "sd_statsAddTKServer";
  };
};

// DEATH SCREEN
if((sd_punishBan isEqualTo 1) OR (sd_punish_warnings >= (call sd_punish_warningsMax))) then {
  ["Teamkill",false,true] call BIS_fnc_endMission;
  [] call BASIS_fnc_updateData;
} else {
  createDialog "deathScreen";
  _player spawn {
    private["_killedByText","_respawnText","_cooldown"];
    disableSerialization;
    (findDisplay 7500) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"];
    _respawnText = ((findDisplay 7500) displayCtrl 7502);
    setPlayerRespawnTime (call sd_respawnTime);
    _cooldown = diag_tickTime + (call sd_respawnTime);
    waitUntil {
      _respawnText ctrlSetText format [localize "STR_Script_respawnInText",[(_cooldown - diag_tickTime),"SS.MS"] call BIS_fnc_secondsToString];
      _respawnText ctrlCommit 0;
      round(_cooldown - diag_tickTime) <= 0 || isNull _this;
    };
    _respawnText ctrlSetText localize "STR_Script_respawnText";
  };
  _killedByText = ((findDisplay 7500) displayCtrl 7501);
  if(_killer isEqualTo _player) then {
    _killedByText ctrlSetText localize "STR_Script_selfKill";
  } else {
    _killedByText ctrlSetText format [localize "STR_Script_killdByText",name _killer];
  };
  [] call BASIS_fnc_updateData;
};