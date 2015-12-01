/*
	File: fn_killSystem.sqf 
	Author: DeadP4xel

	Description:
	Sends data to the client
*/
"sd_statsAddKillServer" addPublicVariableEventHandler 
{
	_receive = _this select 1;
	_xp = (_receive select 0);
	_kills = (_receive select 1);
	_owner = owner (_receive select 2);

	sd_statsAddKillClient = [_xp,_kills];
	_owner publicVariableClient "sd_statsAddKillClient";
};

"sd_statsAddTKServer" addPublicVariableEventHandler 
{
	_packet = _this select 1;
	_killer = _packet select 0;
	_owner = owner (_packet select 0);

	sd_statsAddTKClient = [_killer,TRUE];
	_owner publicVariableClient "sd_statsAddKillClient";
};