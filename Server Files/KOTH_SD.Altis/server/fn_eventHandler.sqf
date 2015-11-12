/*
	File: fn_eventHandler.sqf
	Author: DeadP4xel

	Description:
	Public Variable Event Handlers..
*/
"sd_statsAddTK" addPublicVariableEventHandler 
{
	_killer = _this select 1;
	sd_punish_warnings = sd_punish_warnings + 1; 
	if(sd_punish_warnings < (call sd_punish_warningsMax)) then {
		titleText [format [localize "STR_Script_punishWarning",sd_punish_warnings,(call sd_punish_warningsMax)], "WHITE IN"];
	} else {
		titleText [format [localize "STR_Script_punishWarning2",sd_punish_warnings,(call sd_punish_warningsMax)], "WHITE IN"];
	};
	if(sd_punish_warnings >= (call sd_punish_warningsMax)) then {
		sd_punishBan = 1; 
		["Teamkill",false,true] call BIS_fnc_endMission; 
	};
	if(alive _killer) then {
		[] call BASIS_fnc_updateData;
	};
};
"sd_statsAddKill" addPublicVariableEventHandler 
{
	_receive 	= _this select 1;
	_xpAdd 		= _receive select 0;
	_killsAdd 	= _receive select 1;

	sd_kills  = sd_kills + _killsAdd;
	sd_xp 	  = sd_xp + _xpAdd;
	[] call BASIS_fnc_updateData;
};
"sd_sideWin" addPublicVariableEventHandler
{
	private["_receive"];
	_receive = _this select 1;
	_blufor = _receive select 0;
	_opfor  = _receive select 1;
	_indep  = _receive select 2;

	if(_blufor == "TRUE") exitWith {
		["bluforWin",true,true,false] call BIS_fnc_endMission;
		playSound "roundEnd";
	};
	if(_opfor == "TRUE") exitWith {
		["opforWin",true,true,false] call BIS_fnc_endMission;
		playSound "roundEnd";
	};
	if(_indep == "TRUE") exitWith {
		["indepWin",true,true,false] call BIS_fnc_endMission;
		playSound "roundEnd";
	};
};