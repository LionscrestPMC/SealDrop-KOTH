/*
	File: fn_eventHandler.sqf
	Author: DeadP4xel

	Description:
	Public Variable Event Handlers..
*/
"sd_statsAddTKClient" addPublicVariableEventHandler 
{
	_packet = _this select 1;
	_killer = _packet select 0;
	_activate = _packet select 1;

	if(_activate) then {
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
};

"sd_statsAddKillClient" addPublicVariableEventHandler 
{
	_receive = 	_this select 1;
	_xp = 		_receive select 0;
	_kills = 	_receive select 1;

	sd_xp = sd_xp + _xp;
	sd_kills = sd_kills + _kills;
};

"sd_sideWin" addPublicVariableEventHandler
{
	_receive = _this select 1;
	_blufor = _receive select 0;
	_opfor  = _receive select 1;
	_indep  = _receive select 2;

	if(_blufor isEqualTo "TRUE") exitWith {
		[] call BASIS_fnc_updateData;
		["bluforWin",true,true,false] call BIS_fnc_endMission;
		playSound "roundEnd";
	};
	if(_opfor isEqualTo "TRUE") exitWith {
		[] call BASIS_fnc_updateData;
		["opforWin",true,true,false] call BIS_fnc_endMission;
		playSound "roundEnd";
	};
	if(_indep isEqualTo "TRUE") exitWith {
		[] call BASIS_fnc_updateData;
		["indepWin",true,true,false] call BIS_fnc_endMission;
		playSound "roundEnd";
	};
};