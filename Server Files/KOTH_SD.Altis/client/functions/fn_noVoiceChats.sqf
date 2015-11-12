/*
  File: fn_noVoiceChats.sqf
  Author: KiloSwiss
  Modified: DeadP4xel
*/
private ["_pUID"];
if(hasInterface) then {'' spawn {
  waitUntil{!isNil {getPlayerUID player}};
  _pUID = getPlayerUID player;

  VC_disabledChannels = sd_disableChannels;
  VC_adminList = sd_admin_players;
  VC_playerVONChannels = sd_playerVONChannels;
  VC_groupLeaderVONChannels = sd_groupLeaderVONChannels;
  VC_adminVONChannels = sd_adminVONChannels;
  VC_commanderVONChannels = (if(1 in VC_groupLeaderVONChannels)then[{VC_groupLeaderVONChannels +[2]},{VC_groupLeaderVONChannels}]);
  {
    if(typeName _x != "ARRAY") exitWith {};
    true
  } count [VC_disabledChannels,VC_adminList,VC_playerVONChannels,VC_groupLeaderVONChannels,VC_commanderVONChannels,VC_adminVONChannels];
_pUID spawn { 
    while {true} do
    { 
      uiSleep .5;
      if(_this in VC_adminList) then {
        VC_allowedChannels = VC_adminVONChannels;
      } else {
        if(serverCommandAvailable "#logout")then{
          VC_allowedChannels = VC_adminVONChannels;
        } else {
          if(count units group player isEqualTo 1)then{
            VC_allowedChannels = VC_playerVONChannels;
          } else {
            if(player != leader group player)then{
              VC_allowedChannels = VC_playerVONChannels;
            } else {
              VC_allowedChannels = (if(vehicle player != player && effectiveCommander (vehicle player) isEqualTo player)then[{VC_commanderVONChannels},{VC_groupLeaderVONChannels}]);
            };
          };
        };
      };
      if(isNil "VC_openChannels")then{VC_openChannels = []};
      if !(VC_openChannels isEqualTo VC_allowedChannels) then {
        for "_i" from 0 to 6 do {
          _i enableChannel (if(_i in VC_allowedChannels)then[{true},{if(_i in VC_disabledChannels)then[{false},{true}]}]);
        };
        VC_openChannels = VC_allowedChannels;
      };
    }; 
  };
  VoN_ChannelId_fnc = {
    switch _this do {
      case localize "str_channel_global" : {["str_channel_global",0]};
      case localize "str_channel_side" : {["str_channel_side",1]};
      case localize "str_channel_command" : {["str_channel_command",2]};
      case localize "str_channel_group" : {["str_channel_group",3]};
      case localize "str_channel_vehicle" : {["str_channel_vehicle",4]};
      case localize "str_channel_direct" : {["str_channel_direct",5]};
      default {["",-1]};
    }
  };
  VoN_Event_fnc = {
    VoN_currentTxt = _this;
    VoN_channelId = VoN_currentTxt call VoN_ChannelId_fnc;
    if((VoN_channelId select 1) >= 0 && !((VoN_channelId select 1) in VC_allowedChannels))then{
      playSound "Alarm";
      titleText [format ["Talking in %1 is not allowed!",str localize (VoN_channelId select 0)], "WHITE IN", 1];
      setCurrentChannel 5;
    };
  };
  [] spawn { private "_fncDown";
    VoN_isOn = false;
    VoN_currentTxt = "";
    VoN_channelId = -1;
    _fncDown = {
      if (!VoN_isOn) then {
        if (!isNull findDisplay 55 && !isNull findDisplay 63) then {
          VoN_isOn = true;
          ctrlText (findDisplay 63 displayCtrl 101) call VoN_Event_fnc;
          findDisplay 55 displayAddEventHandler ["Unload", {
            VoN_isOn = false;
            "" call VoN_Event_fnc;
          }]; 
        };
      };
      false
    };
    _fncUp = {
      if (VoN_isOn) then {
        _ctrlText = ctrlText (findDisplay 63 displayCtrl 101);
        if (VoN_currentTxt != _ctrlText) then {
          _ctrlText call VoN_Event_fnc;
        };
      };
      false
    };
    waitUntil {!isNull findDisplay 46};
    findDisplay 46 displayAddEventHandler ["KeyDown", _fncDown];
    findDisplay 46 displayAddEventHandler ["KeyUp", _fncUp];
    findDisplay 46 displayAddEventHandler ["MouseButtonDown", _fncDown];
    findDisplay 46 displayAddEventHandler ["MouseButtonUp", _fncUp];
    findDisplay 46 displayAddEventHandler ["JoystickButton", _fncDown];
  };
}};