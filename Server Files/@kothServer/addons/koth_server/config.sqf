#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
/*
	File: config.sqf
	Author: DeadP4xel

	Description:
	Master server configuration file
*/

/* ********************************************************************************* */
/* ******************************* TICKET CONFIG *********************************** */
/* ********************************************************************************* */

sd_tickets = 300;							// TICKETS BEFORE ROUND END         			DEFAULT: 300

/* ********************************************************************************* */
/* ******************************* TIMEZONE CONFIG ********************************* */
/* ********************************************************************************* */

__SVAR__(sd_timeZoneMaster,TRUE); 			// ENABLE OR DISABLE THE SYSTEM 				DEFAULT: TRUE
__SVAR__(sd_disableRealTime,FALSE); 		// ENABLE OR DISABLE THE REAL TIME 				DEFAULT: FALSE
__SVAR__(sd_timeZone,1);  					// WHICH REAL GMT TIME SHOULD BE USED 			DEFAULT: 1

__SVAR__(sd_timeMorning,FALSE);				// START ON MORNING 							DEFAULT: FALSE
__SVAR__(sd_timeNoon,FALSE); 				// START ON NOON 								DEFAULT: FALSE
__SVAR__(sd_timeEvening,FALSE); 			// START IN EVENING 							DEFAULT: FALSE
__SVAR__(sd_timeNight,FALSE);				// START IN NIGHT 								DEFAULT: FALSE



/* ********************************************************************************* */
/* ****************************** DO NOT TOUCH BELOW ******************************* */
/* ********************************************************************************* */

publicVariable "sd_tickets";