/*
  File: killCounter.sqf
  Author: DeadP4xel 

  Description: 
  Server Side Kill ticker
*/
if(isServer) then
{
  // VARIABLES
  if(isNil 'sd_westCounterToClients') then 
  {
  	sd_westCounterToClients = 0; 
    publicVariable 'sd_westCounterToClients';
  };
  if(isNil 'sd_eastCounterToClients') then 
  {
    sd_eastCounterToClients = 0; 
    publicVariable 'sd_eastCounterToClients';
  };
  if(isNil 'sd_independentCounterToClients') then
  {
    sd_independentCounterToClients = 0;
    publicVariable 'sd_independentCounterToClients';
  };

  // EV HANDLERS
  'sd_westCounterToServer' addPublicVariableEventHandler {
    sd_westCounterToClients = sd_westCounterToClients + 1; 
    publicVariable 'sd_westCounterToClients';
    if(sd_westCounterToClients >= sd_tickets) then {
      sd_sideWin = ["TRUE","FALSE","FALSE"]; 
      {
        owner _x publicVariableClient "sd_sideWin";
      } forEach allPlayers;
    };
  };   
  'sd_eastCounterToServer' addPublicVariableEventHandler {
    sd_eastCounterToClients = sd_eastCounterToClients + 1;
    publicVariable 'sd_eastCounterToClients';
    if(sd_eastCounterToClients >= sd_tickets) then {
      sd_sideWin = ["FALSE","TRUE","FALSE"]; 
      {
        owner _x publicVariableClient "sd_sideWin";
      } forEach allPlayers;
    };
  }; 
  'sd_independentCounterToServer' addPublicVariableEventHandler {
    sd_independentCounterToClients = sd_independentCounterToClients + 1;
    publicVariable 'sd_independentCounterToClients';
    if(sd_independentCounterToClients >= sd_tickets) then {
      sd_sideWin = ["FALSE","FALSE","TRUE"]; 
      {
        owner _x publicVariableClient "sd_sideWin";
      } forEach allPlayers;
    };
  };
};