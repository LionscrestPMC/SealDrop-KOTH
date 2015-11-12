/*
	File: fn_escMenu.sqf
	Author: DeadP4xel
	
	Description:
	CombatLog and disable FieldManual
*/
private["_buttonAbort","_buttonEscMenuBot","_fieldLeftTitle","_buttonEscMenuTop","_fieldRightTitle","_buttonField","_escMenu"];
disableSerialization;
_escMenu = 
{
	private["_buttonAbort","_query","_timer"];
	disableSerialization;
	_timer = {
		private["_buttonAbort","_cooldown"];
		disableSerialization;
		_buttonAbort = (findDisplay 49) displayCtrl 104;
		_cooldown = diag_tickTime + (call sd_escapeTime);
		waitUntil {
			_buttonAbort ctrlSetText format[localize "STR_Script_EscCD",[(_cooldown - diag_tickTime),"SS.MS"] call BIS_fnc_secondsToString];
			_buttonAbort ctrlCommit 0;
			round(_cooldown - diag_tickTime) <= 0 || isNull (findDisplay 49)
		};
		_buttonAbort ctrlSetText localize "STR_Global_Cancel";
		_buttonAbort ctrlCommit 0;
	};
	_buttonAbort = (findDisplay 49) displayCtrl 104;
	_query = [] spawn _timer;
	waitUntil {scriptDone _query OR isNull (findDisplay 49)};
	_buttonAbort ctrlEnable true;
	[] call BASIS_fnc_updateData;
};
while {true} do
{
	waitUntil {!isNull (findDisplay 49)};
	_buttonAbort = (findDisplay 49) displayCtrl 104;
	_buttonAbort ctrlEnable false;

	_buttonField = (findDisplay 49) displayCtrl 122;
	_buttonField ctrlShow false;

	_buttonEscMenuTop = (findDisplay 49) displayCtrl 2;
	_buttonEscMenuTop ctrlEnable false;
	_buttonEscMenuTop ctrlSetText localize "STR_Script_escMenuTop";

	_buttonEscMenuBot = (findDisplay 49) displayCtrl 103;
	_buttonEscMenuBot ctrlEnable false;
	_buttonEscMenuBot ctrlSetText localize "STR_Script_escMenuBot";

	_fieldLeftTitle = (findDisplay 49) displayCtrl 523;
	_fieldLeftTitle ctrlSetText profileName;

	_fieldRightTitle = (findDisplay 49) displayCtrl 109;
	_fieldRightTitle ctrlShow false;
	[] spawn _escMenu;
	waitUntil {isNull (findDisplay 49)};
};