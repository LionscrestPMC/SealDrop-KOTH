/*
	File: fn_shopCfg.sqf
	Author: DeadP4xel

	Description:
	MASTER SHOP CLASSNAME FILE
*/
private ["_controller"];

// VARIABLES & ERROR CHECKS
_controller = [_this,0,"",[""]] call BIS_fnc_param;

// SWITCH THE SHOP
switch(_controller) do
{
	case "weapons":
	{
		switch(true) do
		{
			default
			{
				["Weapons",
					[
						["arifle_MXC_F",nil,2],
						["arifle_MX_F",nil,1],
						["arifle_MX_SW_F",nil,4],
						["arifle_MX_GL_F",nil,8],
						["arifle_MXM_F",nil,9],
						["arifle_SDAR_F",nil,3],
						["srifle_EBR_F",nil,12],
						["arifle_Mk20_F",nil,13],
						["arifle_Mk20C_F",nil,11],
						["arifle_Mk20_GL_F",nil,14],
						["arifle_TRG20_F",nil,16],
						["arifle_TRG21_F",nil,17],
						["arifle_TRG21_GL_F",nil,19],
						["arifle_Katiba_C_F",nil,3],
						["arifle_Katiba_F",nil,1],
						["arifle_Katiba_GL_F",nil,8],
						["srifle_GM6_F",nil,50],
						["srifle_LRR_F",nil,40],
						["srifle_DMR_01_F",nil,30],
						["LMG_Mk200_F",nil,20],
						["LMG_Zafir_F",nil,45],
						["MMG_01_base_F",nil,46],
						["hgun_PDW2000_F",nil,1],
						["SMG_01_F",nil,5],
						["SMG_02_F",nil,8],
						["hgun_P07_F",nil,1],
						["hgun_Rook40_F",nil,4],
						["hgun_ACPC2_F",nil,10],
						["hgun_Pistol_heavy_01_F",nil,25],
						["hgun_Pistol_heavy_02_F",nil,25],
						["launch_NLAW_F",nil,40],
						["launch_RPG32_F",nil,20],
						["launch_B_Titan_F",nil,50],
						["launch_B_Titan_short_F",nil,50],
						["MMG_02_base_F",nil,39],
						["srifle_DMR_02_F",nil,30],
						["srifle_DMR_03_F",nil,50],
						["srifle_DMR_04_F",nil,50],
						["srifle_DMR_05_blk_F",nil,40],
						["srifle_DMR_06_camo_F",nil,50]
					]
				];
			};
		};
	};

	case "ammo":
	{
		switch (true) do
		{
			default
			{
				["Ammunition",
					[
						["30Rnd_65x39_caseless_mag",nil,1],
						["30Rnd_65x39_caseless_mag_Tracer",nil,1],
						["100Rnd_65x39_caseless_mag",nil,1],
						["20Rnd_556x45_UW_mag",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,10],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,10],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,10],
						["30Rnd_65x39_caseless_green",nil,10],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,10],
						["5Rnd_127x108_Mag",nil,10],
						["7Rnd_408_Mag",nil,10],
						["10Rnd_762x51_Mag",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["200Rnd_65x39_cased_Box_Tracer",nil,10],
						["150Rnd_762x51_Box",nil,10],
						["150Rnd_762x51_Box_Tracer",nil,10],
						["30Rnd_9x21_Mag",nil,10],
						["30Rnd_45ACP_Mag_SMG_01",nil,10],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,10],
						["16Rnd_9x21_Mag",nil,10],
						["9Rnd_45ACP_Mag",nil,10],
						["11Rnd_45ACP_Mag",nil,10],
						["6Rnd_45ACP_Cylinder",nil,10],
						["150Rnd_93x64_Mag",nil,10],
						["10Rnd_338_Mag",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["10Rnd_127x54_Mag",nil,10],
						["10Rnd_93x64_DMR_05_Mag",nil,10],
						["20Rnd_762x51_Mag",nil,10]
					]
				];
			};
		};
	};

	case "explosive":
	{
		switch(true) do
		{
			default
			{
				["Explosive",
					[
						["NLAW_F",nil,30],
						["RPG32_F",nil,25],
						["RPG32_HE_F",nil,25],
						["Titan_AA",nil,45],
						["Titan_AT",nil,45],
						["Titan_AP",nil,45],
						["B_IR_Grenade",nil,20],
						["HandGrenade","Grenade",20],
						["SmokeShell",nil,8],
						["SmokeShellBlue",nil,8],
						["SmokeShellGreen",nil,8],
						["SmokeShellOrange",nil,8],
						["SmokeShellPurple",nil,8],
						["SmokeShellRed",nil,8],
						["SmokeShellYellow",nil,8],
					    ["1Rnd_HE_Grenade_shell",nil,15],
					    ["UGL_FlareWhite_F",nil,10],
					    ["UGL_FlareGreen_F",nil,10],
					    ["UGL_FlareRed_F",nil,10],
					    ["UGL_FlareYellow_F",nil,10],
					    ["UGL_FlareCIR_F",nil,10],
					    ["1Rnd_Smoke_Grenade_shell",nil,10],
					    ["1Rnd_SmokeRed_Grenade_shell",nil,10],
					    ["1Rnd_SmokeGreen_Grenade_shell",nil,10],
					    ["1Rnd_SmokeYellow_Grenade_shell",nil,10],
					    ["1Rnd_SmokePurple_Grenade_shell",nil,10],
					    ["1Rnd_SmokeBlue_Grenade_shell",nil,10],
					    ["1Rnd_SmokeOrange_Grenade_shell",nil,10]
					]
				];
			};
		};
	};

	case "scopes":
	{
		switch (true) do
		{
			default
			{
				["Scopes",
					[
						["ItemWatch",nil,1],
						["ItemCompass",nil,1],
						["ItemGPS",nil,1],		
						["ItemRadio",nil,1],
						["ItemMap",nil,1],
						["MineDetector",nil,1],
						["Binocular",nil,1],
						["Rangefinder",nil,1],
						["NVGoggles",nil,1],
						["Laserbatteries",nil,1],
						["Laserdesignator",nil,1],
						["FirstAidKit",nil,1],
						["Medikit",nil,1],
						["ToolKit",nil,1],
						["muzzle_snds_H",nil,1],
						["muzzle_snds_L",nil,1],
						["muzzle_snds_M",nil,1],
						["muzzle_snds_B",nil,1],
						["muzzle_snds_H_MG",nil,1],
						["muzzle_snds_338_black",nil,1],
						["muzzle_snds_93mmg",nil,1],
						["muzzle_snds_acp",nil,1],
						["bipod_01_F_blk",nil,1],
						["bipod_02_F_blk",nil,1],
						["bipod_03_F_blk",nil,1],
						["optic_AMS",nil,1],
						["optic_KHS_base",nil,1],
						["optic_Arco",nil,1],
						["optic_Hamr",nil,1],
						["optic_Aco",nil,1],
						["optic_Holosight",nil,1],
						["optic_Holosight_smg",nil,1],
						["optic_SOS",nil,1],
						["optic_NVS",nil,1],
						["optic_DMS",nil,1],
						["optic_Yorris",nil,1],
						["optic_MRD",nil,1],
						["optic_LRPS",nil,1]
					]
				];
			};
		};
	};

	// CLOTHING CONFIG

	case "uniforms":
	{
		switch(true) do
		{
			default
			{
				["Uniforms",
					[
						["U_I_CombatUniform_tshirt",nil,10],
						["U_I_pilotCoveralls",nil,10],
						["U_I_OfficerUniform",nil,10],
						["U_I_GhillieSuit",nil,10],
						["U_I_Wetsuit",nil,10],
						["U_B_FullGhillie_ard",nil,10],
						["U_B_FullGhillie_sard",nil,10],
						["U_B_FullGhillie_lsh",nil,10],
						["U_O_FullGhillie_ard",nil,10],
						["U_O_FullGhillie_sard",nil,10],
						["U_O_FullGhillie_lsh",nil,10],
						["U_I_FullGhillie_ard",nil,10],
						["U_I_FullGhillie_lsh",nil,10],
						["U_I_FullGhillie_sard",nil,10]
					]
				];
			};
		};
	};

	case "headgear":
	{
		switch(true) do
		{
			default
			{
				["HEADGEAR",
					[
						["H_Booniehat_indp",nil,10],
						["H_CrewHelmetHeli_I",nil,10]
					]
				];
			};
		};
	};
	case "goggles":
	{
		switch(true) do
		{
			default
			{
				["GOGGLES",
					[
						["G_Shades_Black",nil,25],
						["G_Balaclava_oli",nil,750],
						["G_Shades_Blue",nil,20],
						["G_Sport_Blackred",nil,20],
						["G_Sport_Checkered",nil,20],
						["G_Sport_Blackyellow",nil,20],
						["G_Sport_BlackWhite",nil,20],
						["G_I_Diving",nil,75],
						["G_Squares",nil,10],
						["G_Lowprofile",nil,30],
						["G_Combat",nil,55]
					]
				];
			};
		};
	};
	case "vest":
	{
		switch(true) do
		{
			default
			{
				["VESTS",
					[
						["V_PlateCarrierIAGL_dgtl",nil,10],
						["V_PlateCarrierIA2_dgtl",nil,10],
						["V_PlateCarrierIA1_dgtl",nil,10],
						["V_BandollierB_rgr",nil,10],
						["V_RebreatherIA",nil,10],
						["V_PlateCarrierGL_blk",nil,10],
						["V_PlateCarrierGL_mtp",nil,10],
						["V_PlateCarrierIAGL_oli",nil,10],
						["V_platecarrierSpec_blk",nil,10],
						["V_platecarrierSpec_mtp",nil,10]
					]
				];
			};
		};
	};

	case "backpacks":
	{
		switch(true) do
		{
			default
			{
				["BACKPACKS",
					[
						["B_AssaultPack_dgtl",nil,10],
						["B_Kitbag_mcamo",nil,10],
						["B_TacticalPack_oli",nil,10],
						["B_AssaultPack_dgtl",nil,10],
						["B_FieldPack_ocamo",nil,10],
						["B_Bergen_sgg",nil,10],
						["B_Kitbag_cbr",nil,10],
						["B_Carryall_oli",nil,10],
						["B_Carryall_khk",nil,10]
					]
				];
			};
		};
	};

	// VEHICLE CONFIG

	case "vehiclesGROUNDU":
	{
		switch(true) do
		{
			default
			{
				["VEHICLES GROUN UNARMED",
					[
						["B_Quadbike_01_F",nil,10],
						["O_Quadbike_01_F",nil,10],
						["I_Quadbike_01_F",nil,10],
						["C_Offroad_01_F",nil,10],
						["O_MRAP_02_F",nil,10],
						["I_MRAP_03_F",nil,10],
						["B_MRAP_01_F",nil,10],
						["C_Hatchback_01_F",nil,10],
						["C_SUV_01_F",nil,10],
						["O_Truck_02_covered_F",nil,10]
					]
				];
			};
		};
	};

	case "vehiclesGROUNDA":
	{
		switch(true) do
		{
			default
			{
				["GROUND VEHICLES",
					[
						["B_MBT_01_cannon_F",nil,10],
						["B_APC_Wheeled_01_cannon_F",nil,10],
						["B_MBT_01_TUSK_F",nil,10],
						["I_APC_Wheeled_03_cannon_F",nil,10],
						["B_MRAP_01_hmg_F",nil,10],
						["O_MRAP_02_hmg_F",nil,10],
						["I_MRAP_03_hmg_F",nil,10],
						["I_MBT_03_cannon_F",nil,10],
						["I_G_Offroad_01_armed_F",nil,10],
						["O_MBT_02_cannon_F",nil,10],
						["O_APC_Tracked_02_cannon_F",nil,10],
						["B_MBT_01_mlrs_F",nil,10]
					]
				];
			};
		};
	};
	case "vehiclesAIR":
	{
		switch(true) do
		{
			default
			{
				["AIR",
					[
						["B_Heli_Transport_01_F",nil,50],
						["B_Heli_Transport_01_camo_F",nil,10],
						["B_Heli_Transport_03_F",nil,10],
						["O_Heli_Attack_02_F",nil,10],
						["O_Heli_Attack_02_black_F",nil,10],
						["B_Heli_Attack_01_F",nil,10],
						["O_Heli_Light_02_F",nil,10],
						["I_Heli_light_03_F",nil,10],
						["B_Heli_Light_01_armed_F",nil,10],
						["O_Heli_Light_02_v2_F",nil,10]
					]
				];
			};
		};
	};
	case "vehiclesBoat":
	{
		switch(true) do
		{
			default
			{
				["BOATS",
					[
						["B_Boat_Armed_01_minigun_F",nil,50],
						["I_Boat_Armed_01_minigun_F",nil,10],
						["O_Boat_Armed_01_hmg_F",nil,10]
					]
				];
			};
		};
	};
};
