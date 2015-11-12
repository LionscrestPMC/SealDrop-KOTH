/*
	File: fn_levelData.sqf
	Author: DeadP4xel

	Description:
	Store the level and Rank information
*/
if(sd_xp >= 245000) then {	
	sd_level = 50;
	sd_xpNeed = 260000;
} else {
if(sd_xp >= 220000) then {	
	sd_level = 49;
	sd_xpNeed = 245000;
} else {
if(sd_xp >= 210000) then {	
	sd_level = 48;
	sd_xpNeed = 220000;
} else {
if(sd_xp >= 190000) then {	
	sd_level = 47;
	sd_xpNeed = 210000;
} else {
if(sd_xp >= 170000) then {	
	sd_level = 46;
	sd_xpNeed = 190000;
} else {
if(sd_xp >= 150000) then {	
	sd_level = 45;
	sd_xpNeed = 170000;
} else {
if(sd_xp >= 140000) then {	
	sd_level = 44;
	sd_xpNeed = 150000;
} else {
if(sd_xp >= 130000) then {	
	sd_level = 43;
	sd_xpNeed = 140000;
} else {
if(sd_xp >= 120000) then {	
	sd_level = 42;
	sd_xpNeed = 130000;
} else {
if(sd_xp >= 110000) then {	
	sd_level = 41;
	sd_xpNeed = 120000;
} else {
if(sd_xp >= 100000) then {	
	sd_level = 40;
	sd_xpNeed = 110000;
} else {
if(sd_xp >= 90000) then {	
	sd_level = 39;
	sd_xpNeed = 100000;
} else {
if(sd_xp >= 85000) then {	
	sd_level = 38;
	sd_xpNeed = 90000;
} else {
if(sd_xp >= 80000) then {	
	sd_level = 37;
	sd_xpNeed = 85000;
} else {
if(sd_xp >= 75000) then {	
	sd_level = 36;
	sd_xpNeed = 80000;
} else {
if(sd_xp >= 70000) then {	
	sd_level = 35;
	sd_xpNeed = 75000;
} else {
if(sd_xp >= 65000) then {	
	sd_level = 34;
	sd_xpNeed = 70000;
} else {
if(sd_xp >= 60000) then {	
	sd_level = 33;
	sd_xpNeed = 65000;
} else {
if(sd_xp >= 55000) then {	
	sd_level = 32;
	sd_xpNeed = 60000;
} else {
if(sd_xp >= 50000) then {	
	sd_level = 31;
	sd_xpNeed = 55000;
} else {
if(sd_xp >= 45000) then {	
	sd_level = 30;
	sd_xpNeed = 50000;
} else {
if(sd_xp >= 40000) then {	
	sd_level = 29;
	sd_xpNeed = 45000;
} else {
if(sd_xp >= 37000) then {	
	sd_level = 28;
	sd_xpNeed = 40000;
} else {
if(sd_xp >= 34000) then {	
	sd_level = 27;
	sd_xpNeed = 37000;
} else {
if(sd_xp >= 31000) then {	
	sd_level = 26;
	sd_xpNeed = 34000;
} else {
if(sd_xp >= 28000) then {	
	sd_level = 25;
	sd_xpNeed = 31000;
} else {
if(sd_xp >= 25000) then {	
	sd_level = 24;
	sd_xpNeed = 28000;
} else {
if(sd_xp >= 22000) then {	
	sd_level = 23;
	sd_xpNeed = 25000;
} else {
if(sd_xp >= 19000) then {	
	sd_level = 22;
	sd_xpNeed = 22000;
} else {
if(sd_xp >= 16000) then {
	sd_level = 21;
	sd_xpNeed = 19000;
} else {
if(sd_xp >= 14000) then {
	sd_level = 20;
	sd_xpNeed = 16000;
} else {
if(sd_xp >= 12000) then {
	sd_level = 19;
	sd_xpNeed = 14000;
} else {
if(sd_xp >= 10000) then {
	sd_level = 18;
	sd_xpNeed = 12000;
} else {
if(sd_xp >= 9000) then {
	sd_level = 17;
	sd_xpNeed = 10000;
} else {
if(sd_xp >= 8000) then {
	sd_level = 16;
	sd_xpNeed = 9000;
} else {
if(sd_xp >= 7000) then {
	sd_level = 15;
	sd_xpNeed = 8000;
} else {
if(sd_xp >= 6200) then {
	sd_level = 14;
	sd_xpNeed = 7000;
} else {
if(sd_xp >= 5400) then {
	sd_level = 13;
	sd_xpNeed = 6200;
} else {
if(sd_xp >= 4800) then {
	sd_level = 12;
	sd_xpNeed = 5400;
} else {
if(sd_xp >= 4200) then {
	sd_level = 11;
	sd_xpNeed = 4800;
} else {
if(sd_xp >= 3600) then {
	sd_level = 10;
	sd_xpNeed = 4200;
} else {
if(sd_xp >= 3100) then {
	sd_level = 9;
	sd_xpNeed = 3600;
} else {
if(sd_xp >= 2600) then {
	sd_level = 8;
	sd_xpNeed = 3100;
} else {
if(sd_xp >= 2100) then {
	sd_level = 7;
	sd_xpNeed = 2600;
} else {
if(sd_xp >= 1700) then {
	sd_level = 6;
	sd_xpNeed = 2100;
} else {
if(sd_xp >= 1300) then 
{
	sd_level = 5;
	sd_xpNeed = 1700;
} else {
if(sd_xp >= 900) then {
	sd_level = 4;
	sd_xpNeed = 1300;
} else {
if(sd_xp >= 600) then {
	sd_level = 3;
	sd_xpNeed = 900;
} else {
if(sd_xp >= 300) then {
	sd_level = 2;
	sd_xpNeed = 600;
} else {
	sd_level = 1;
	sd_xpNeed = 300;
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};
};