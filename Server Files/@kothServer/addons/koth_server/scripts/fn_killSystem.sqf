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
	_ownerData = (_receive select 2);

	if(typeName _ownerData isEqualTo "ARRAY") then {
		sd_statsAddKillClient = [_xp,_kills];
		{
			owner _x publicVariableClient "sd_statsAddKillClient";
		} forEach _ownerData;
	} else {
		sd_statsAddKillClient = [_xp,_kills];
		owner _ownerData publicVariableClient "sd_statsAddKillClient";
	};
};

"sd_statsAddTKServer" addPublicVariableEventHandler 
{
	_packet = _this select 1;
	_killer = _packet select 0;

	sd_statsAddTKClient = [_killer,TRUE];
	owner _killer publicVariableClient "sd_statsAddKillClient";
};