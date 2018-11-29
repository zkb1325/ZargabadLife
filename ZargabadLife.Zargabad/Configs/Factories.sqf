/*
	Author: ZKB1325
	FileName: Factories.sqf
	Function: Not a function
	Description: Defines factories and what each factory can produce as well as base factory variables
	
	[factory_object, "Factory Name", factorycost, Box_For_Gear_To_Spawn, GameLogic_For_Vehicles_To_Spawn, [Item Array], "Variable"]
	
	factory_object: The map object for the factory
	"Factory Name": The name of the factory
	factorycost: How much the factory cost to buy
	Box_For_Gear_To_Spawn: Where created gear will spawn use objNull for no weapon crate and gear will be created at players feet
	GameLogic_For_Vehicles_To_Spawn: Where created vehicles will spawn, use objNull for no vehicle spawn
	[Item Array]: Array of items defined in masterarray.sqf to appear for production in the factory
	"Variable": Variable used for factory variables (queue,workers,storage)

*/


ZKB_WorkerCost = 3000;
ZKB_MaxWorkers = 15;
ZKB_IgnoreUnlimitedStock = true; //If true you are allowed to export items to shops where the stock limit of the item is unlimited
ZKB_FactoryResources = ["Iron","Copper","Coal","Silicon","DiamondRock","Platinum","Silver","Gold","Oil","Sand","Sulfer","Steel","BlackPowder","Glass","Plastic","ElectronicComponents"]; //List of items allowed to be put into the factory storage
ZKB_OwnedFactories = [];

_ResourceFactory =
[
"Steel",
"BlackPowder",
"Glass",
"Plastic",
"ElectronicComponents"
];

_RingFactory =
[
"DiamondRing",
"ExpensiveDiamondRing",
"PlatinumRing",
"ExpensivePlatinumRing"
];

_GeneralFactory = 
[
"CUP_hgun_M9",
"CUP_15Rnd_9x19_M9",
"CUP_hgun_Colt1911",
"CUP_7Rnd_45ACP_1911",
"CUP_hgun_Makarov",
"CUP_8Rnd_9x18_Makarov_M",
"CUP_hgun_TaurusTracker455",
"CUP_6Rnd_45ACP_M",
"Binocular",
"CUP_NVG_PVS7",
"ItemGPS",
"Phone",
"RepairKit",
"RefuelCan",
"LockPick",
"FirstAidKit",
"MedKit",
"Lighter",
"FishingPole",
"Shovel",
"PickAxe",
"JackHammer"
];

_VehicleFactory =
[
"CUP_C_TT650_TK_CIV",
"C_Quadbike_01_white_F",
"CUP_C_Volha_Blue_TKCIV",
"CUP_C_Volha_Gray_TKCIV",
"CUP_C_Lada_GreenTK_CIV",
"CUP_C_Lada_TK2_CIV",
"CUP_C_S1203_CIV",
"CUP_C_UAZ_Unarmed_TK_CIV",
"CUP_C_LR_Transport_CTK",
"CUP_O_V3S_Open_TKA",
"CUP_O_V3S_Covered_TKA",
"CUP_C_Ural_Civ_02",
"CUP_O_V3S_Refuel_TKA",
"CUP_C_Ikarus_TKC",
"C_Heli_light_01_red_F"
];

_WeaponFactory =
[
"CUP_NVG_PVS7",
"CUP_hgun_Duty",
"16Rnd_9x21_Mag",
"CUP_hgun_M9",
"CUP_15Rnd_9x19_M9",
"CUP_muzzle_snds_M9",
"CUP_hgun_Makarov",
"CUP_8Rnd_9x18_Makarov_M",
"CUP_hgun_Colt1911",
"CUP_7Rnd_45ACP_1911",
"CUP_hgun_TaurusTracker455",
"CUP_hgun_TaurusTracker455_gold",
"CUP_6Rnd_45ACP_M",
"CUP_hgun_MicroUzi",
"CUP_30Rnd_9x19_UZI",
"CUP_muzzle_snds_MicroUzi",
"CUP_hgun_SA61",
"CUP_20Rnd_B_765x17_Ball_M",
"CUP_srifle_LeeEnfield",
"CUP_10x_303_M",
"CUP_srifle_CZ550",
"CUP_5x_22_LR_17_HMR_M",
"CUP_Saiga12K",
"CUP_8Rnd_B_Saiga12_74Pellets_M"
];

_terrorGearFactory =
[
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
"CUP_launch_Igla",
"CUP_Igla_M",
"CUP_IED_V1_M",
"CUP_IED_V2_M",
"CUP_IED_V3_M",
"CUP_IED_V4_M"
];

_terrorVehicleFactory =
[
"CUP_I_Datsun_PK_TK_Random",
"CUP_O_UAZ_MG_TKA",
"CUP_O_BTR40_TKA",
"CUP_O_BTR40_MG_TKA",
"CUP_I_BRDM2_TK_Gue",
"CUP_O_UH1H_TKA"
];

