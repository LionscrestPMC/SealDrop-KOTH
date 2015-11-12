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

// DEATH SCREEN
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
// ADD KILL
if(_player isKindOf "Man" && !isNull player) then {
  sd_deaths = sd_deaths + 1;
};

// KILLCOUNTER GLOBAL
_killCounter = (side _killer) call {
  if(_killer isEqualTo _player) exitWith {systemChat format [localize "STR_Script_Suicide",profileName];};
  if(_this isEqualTo west) exitWith {'sd_westCounterToServer'};
  if(_this isEqualTo opfor) exitWith {'sd_eastCounterToServer'};
  if(_this isEqualTo independent) exitWith {'sd_independentCounterToServer'};
};
if !(_killCounter isEqualTo '') then {
  missionNameSpace setVariable [_killCounter,'']; 
  publicVariableServer _killCounter;
};
[] call BASIS_fnc_updateData;