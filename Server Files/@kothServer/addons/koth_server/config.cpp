/*
	Author: DeadP4xel
*/
class DefaultEventhandlers;
class CfgPatches
{
	class koth_server
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		author[]= {"DeadP4xel"};
	};
};
class CfgServerSettings
{
	class DATABASE
	{
		RCON 	= true;
		VAC 	= true;
		MISC 	= true;
		LOG 	= true;
	};
};

class CfgFunctions
{
	class SQL
	{
	  tag = "DB";
	  class DATABASE
	  {
		file = "\koth_server\database";
		class queryHandler {};
		class insertData {};
		class getData {};
		class updateData {};
	  };
	};
	class SQL_HELPER
	{
		tag = "HELPER";
		class HELPER
		{
			file = "\koth_server\database\helper";
			class mresString {};
			class mresToArray {};
			class numberSafe {};
			class mresArray {};
		};
	};
	class SCRIPTS
	{
		tag = "SCRIPTS";
		class SCRIPTS
		{
			file = "\koth_server\scripts";
			class airDrop {};
			class killCounter {};
			class functions {};
			class killSystem {};
		};
	};

	class LOADOUT
	{
		tag = "LOUTS";
		class LOADOUT
		{
			file = "\koth_server\database\loadout";
			class insertNewPlayer {};
			class loadoutHandler {};
			class updateLoadouts {};
		};
	};
};