ZKB_FactoryDefines =
[
[ResourceFactory, localize "STR_Fac_ResourceFactory", 25000, objNull, objNull, _ResourceFactory, "ZKB_ResourceFactory"],
[RingFactory, localize "STR_Fac_RingFactory", 25000, objNull, objNull, _RingFactory, "ZKB_RingFactory"],
[GeneralFactory, localize "STR_Fac_GeneralFactory", 50000, GeneralFactoryWpnBox, objNull, _GeneralFactory, "ZKB_GeneralFactory"],
[VehicleFactory, localize "STR_Fac_VehicleFactory", 150000, objNull, VehicleFactoryVehSpawn, _VehicleFactory, "ZKB_VehicleFactory"],
[WeaponFactory, localize "STR_Fac_WeaponFactory", 250000, WeaponFactoryWpnBox, objNull, _WeaponFactory, "ZKB_WeaponFactory"],
[TerrorGearFactory, localize "STR_Fac_TerrorGearFactory", 500000, TerrorGearFactoryWpnBox, objNull, _terrorGearFactory, "ZKB_TerrorGearFactory"],
[TerrorVehicleFactory, localize "STR_Fac_TerrorVehicleFactory", 400000, objNull, TerrorVehicleFactoryVehSpawn, _terrorVehicleFactory, "ZKB_TerrorVehicleFactory"]
];


if !(player diarySubjectExists "locations") then
	{
	player createDiarySubject ["locations",localize "STR_MainMenu_MapTabMapLocations"];
	};
private _factoryLocationString = "";
		
{
_facobject = _x select 0;
_facname = _x select 1;
_faccost = _x select 2;
_facwpnbox = _x select 3;
_facvehspawn = _x select 4;
_facitems = _x select 5;
_facvar = _x select 6;

_facobject setVariable ["FactoryInfo", _x];

_facobject addAction [format ["%1 ($%2)", _facname, [_faccost] call ZKB_fnc_FormatNumber], ZKB_fnc_BuyFactory, [_facname,_faccost,_facvar], 1, true, true, "", format ["!(""%1"" in ZKB_OwnedFactories)", _facvar],7];

_facobject addAction [localize "STR_Fac_FactoryStorage", ZKB_fnc_OpenFactoryStorage, "", 1, true, true, "", format ["(""%1"" in ZKB_OwnedFactories)", _facvar],7];

_facobject addAction [format [localize "STR_Fac_HireWorker",[ZKB_WorkerCost] call ZKB_fnc_FormatNumber], ZKB_fnc_HireWorker, "", 1, true, true, "", format ["(""%1"" in ZKB_OwnedFactories)", _facvar],7];

_facobject addAction [localize "STR_Fac_Manufacture", ZKB_fnc_OpenFactoryManufacture, "", 1, true, true, "", format ["(""%1"" in ZKB_OwnedFactories)", _facvar],7];

_facMarker = createMarkerLocal [_facvar,_facobject];
if !(_facobject in [TerrorGearFactory,TerrorVehicleFactory])then
	{
	_facMarker setMarkerShapeLocal "ICON";
	_facMarker setMarkerTypeLocal "mil_dot";
	_facMarker setMarkerColorLocal "colorBlue";
	_facMarker setMarkerTextLocal _facname;
	};
_factoryLocationString = _factoryLocationString + format ["<marker name='%1'>%2</marker><br/>",_facMarker,_facname];

[_facobject] spawn
	{
	private _workingfactory = (_this select 0);
	private _facarray = _workingfactory getVariable "FactoryInfo";
	private _factoryqueue = missionNameSpace getVariable [(_facarray select 6)+"Queue", []];
		
	while {true} do
		{
		waitUntil {count (missionNameSpace getVariable [(_facarray select 6)+"Queue", []]) > 0};
		private _curitemarr = ((missionNameSpace getVariable [(_facarray select 6)+"Queue", []]) select 0);
		private _manutime = (_curitemarr select 1);
		_reqmanutime = serverTime + _manutime;
		waitUntil {_workingfactory setVariable ["TimeRemaining",(_reqmanutime - serverTime)]; (serverTime >= _reqmanutime)};
		[_workingfactory,"Add",(_curitemarr select 0),1] call ZKB_fnc_UpdateFacStorageCompleted;
		["STR_Fac_ManufactureDone",[([(_curitemarr select 0)] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
		
		_factoryqueue = missionNameSpace getVariable [(_facarray select 6)+"Queue", []];
		_factoryqueue deleteAt 0;
		missionNameSpace setVariable [(_facarray select 6)+"Queue", _factoryqueue];
		[] spawn ZKB_fnc_SavePlayer;
		};
	};
}forEach ZKB_FactoryDefines;
player createDiaryRecord ["locations", [localize "STR_MainMenu_MapTabFactories",_factoryLocationString]];


	