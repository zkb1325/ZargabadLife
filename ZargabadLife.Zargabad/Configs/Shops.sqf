/*
	Author: ZKB1325
	FileName: Shops.sqf
	Function: Not a function
	Description: Defines Shops and what items are in them
	
	*IMPORTANT*
	If stat saving is enabled (ZKB_StatSaveEnabled = true; in Settings.hpp) and you add or remove and item from a shop OR if you add or remove a shop entirely you Must
	delete everything below [ShopStock] found in ServerStats.ini in the INIDBI addon folder

	
	[shop_Object, "Shop Name", Box_For_Gear_To_Spawn, GameLogic_For_Vehicles_To_Spawn, [buyables array], [sellables array], CheckForLicense, "allowed to use condition", [array of starting stock], [array of max stock], ExportTo, stockBleedRate]
	
	shop_Object: The map object for the shop
	"Shop Name": The name of the shop
	Box_For_Gear_To_Spawn: The gear box gear will go into when gear is bought use objNull for no gear box
	GameLogic_For_Vehicles_To_Spawn: The location a bought vehicle will spawn use objNull for no vehicle spawn
	[buyables array]: List of buyable items that are defined in the Item_Config.hpp
	[sellables array]: List of sellable items that are defined in the Item_Config.hpp
	CheckForLicense: True or False if buying an item from the shop requires any licenses
	"allowed to use condition": Condition in order to access shop
	[array of starting stock]: Array of numbers defining the starting stock for the shop items, MUST be a number for each item that is in the buy array use -1 for unlimited stock
	[array of max stock]: Array of numbers defining the max stock an item can have in the shop, MUST be a number for each item that is in the buy array use -1 for unlimited stock
	ExportTo: If the player is allowed to export items from a factory to the shop
	stockBleedRate: How often in minutes 1 stock is removed from each item in shop if item has limited stock. 0 = no bleed

*/
if (isServer) then
	{
	_BankShop =
	[
	"BankInsurance"
	];

	_StationShop =
	[
	"Bread",
	"SiphonFuelKit",
	"RefuelCan",
	"RepairKit"
	];

	_CarShop =
	[
	"CUP_C_TT650_TK_CIV",
	"C_Quadbike_01_white_F",
	"CUP_C_Volha_Blue_TKCIV",
	"CUP_C_Volha_Gray_TKCIV",
	"CUP_C_Lada_GreenTK_CIV",
	"CUP_C_Lada_TK2_CIV",
	"CUP_C_S1203_CIV",
	"CUP_C_UAZ_Unarmed_TK_CIV",
	"CUP_C_LR_Transport_CTK"
	];

	_TruckShop =
	[
	"CUP_O_V3S_Open_TKA",
	"CUP_O_V3S_Covered_TKA",
	"CUP_C_Ural_Civ_02",
	"CUP_O_V3S_Refuel_TKA",
	"CUP_C_Ikarus_TKC"
	];

	_AirShop =
	[
	"C_Heli_light_01_red_F",
	"CUP_C_AN2_AEROSCHROT_TK_CIV",
	"CUP_C_AN2_AIRTAK_TK_CIV"
	];
	/*
	_TuningShop =
	[
	"SpeedUpgrade1",
	"SpeedUpgrade2",
	"SpeedUpgrade3",
	"SpeedUpgrade4",
	"SpeedUpgrade5"
	];
	*/
	_ItemShop =
	[
	"Trout",
	"Perch",
	"Walleye",
	"Bass",
	"Bread",
	"Rabbit",
	"Goat",
	"MedKit",
	"Phone",
	"FishingPole"
	];

	_GunShop =
	[
	"CUP_hgun_Duty",
	"16Rnd_9x21_Mag",
	"CUP_hgun_M9",
	"CUP_15Rnd_9x19_M9",
	"CUP_hgun_Makarov",
	"CUP_8Rnd_9x18_Makarov_M",
	"CUP_hgun_Colt1911",
	"CUP_7Rnd_45ACP_1911",
	"CUP_hgun_TaurusTracker455",
	"CUP_hgun_TaurusTracker455_gold",
	"CUP_6Rnd_45ACP_M",
	"CUP_srifle_LeeEnfield",
	"CUP_10x_303_M",
	"CUP_srifle_CZ550",
	"CUP_5x_22_LR_17_HMR_M",
	"CUP_Saiga12K",
	"CUP_8Rnd_B_Saiga12_74Pellets_M"
	];

	_EquipmentShop =
	[
	"CUP_NVG_PVS7",
	"Binocular",
	"ItemMap",
	"ItemGPS",
	"ItemRadio",
	"ItemCompass",
	"ItemWatch"
	];

	_clothingShop =
	[
	"CUP_H_TKI_Lungee_Open_01",
	"CUP_H_TKI_Lungee_Open_02",
	"CUP_H_TKI_Lungee_Open_03",
	"CUP_H_TKI_Lungee_Open_04",
	"CUP_H_TKI_Lungee_Open_05",
	"CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Lungee_01",
	"CUP_H_TKI_Lungee_02",
	"CUP_H_TKI_Lungee_03",
	"CUP_H_TKI_Lungee_04",
	"CUP_H_TKI_Lungee_05",
	"CUP_H_TKI_Lungee_06",
	"CUP_H_TKI_Pakol_1_01",
	"CUP_H_TKI_Pakol_2_04",
	"CUP_H_TKI_Pakol_2_05",
	"CUP_H_TKI_Pakol_2_06",
	"CUP_U_C_Suit_01",
	"CUP_U_C_Suit_02",
	"CUP_O_TKI_Khet_Jeans_04",
	"CUP_O_TKI_Khet_Jeans_02",
	"CUP_O_TKI_Khet_Jeans_01",
	"CUP_O_TKI_Khet_Jeans_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"B_AssaultPack_cbr"
	];

	_DoctorShop =
	[
	"MedKit",
	"FirstAidKit"
	];

	_MiningShop =
	[
	"Shovel",
	"PickAxe",
	"JackHammer"
	];

	_RingShop =
	[
	"DiamondRing",
	"ExpensiveDiamondRing",
	"PlatinumRing",
	"ExpensivePlatinumRing"
	];

	_ResourceShop =
	[
	"Iron",
	"Copper",
	"Coal",
	"Silicon",
	"DiamondRock",
	"Platinum",
	"Silver",
	"Gold",
	"Oil",
	"Sand",
	"Sulfer",
	"Steel",
	"BlackPowder",
	"Glass",
	"Plastic",
	"ElectronicComponents"
	];

	_OilShop =
	[
	"OilBarrel"
	];

	_CocaineShop =
	[
	"Cocaine"
	];

	_MarijuanaShop =
	[
	"Marijuana"
	];

	_LSDShop =
	[
	"LSD"
	];

	_HeroinShop =
	[
	"Heroin"
	];

	_gangShop =
	[
	"CUP_hgun_M9",
	"CUP_15Rnd_9x19_M9",
	"CUP_muzzle_snds_M9",
	"CUP_hgun_TaurusTracker455_gold",
	"CUP_6Rnd_45ACP_M",
	"CUP_hgun_MicroUzi",
	"CUP_30Rnd_9x19_UZI",
	"CUP_muzzle_snds_MicroUzi",
	"CUP_hgun_SA61",
	"CUP_20Rnd_B_765x17_Ball_M",
	"Binocular",
	"CUP_NVG_PVS7",
	"ItemGPS",
	"FirstAidKit",
	"MedKit",
	"Phone",
	"RepairKit",
	"RefuelCan",
	"SiphonFuelKit",
	"Lighter",
	"LockPick",
	"B_AssaultPack_cbr",
	"CUP_V_OI_TKI_Jacket3_01",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	];

	_copShop =
	[
	"CUP_hgun_Makarov",
	"CUP_8Rnd_9x18_MakarovSD_M",
	"CUP_8Rnd_9x18_Makarov_M",
	"SmokeShellYellow",
	"Binocular",
	"CUP_NVG_PVS7",
	"FirstAidKit",
	"MedKit",
	"RefuelCan",
	"RepairKit",
	"ItemBag",
	"WeaponBag",
	"Donut",
	"CUP_H_CDF_OfficerCap_UN",
	"CUP_U_B_USArmy_Base"
	];

	_copPatrolShop =
	[
	"CUP_hgun_M9",
	"CUP_hgun_BallisticShield_Armed",
	"CUP_15Rnd_9x19_M9",
	"CUP_hgun_Glock17",
	"CUP_17Rnd_9x19_glock17",
	"CUP_acc_Glock17_Flashlight",
	"CUP_hgun_Colt1911",
	"CUP_7Rnd_45ACP_1911",
	"CUP_hgun_TaurusTracker455",
	"CUP_6Rnd_45ACP_M",
	"CUP_smg_MP5A5",
	"CUP_30Rnd_9x19_MP5",
	"CUP_Saiga12K",
	"CUP_8Rnd_B_Saiga12_74Pellets_M",
	"CUP_8Rnd_B_Saiga12_74Slug_M",
	"CUP_glaunch_M79",
	"CUP_1Rnd_SmokeYellow_M203",
	"CUP_glaunch_M32",
	"CUP_6Rnd_SmokeYellow_M203",
	"SpikeStrip",
	"DefuseKit",
	"CUP_H_CDF_H_PASGT_UN",
	"CUP_H_CDF_Beret_UN",
	"CUP_H_BAF_Officer_Beret",
	"CUP_V_B_IOTV_SL",
	"CUP_B_AssaultPack_ACU"
	];

	_copResponseShop =
	[
	"CUP_arifle_M16A2",
	"CUP_arifle_M16A4_Base",
	"CUP_optic_CompM2_Black",
	"CUP_optic_ACOG",
	"CUP_arifle_L85A2",
	"CUP_optic_SUSAT",
	"CUP_arifle_Mk16_CQC",
	"CUP_arifle_Mk16_CQC_FG",
	"CUP_arifle_Mk16_STD",
	"CUP_srifle_Mk12SPR",
	"CUP_optic_LeupoldM3LR",
	"CUP_30Rnd_556x45_Stanag",
	"CUP_arifle_Sa58V_camo",
	"CUP_30Rnd_Sa58_M",
	"CUP_U_B_BAF_DDPM_Tshirt",
	"CUP_U_I_RACS_Desert_1",
	"CUP_U_I_RACS_Urban_2",
	"CUP_V_B_RRV_DA2",
	"CUP_H_USArmy_HelmetMICH",
	"CUP_H_USArmy_Helmet_Pro_gog",
	"CUP_B_USPack_Coyote"
	];

	_copSobrShop =
	[
	"CUP_arifle_M4A3_desert",
	"CUP_30Rnd_556x45_Stanag",
	"CUP_optic_CompM2_Desert",
	"CUP_acc_Flashlight_desert",
	"CUP_srifle_M14",
	"CUP_20Rnd_762x51_DMR",
	"CUP_optic_CompM2_Black",
	"CUP_arifle_Mk17_CQC",
	"CUP_arifle_Mk17_STD",
	"CUP_20Rnd_762x51_B_SCAR",
	"CUP_arifle_G36C_camo",
	"CUP_30Rnd_556x45_G36",
	"CUP_optic_HoloBlack",
	"CUP_muzzle_snds_G36_black",
	"CUP_lmg_m249_pip2",
	"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",
	"CUP_srifle_M24_des",
	"CUP_5Rnd_762x51_M24",
	"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
	"CUP_srifle_AWM_des",
	"CUP_5Rnd_86x70_L115A1",
	"CUP_optic_SB_3_12x50_PMII",
	"CUP_srifle_M107_Base",
	"CUP_10Rnd_127x99_m107",
	"CUP_optic_Leupold_VX3",
	"CUP_launch_M136",
	"CUP_M136_M",
	"CUP_launch_FIM92Stinger",
	"CUP_Stinger_M",
	"CUP_H_USArmy_Helmet_ECH2_Sand",
	"CUP_U_B_USArmy_TwoKnee",
	"CUP_U_B_BAF_DDPM_S1_RolledUp",
	"CUP_V_BAF_Osprey_Mk2_DDPM_Officer",
	"CUP_V_B_MTV_MG",
	"B_Carryall_cbr"
	];

	_copVehicleShop =
	[
	"CUP_B_M1030_USMC",
	"C_Quadbike_01_black_F",
	"CUP_C_Volha_Limo_TKCIV",
	"CUP_I_UAZ_Unarmed_UN",
	"CUP_B_LR_Transport_CZ_W",
	"CUP_I_SUV_UNO",
	"CUP_B_HMMWV_Transport_USA",
	"CUP_B_HMMWV_Unarmed_USA",
	"CUP_B_HMMWV_M2_USA",
	"CUP_B_MTVR_USA",
	"CUP_I_Ural_UN"
	];

	_copAirShop =
	[
	"CUP_B_AH6X_USA",
	"CUP_B_MH6J_USA",
	"CUP_B_UH60M_US"
	];

	_terrorGear =
	[
	"StrangeMeat",
	"M2StaticMG",
	"Binocular",
	"CUP_NVG_PVS7",
	"ItemGPS",
	"FirstAidKit",
	"MedKit",
	"RepairKit",
	"RefuelCan",
	"LockPick",
	"VehicleAmmo",
	"BombRemote",
	"RemoteBomb",
	"SuicideBomb",
	"ActivationBomb",
	"SpeedBomb",
	"TimeBomb",
	"CUP_AA12_PMC",
	"CUP_20Rnd_B_AA12_Pellets",
	"CUP_arifle_AKS",
	"CUP_arifle_AKS74",
	"CUP_arifle_AKS74U",
	"CUP_arifle_AKS_Gold",
	"CUP_arifle_AKM",
	"CUP_arifle_AK47",
	"CUP_30Rnd_762x39_AK47_M",
	"CUP_arifle_AK74M",
	"CUP_arifle_AK74M_GL",
	"CUP_arifle_AK74",
	"CUP_arifle_AK74_GL",
	"CUP_arifle_AK107",
	"CUP_arifle_AK107_GL",
	"CUP_30Rnd_545x39_AK_M",
	"CUP_1Rnd_HE_GP25_M",
	"CUP_optic_Kobra",
	"CUP_arifle_FNFAL",
	"CUP_20Rnd_762x51_FNFAL_M",
	"CUP_arifle_RPK74",
	"CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",
	"CUP_srifle_VSSVintorez",
	"CUP_20Rnd_9x39_SP5_VSS_M",
	"CUP_srifle_SVD_des",
	"CUP_10Rnd_762x54_SVD_M",
	"CUP_optic_PSO_1",
	"CUP_srifle_ksvk",
	"CUP_5Rnd_127x108_KSVK_M",
	"CUP_optic_PSO_3",
	"CUP_launch_RPG7V",
	"CUP_PG7V_M",
	"CUP_OG7_M",
	"CUP_launch_Igla",
	"CUP_Igla_M",
	"CUP_IED_V1_M",
	"CUP_IED_V2_M",
	"CUP_IED_V3_M",
	"CUP_IED_V4_M",
	"CUP_H_TK_Helmet",
	"CUP_H_SLA_Helmet",
	"B_AssaultPack_cbr",
	"B_Carryall_khk",
	"CUP_U_I_Ghillie_Top",
	"CUP_V_RUS_Smersh_1",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket4_01",
	"CUP_V_OI_TKI_Jacket4_02",
	"CUP_V_OI_TKI_Jacket4_03",
	"CUP_V_OI_TKI_Jacket4_04",
	"CUP_V_OI_TKI_Jacket4_05",
	"CUP_V_OI_TKI_Jacket4_06"
	];

	_terrorVehicles =
	[
	"CUP_I_Datsun_PK_TK_Random",
	"CUP_O_UAZ_MG_TKA",
	"CUP_O_BTR40_TKA",
	"CUP_O_BTR40_MG_TKA",
	"CUP_I_BRDM2_TK_Gue",
	"CUP_O_UH1H_TKA"
	];


	ZKB_ShopDefines =
	[
	[MainBank, "STR_Shop_MainBank", objNull, objNull, _BankShop, [], true, "true", _BankShop apply {-1}, _BankShop apply {-1}, false, 0],

	[Station1Shop, "STR_Shop_Station1Shop", objNull, objNull, _StationShop, _StationShop, true, "true", _StationShop apply {-1}, _StationShop apply {-1}, true, 0],
	[Station2Shop, "STR_Shop_Station2Shop", objNull, objNull, _StationShop, _StationShop, true, "true", _StationShop apply {-1}, _StationShop apply {-1}, true, 0],
	[Station3Shop, "STR_Shop_Station3Shop", objNull, objNull, _StationShop, _StationShop, true, "true", _StationShop apply {-1}, _StationShop apply {-1}, true, 0],
	[Station4Shop, "STR_Shop_Station4Shop", objNull, objNull, _StationShop, _StationShop, true, "true", _StationShop apply {-1}, _StationShop apply {-1}, true, 0],

	[CarShop1, "STR_Shop_CarShop1", objNull, CarShop1VehSpawn, _CarShop, _CarShop, true, "true", [-1,-1,-1,-1,10,10,10,10,10], [-1,-1,-1,-1,20,20,20,20,20], true, 0],
	[CarShop2, "STR_Shop_CarShop2", objNull, CarShop2VehSpawn, _CarShop, _CarShop, true, "true", [-1,-1,-1,-1,10,10,10,10,10], [-1,-1,-1,-1,20,20,20,20,20], true, 0],
	[CarShop3, "STR_Shop_CarShop3", objNull, CarShop3VehSpawn, _CarShop, _CarShop, true, "true", [-1,-1,-1,-1,10,10,10,10,10], [-1,-1,-1,-1,20,20,20,20,20], true, 0],

	[TruckShop, "STR_Shop_TruckShop", objNull, TruckShopVehSpawn, _TruckShop, _TruckShop, true, "true", [5,5,5,5,5], [10,10,10,10,10], true, 0],

	[AirShop, "STR_Shop_AirShop", objNull, AirShopVehSpawn, _AirShop, _AirShop, true, "true", [5,5,5], [10,10,10], true, 0],

	//[TuningShop1, "STR_Shop_TuningShop1", objNull, objNull, _TuningShop, _TuningShop, true, "true", [15,10,5,3,2], [30,20,10,5,5], true],
	//[TuningShop2, "STR_Shop_TuningShop2", objNull, objNull, _TuningShop, _TuningShop, true, "true", [15,10,5,3,2], [30,20,10,5,5], true],

	[ItemShop1, "STR_Shop_ItemShop1", objNull, objNull, _ItemShop, _ItemShop, true, "true", [0,0,0,0,-1,0,0,10,-1,15], [1000,1000,1000,1000,-1,1000,1000,25,-1,25], true, 0],
	[ItemShop2, "STR_Shop_ItemShop2", objNull, objNull, _ItemShop, _ItemShop, true, "true", [0,0,0,0,-1,0,0,10,-1,15], [1000,1000,1000,1000,-1,1000,1000,25,-1,25], true, 0],
	[ItemShop3, "STR_Shop_ItemShop3", objNull, objNull, _ItemShop, _ItemShop, true, "true", [0,0,0,0,-1,0,0,10,-1,15], [1000,1000,1000,1000,-1,1000,1000,25,-1,25], true, 0],

	[GunShop, "STR_Shop_GunShop", GunShopWpnBox, objNull, _GunShop, _GunShop, true, "true", [4,-1,4,-1,5,-1,4,-1,2,2,-1,2,-1,2,-1,2,-1], [12,-1,12,-1,25,-1,12,-1,10,10,-1,10,-1,5,-1,5,-1], true, 0],
	[EquipmentShop, "STR_Shop_EquipmentShop", EquipmentShopWpnBox, objNull, _EquipmentShop, _EquipmentShop, true, "true", _EquipmentShop apply {-1}, _EquipmentShop apply {-1}, true, 0],
	[ClothingShop, "STR_Shop_ClothingShop", ClothingShopWpnBox, objNull, _clothingShop, _clothingShop, true, "true", _clothingShop apply {-1}, _clothingShop apply {-1}, true, 0],

	[DoctorShop, "STR_Shop_DoctorShop", DoctorShopWpnBox, objNull, _DoctorShop, _DoctorShop, true, "true", _DoctorShop apply {-1}, _DoctorShop apply {-1}, true, 0],
	[MiningShop, "STR_Shop_MiningShop", objNull, objNull, _MiningShop, _MiningShop, true, "true", [15,15,10], [30,30,10], true, 0],

	[RingShop, "STR_Shop_RingShop", objNull, objNull, _RingShop, _RingShop, true, "true", _RingShop apply {-1}, _RingShop apply {-1}, false, 0],
	[ResourceShop, "STR_Shop_ResourceShop", objNull, objNull, _ResourceShop, _ResourceShop, true, "true", [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], [500,1000,4000,600,300,400,500,400,600,4000,4000,500,500,500,500,500], false, 3],
	[OilShop, "STR_Shop_OilShop", objNull, objNull, [], _OilShop, true, "true", [0], [100], false, 5],

	[CocaineShop, "STR_Shop_CocaineShop", objNull, objNull, _CocaineShop, _CocaineShop, true, "true", _CocaineShop apply {-1}, _CocaineShop apply {-1}, false, 0],
	[MarijuanaShop, "STR_Shop_MarijuanaShop", objNull, objNull, _MarijuanaShop, _MarijuanaShop, true, "true", _MarijuanaShop apply {-1}, _MarijuanaShop apply {-1}, false, 0],
	[LSDShop, "STR_Shop_LSDShop", objNull, objNull, _LSDShop, _LSDShop, true, "true", _LSDShop apply {-1}, _LSDShop apply {-1}, false, 0],
	[HeroinShop, "STR_Shop_HeroinShop", objNull, objNull, _HeroinShop, _HeroinShop, true, "true", _HeroinShop apply {-1}, _HeroinShop apply {-1}, false, 0],

	[GangArea1, "STR_Shop_GangShop", GangArea1ShopBox, objNull, _gangShop, _gangShop, false, "IsCiv", _gangShop apply {-1}, _gangShop apply {-1}, false, 0],
	[GangArea2, "STR_Shop_GangShop", GangArea2ShopBox, objNull, _gangShop, _gangShop, false, "IsCiv", _gangShop apply {-1}, _gangShop apply {-1}, false, 0],
	[GangArea3, "STR_Shop_GangShop", GangArea3ShopBox, objNull, _gangShop, _gangShop, false, "IsCiv", _gangShop apply {-1}, _gangShop apply {-1}, false, 0],

	[CopShop, "STR_Shop_CopShop", CopShop, objNull, _copShop, _copShop, true, "IsCop", _copShop apply {-1}, _copShop apply {-1}, false, 0],
	[CopPatrolShop, "STR_Shop_CopPatrolShop", CopPatrolShop, objNull, _copPatrolShop, _copPatrolShop, true, "IsCop", _copPatrolShop apply {-1}, _copPatrolShop apply {-1}, false, 0],
	[CopResponseShop, "STR_Shop_CopResponseShop", CopResponseShop, objNull, _copResponseShop, _copResponseShop, true, "IsCop", _copResponseShop apply {-1}, _copResponseShop apply {-1}, false, 0],
	[CopSobrShop, "STR_Shop_CopSobrShop", CopSobrShop, objNull, _copSobrShop, _copSobrShop, true, "IsCop", _copSobrShop apply {-1}, _copSobrShop apply {-1}, false, 0],
	[CopVehicleShop, "STR_Shop_CopVehicleShop", objNull, CopVehicleShopSpawn, _copVehicleShop, _copVehicleShop, true, "IsCop", _copVehicleShop apply {-1}, _copVehicleShop apply {-1}, false, 0],
	[CopAirShop, "STR_Shop_CopAirShop", objNull, CopAirShopSpawn, _copAirShop, _copAirShop, true, "IsCop", _copAirShop apply {-1}, _copAirShop apply {-1}, false, 0],

	[TerrorGearShop, "STR_Shop_TerrorGearShop", TerrorGearShopWpnBox, objNull, _terrorGear, _terrorGear, true, "IsCiv", _terrorGear apply {-1}, _terrorGear apply {-1}, false, 0],
	[TerrorVehicleShop, "STR_Shop_TerrorVehicleShop", objNull, TerrorVehicleShopSpawn, _terrorVehicles, _terrorVehicles, true, "IsCiv", _terrorVehicles apply {-1}, _terrorVehicles apply {-1}, false, 0]
	];
	publicVariable "ZKB_ShopDefines";
	
	//Array of shops that wont have tax calculated when buying an item
	ZKB_NonTaxedShops = [GangArea1,GangArea2,GangArea3,TerrorGearShop,TerrorVehicleShop];
	publicVariable "ZKB_NonTaxedShops";
	
	
	//Set the shop data to each shop object through setVariable and set up stock bleed
	{
	(_x select 0) setVariable ["ShopData", _x, true];
	
	if !((_x select 11) isEqualTo 0) then
		{
		_x spawn
			{
			private _shopObj = param [0];
			private _shopItems = param [4];
			if (_shopItems isEqualTo []) then {_shopItems = param [5];};
			private ["_itemStock"];
			while {true} do
				{
				sleep ((param [11])*60);
				{
				_itemStock = [_x,_shopObj] call ZKB_fnc_ShopGetItemStock;
				if !((_itemStock select 0) isEqualTo -1) then
					{
					[_shopObj,(_itemStock select 2),1,false] call ZKB_fnc_UpdateShopStock;
					};
				}forEach _shopItems;
				};
			};
		};
	}forEach ZKB_ShopDefines;
	};

