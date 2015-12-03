#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
#define __SCVAR__(var) var = compileFinal (if(typeName var isEqualTo "STRING") then {var} else {str(var)})
/*
	File: init.sqf (server)
	Author: DeadP4xel

	Description:
	Main server init file.
*/
private["_version","_dllFile","_dllFile","_timeRaw","_timeArray","_timeFinal"];

[] call compile preProcessFileLineNumbers "\koth_server\config.sqf";

// INFISTAR CHECK
if(!isNil "INFISTARVERSION") then {
	if(call sd_disableInfiCheck) exitWith {__SVAR__(sd_admin_useInfiStar,FALSE)};
    diag_log format ["SD_SERVER:: INFISTAR FOUND (VERSION: %1)",INFISTARVERSION];
    __SVAR__(sd_admin_useInfiStar,TRUE);
} else {
    diag_log "SD_SERVER:: INFISTAR NOT FOUND";
    __SVAR__(sd_admin_useInfiStar,FALSE);
};

diag_log format ["SD_SERVER:: TICKET COUNTER SET TO: %1 TICKETS",sd_tickets];

sd_server_isReady = false;
publicVariable "sd_server_isReady";

// EXEC SOME SERVER SCRIPTS
[] spawn SCRIPTS_fnc_airDrop;
[] spawn SCRIPTS_fnc_functions;
[] spawn SCRIPTS_fnc_killCounter;
[] spawn SCRIPTS_fnc_killSystem;
[] call SCRIPTS_fnc_setTimeGlobal;

// DATABASE INIT
if(isNil {uiNamespace getVariable "sd_sql_id"}) then {
	// RANDOM ID GENERATOR FOR MAXIMUM SECURITY
	sd_sql_id = round(random(999999));
	__SVAR__(sd_sql_id,sd_sql_id);
	uiNamespace setVariable ["sd_sql_id",sd_sql_id];
	// VERSION CHECK OF EXTDB
	_version = "extDB2" callExtension "9:VERSION";
	if(_version isEqualTo "") exitWith {diag_log "EXTDB ERROR:: DLL FILE NOT FOUND ! CHECK THE INSTALLATION !"};
	if((parseNumber _version) < 64) exitWith {diag_log format["EXTDB ERROR:: KOTH NEED VERSION 64 OR HIGHER ! CURRENT VERSION: %1",_version];};
	// START EXTDB AND ADD DATABASE
	"extDB2" callExtension "9:ADD_DATABASE:KOTH";
	"extDB2" callExtension format ["9:ADD_DATABASE_PROTOCOL:KOTH:SQL_RAW_v2:%1:ADD_QUOTES",(call sd_sql_id)];
	// START LOGING FOR EXTDB
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "LOG") isEqualTo 1) then {
		"extDB2" callExtension "9:ADD_PROTOCOL:LOG:PUNISH:KOTH_PUNISHLOG";
		"extDB2" callExtension "9:ADD_PROTOCOL:LOG:HACKER:KOTH_HACKLOG";
		diag_log "EXTDB:: LOGGING IS ENABLED";
		diag_log "EXTDB:: PUNISH AND HACKER LOG CREATED";
	};
	// START STEAM API FOR EXTDB
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "STEAM") isEqualTo 1) then {
		STEAM_ID = round(random(999999));
		__SCVAR__(STEAM_ID);
		uiNamespace setVariable ["STEAM_ID",STEAM_ID];
		"extDB2" callExtension "9:START_VAC";
		"extDB2" callExtension format["9:ADD_PROTOCOL:STEAM_V2:%1",(call STEAM_ID)];
		diag_log "EXTDB:: STEAM/VAC IS ENABLED";
	};
	// START MISC API FOR EXTDB
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "MISC") isEqualTo 1) then {
		MISC_ID = round(random(999999));
		__SCVAR__(MISC_ID);
		uiNamespace setVariable ["MISC_ID",MISC_ID];
		"extDB2" callExtension format["9:ADD_PROTOCOL:MISC:%1",(call MISC_ID)];
		diag_log "EXTDB:: MISC IS ENABLED";
		_serverTime = "extDB2" callExtension format["0:%1:TIME:1",(call MISC_ID)];
		diag_log format ["EXTDB:: GLOBAL TIME (GMT+1): %1",_serverTime];
	};
	// START RCON API FOR EXTDB
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "RCON") isEqualTo 1) then {
		RCON_ID = round(random(999999));
		__SCVAR__(RCON_ID);
		uiNamespace setVariable ["RCON_ID",RCON_ID];
		"extDB2" callExtension "9:START_RCON:RCON";
		"extDB2" callExtension format["9:ADD_PROTOCOL:RCON:%1",(call RCON_ID)];
		_rconStatus = "extDB2" callExtension "9:RCON_STATUS";
		if(_rconStatus isEqualTo "[1]") then { 
			diag_log "EXTDB:: RCON IS ENABLED";
		} else {
			diag_log "EXTDB:: RCON DISABLED";
		};
	};
	"extDB2" callExtension "9:LOCK";
	_lockStatus = "extDB2" callExtension "9:LOCK_STATUS";
	if(_lockStatus isEqualTo "[1]") then {
		diag_log "EXTDB:: LOCK SUCCESSFULL";
	} else {
		diag_log "EXTDB:: LOCK FAILED";
	};
} else {
	sd_sql_id = uiNamespace getVariable "sd_sql_id";
	__SVAR__(sd_sql_id,sd_sql_id);
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "RCON") isEqualTo 1) then {
		RCON_ID = uiNamespace getVariable "RCON_ID";
		__SVAR__(RCON_ID,RCON_ID);
	};
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "STEAM") isEqualTo 1) then {
		STEAM_ID = uiNamespace getVariable "STEAM_ID";
		__SVAR__(STEAM_ID,STEAM_ID);
	};
	if(getNumber(configFile >> "CfgServerSettings" >> "DATABASE" >> "MISC") isEqualTo 1) then {
		MISC_ID = uiNamespace getVariable "MISC_ID";
		__SVAR__(MISC_ID,MISC_ID);
	};
};

// PROCEDURES
["CALL resetPunishedPlayers",1] call DB_fnc_queryHandler;
["CALL resetPlayerSide",1] call DB_fnc_queryHandler;
["CALL resetTeamkills",1] call DB_fnc_queryHandler;

// SERVER IS READY LETS PROCCED WITH OTHER STUFF
sd_server_isReady = true;
publicVariable "sd_server_isReady";