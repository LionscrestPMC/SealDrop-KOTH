/*
	File: airDrop.sqf
	Author: RYN_Ryan
	Modified: DeadP4xel
*/
private["_airDropGoingOn","_airdrop_helicopter_main","_airdrop_helicopter_scnd","_airdrop_positions","_airdrop_time_min","_airdrop_time_max"];
_airDropGoingOn = false;
_airdrop_helicopter_main = "B_Heli_Transport_03_unarmed_F";
_airdrop_helicopter_scnd = "B_Heli_Attack_01_F";
_airdrop_positions = [[3420.5,12788.4,0.00160623],[3801.81,12668.5,0.00139046],[3662.66,12600.6,0.00123215],[3766.64,12887.9,0.000961304],[3820.57,13306.5,0.00163555],[3097.97,13202.3,0.001194]];
_airdrop_time_min = 1 * 300;
_airdrop_time_max = 2 * 600;


if(_airDropGoingOn) exitWith {};
_toWait = (random (_airdrop_time_max - _airdrop_time_min)) + _airdrop_time_min;
uiSleep _toWait;
_airDropGoingOn = true;

// AIRDROP STARTEN
["AIRDROP\nA helicopter is going to drop a supplycrate in 15 minutes! The drop-location will be transmitted soon","hint",true,false] spawn BIS_fnc_MP;
_poses = count _airdrop_positions;
_inArr = floor(random _poses);
_dest = _airdrop_positions select _inArr;
uiSleep 300;
_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [500,500];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "AIRDROP";
"Airdropmarkertext" setMarkerType "mil_warning";

["AIRDROP\n10 minutes until the helicopter will drop the supplies! Check your map for the drop-location","hint",true,false] spawn BIS_fnc_MP;
uiSleep 300;
["AIRDROP\n5 minute until the helicopter will drop the supplies","hint",true,false] spawn BIS_fnc_MP;
uiSleep 60;
["AIRDROP\n4 minute until the helicopter will drop the supplies","hint",true,false] spawn BIS_fnc_MP;
uiSleep 60;
["AIRDROP\n3 minute until the helicopter will drop the supplies","hint",true,false] spawn BIS_fnc_MP;
uiSleep 60;
["AIRDROP\n2 minute until the helicopter will drop the supplies","hint",true,false] spawn BIS_fnc_MP;
uiSleep 60;
["AIRDROP\n1 minute until the helicopter will drop the supplies","hint",true,false] spawn BIS_fnc_MP;

heli1 = CreateVehicle [_airdrop_helicopter_main, [7950, 9667, 0], [], 0, "FLY"];
heli2 = CreateVehicle [_airdrop_helicopter_scnd, [7950, 9700, 0], [], 0, "FLY"];
heli3 = CreateVehicle [_airdrop_helicopter_scnd, [7950, 9630, 0], [], 0, "FLY"];
heli1 allowDamage false;
heli2 allowDamage false;
heli3 allowDamage false;

_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup2 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup3 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x moveInDriver heli1} forEach units _mygroup1;
{_x moveInDriver heli2} forEach units _mygroup2;
{_x moveInDriver heli3} forEach units _mygroup3;

_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[2380.47,22267.8,0], 0];
_mygroup2 addWaypoint [_dest, 0];
_mygroup2 addWaypoint [[2380.47,22267.8,0], 0];
_mygroup3 addWaypoint [_dest, 0];
_mygroup3 addWaypoint [[2380.47,22267.8,0], 0];

_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];
"airbox_marker" setMarkerColor "ColorBlue";
"airbox_marker" setMarkerText " AIRDROP-CHOPPER";
"airbox_marker" setMarkerType "mil_destroy";

_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_containerdummy attachTo [heli1,[0,0,-3.5]];
_containerdummy setDir 90;


while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1};
["AIRDROP\nThe supplies have been dropped!\n20 minutes until self destruction","hint",true,false] spawn BIS_fnc_MP;

deleteVehicle _containerdummy;
uiSleep 0.1;
_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
uiSleep 0.1;
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos _container;uiSleep 1;};
detach _container;
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2) + 0.5];
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
uiSleep 6;
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deleteVehicle _container;
uiSleep 0.5;
_box = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"];
_box allowDamage false;
_smoke = "SmokeShellBlue" createVehicle [getpos _box select 0,getpos _box select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;

uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["launch_NLAW_F", 3];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addMagazineCargoGlobal ["NLAW_F", 6];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["srifle_GM6_SOS_F", 2];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 20];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addMagazineCargoGlobal ["srifle_LRR_SOS_F", 2];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["7Rnd_408_Mag", 20];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addMagazineCargoGlobal ["LMG_Mk200_MRCO_F", 4];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 8];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["srifle_EBR_SOS_F", 5];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["20Rnd_762x51_Mag", 10];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["launch_B_Titan_short_F", 3];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["Titan_AT", 6];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["srifle_DMR_01_SOS_F", 5];};
uiSleep 0.1;
_var=floor(random 2);
if (_var isEqualTo 1) then {_box addWeaponCargoGlobal ["10Rnd_762x54_Mag", 10];};
uiSleep 0.1;

uiSleep 300;
deleteVehicle heli1;
deleteVehicle heli2;
deleteVehicle heli3;
uiSleep 600;
deleteVehicle _box; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-21,(getPos _box select 1)+21,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-1,(getPos _box select 1)+56,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+23,(getPos _box select 1)-75,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-50,(getPos _box select 1)+1,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+87,(getPos _box select 1)-22,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+0,(getPos _box select 1)-0,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+20,(getPos _box select 1)-20,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-100,(getPos _box select 1)+56,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-55,(getPos _box select 1)+123,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+577,(getPos _box select 1)-83,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+35,(getPos _box select 1)-99,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-431,(getPos _box select 1)-431,0];
"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;
deleteMarker "airbox_marker";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";
_airDropGoingOn = false;