//create shop marker
if !(isDedicated) then
	{
	if !(player diarySubjectExists "locations") then
		{
		player createDiarySubject ["locations",localize "STR_MainMenu_MapTabMapLocations"];
		};
	private _shopLocationString = "";
	{
	_shopMarker = createMarkerLocal ["ShopMarker_" + (str (_x select 0)),(_x select 0)];
	if !((_x select 0) in [MainBank,CopShop,CopPatrolShop,CopResponseShop,CopSobrShop,GangArea1,GangArea2,GangArea3,TerrorGearShop,TerrorVehicleShop]) then //Put shop objects in array to not auto create marker
		{
		_shopMarker setMarkerShapeLocal "ICON";
		_shopMarker setMarkerTypeLocal "mil_box";
		if ((_x select 0) in [CocaineShop,MarijuanaShop,LSDShop,HeroinShop]) then //Red marker color
			{
			_shopMarker setMarkerColorLocal "colorRed";
			}
			else
			{
			_shopMarker setMarkerColorLocal "colorBlue";
			};
		_shopMarker setMarkerTextLocal (if (isLocalized (_x select 1)) then {localize (_x select 1)}else{(_x select 1)});
		
		};
	_shopLocationString = _shopLocationString + format ["<marker name='%1'>%2</marker><br/>",_shopMarker,(if (isLocalized (_x select 1)) then {localize (_x select 1)}else{(_x select 1)})];
	}forEach ZKB_ShopDefines;
	player createDiaryRecord ["locations", [localize "STR_MainMenu_MapTabShops",_shopLocationString]];
	};