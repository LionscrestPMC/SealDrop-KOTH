/*
  File: fn_hudConfig.sqf
  Author: DeadP4xel

  Description:
  Makes the HUD with Empty Data
*/
private["_gui","_health","_uptime","_countBlue","_levelNeed","_countOpfor","_countIndep","_countKillsWest","_countKillsEast","_countKillsIndep","_sideWest","_sideOpfor","_sideIndep","_headerSideWest","_headerSideEast","_headerSideIndep","_sdLevelNext","_kills","_level"];
disableSerialization;

// VARIABLES
_gui = uiNameSpace getVariable ["playerGUI",displayNull];

// ERROR CHECK
if(isNull _gui) then {[] call sd_fnc_hudCreate};

// DISPLAYS
_countBlue = _gui displayCtrl 45002;
_countOpfor = _gui displayCtrl 45003;
_countIndep = _gui displayCtrl 45004;
_countKillsWest = _gui displayCtrl 45005;
_countKillsEast = _gui displayCtrl 45009;
_countKillsIndep = _gui displayCtrl 45010;
_sideWest = _gui displayCtrl 18000;
_sideOpfor = _gui displayCtrl 18002;
_sideIndep = _gui displayCtrl 18001;
_healthBar = _gui displayCtrl 45013;
_healthText = _gui displayCtrl 45014;
_kdBar = _gui displayCtrl 45019;
_kdRatioText = _gui displayCtrl 45015;
_xpBar = _gui displayCtrl 45011;
_xpText = _gui displayCtrl 45012;
_levelStat = _gui displayCtrl 45100;

switch(playerSide) do
{
	case west:
	{
		_sideWest ctrlSetText "TEAM";
		_sideOpfor ctrlSetText "ENEMY";
		_sideIndep ctrlSetText "ENEMY";
	};
	case opfor:
	{
		_sideOpfor ctrlSetText "TEAM";
		_sideIndep ctrlSetText "ENEMY";
		_sideWest ctrlSetText "ENEMY";
	};
	case independent:
	{
		_sideIndep ctrlSetText "TEAM";
		_sideWest ctrlSetText "ENEMY";
		_sideOpfor ctrlSetText "ENEMY";
	};
};

// XP BAR
[] call sd_fnc_levelData;
_percent = ((sd_xp / sd_xpNeed) * 100);
if((_percent <= 100) && (_percent > 1))then[{_percent = (_percent / 100)},{if(_percent <= 1)then{_percent = _percent}}];
_xpBar progressSetPosition (0 + _percent);
_xpText ctrlSetText format["%1 / %2",sd_xp,sd_xpNeed];

// HEALTH BAR
_healthText ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_healthBar progressSetPosition (1 - (damage player));

// KD RATIO BAR
if(sd_deaths isEqualTo 0 OR sd_kills isEqualTo 0) then {
	_kdBarPercent = 0;
	_kdBar progressSetPosition _kdBarPercent;
	_kdRatioText ctrlSetText "0";
} else {
	_kdBarPercent = ((sd_kills / sd_deaths) * 100);
	if(_kdBarPercent <= 100 && _kdBarPercent > 1) then [{_kdBarPercent = (_kdBarPercent / 100)},{if(_kdBarPercent <= 1)then{_kdBarPercent = _kdBarPercent}}]; 
	_kdBar progressSetPosition _kdBarPercent;
	_kdRatioText ctrlSetText format["%1",(round((sd_kills / sd_deaths) * (10 ^ 2)) / (10 ^ 2))]; 
};

// OTHER STUFF
_countIndep ctrlSetText format["%1",(playersNumber independent)];
_countBlue ctrlSetText format["%1",(playersNumber west)];
_countOpfor ctrlSetText format["%1",(playersNumber opfor)];
_countKillsWest ctrlSetText format["%1",sd_westCounterToClients];
_countKillsEast ctrlSetText format["%1",sd_eastCounterToClients];
_countKillsIndep ctrlSetText format["%1",sd_independentCounterToClients];
_levelStat ctrlSetText format ["LEVEL %1",sd_level];