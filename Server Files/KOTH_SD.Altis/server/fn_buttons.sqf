/*
    File: fn_buttons.sqf
    Author: DeadP4xel

    Description:
    Handle the buttons..
*/
private ["_handler","_shift","_alt","_buttons","_ctrl","_alt","_ctrlKey"];
_ctrl = _this select 0;     // CTRL KEY
_buttons = _this select 1;  // BUTTON CASES
_shift = _this select 2;    // SHIFT KEY
_ctrlKey = _this select 3;  // CTRL KEY
_alt = _this select 4;      // ALT KEY
_handler = false;           // HANDLER
switch(_buttons) do
{
    case 201: // PAGEUP - SOUND 100%
    {
        if(soundVolume isEqualTo 1) exitWith {cutText [localize "STR_Script_VolumeMaximum","PLAIN DOWN"];};
        if(soundVolume < 1) then {
            [] call sd_fnc_volumeBalancerHigh;
            cutText [format [localize "STR_Script_VolumeHint",soundVolume * 100],"PLAIN DOWN"];
        };
    };
    case 209: // PAGEDOWN - SOUND 10%
    {
        if(soundVolume isEqualTo 0) exitWith {cutText [localize "STR_Script_VolumeMinimum","PLAIN DOWN"];};
        if(soundVolume > 0) then {
            [] call sd_fnc_volumeBalancerLow;
            cutText [format [localize "STR_Script_VolumeHint",soundVolume * 100],"PLAIN DOWN"];
        };
    };
    case 62: // ALT+F4 = SAVING + F4 BLOCK 
    {
        if(_alt) then {
            diag_log format ["SD_ANTIHACK:: PLAYER %1 PRESSED ALT+F4",profileName];
            titleText [localize "STR_Script_rageQuit", "WHITE IN",1];
            [] call BASIS_fnc_updateData;
        } else {
            if((getPlayerUID player) in sd_admin_players) exitWith {};
            hintSilent localize "STR_Script_KeyBlock";
            closeDialog 0;
            _handler = false;
        };
    };
    case 57: // SPACE FOR JUMP
    {
        if(isNil "jumpTime") then {jumpTime = 0};
        if(animationState player != "AovrPercMrunSrasWrflDf" && isTouchingGround player && (stance player) isEqualTo "STAND" && (speed player) > 2 && ((diag_tickTime - jumpTime) > 1.5)) then 
        {
            if(!(call sd_jumpMaster)) exitWith {};
            jumpTime = diag_tickTime;
            [player,true] spawn sd_fnc_playerJump;
            [[player,false],"sd_fnc_playerJump",nil,FALSE] call BIS_fnc_MP;
            _handler = true;
        };
    };
    case 41: // ^ For Player Stats
    {
        if(alive player) then {
            [] call sd_fnc_playerStats;
        };
    };
    case 38:
    {
        if(_shift) then {
            [] spawn sd_fnc_repairVehicle;
        };
    };
    case 59: // F1
	{
        if((getPlayerUID player) in sd_admin_players) then {
            if(call sd_admin_useInfiStar) exitWith {};
            if(_shift) then {
                [] call sd_fnc_adminTeleport;
            };
        } else {
            hintSilent localize "STR_Script_KeyBlock";
    	    closeDialog 0;
    	    _handler = false;
        };
    };
    case 60: // F2
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 61: // F3
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 63: // F5
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 64: //F6 key
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 65: // F7 Key
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        if(call sd_admin_useInfiStar) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 66: //F8 key
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        if(call sd_admin_useInfiStar) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 67: //F9 key
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 68: //10 key
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
    case 211: //DELETE key
    {
        if((getPlayerUID player) in sd_admin_players) exitWith {};
        hintSilent localize "STR_Script_KeyBlock";
    	closeDialog 0;
    	_handler = false;
    };
};
_handler;
