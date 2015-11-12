/*
  Author: DeadP4xel
*/
// MAIN GAME SETTINGS
enableSaving [false,false];
enableEnvironment false;
enableRadio false;
enableSentences false;

// SPAWNTRUCK SYSTEM
respawnTruck = compile preprocessFileLineNumbers "server\fn_spawnTruck.sqf";
if(isNil "spawntruck_blu") then {spawntruck_blu = 0};
if(isNil "spawntruck_red") then {spawntruck_red = 0};
if(isNil "spawntruck_ind") then {spawntruck_ind = 0};
if(isServer) then {
	"bluf" spawn respawnTruck; 
	"redf" spawn respawnTruck; 
	"indf" spawn respawnTruck;
};

// NO FOG AND NO RAIN
[] spawn {
	while{true} do {
		uiSleep 10;
		200 setFog 0;
		uiSleep 590;
	};
};
[] spawn {
	while{true} do {
		uiSleep 10;
		200 setRain 0;
		uiSleep 590;
	};
};