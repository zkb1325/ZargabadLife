class ZKB_Settings
	{
	
	ZKB_StatSaveEnabled = true; //True/False if stats should save over restarts
	ZKB_SavePlayerPos = true; //True/False if the players position should be saved so they login where they last were
	ZKB_StatWipeStartDate[] = {2018,1,1,0,0}; //Start date (servers local timezone) for stat wipes. All future stat wipes will be based off this date as well the first stat wipe will not happen until this date
	ZKB_StatWipeDelay[] = {0,0,1,0,0}; //Delay between each stat wipe {years,months,days,hours,minutes}
	
	//Array of head gear/helmet/hat classNames the player could start with
	ZKB_StartingHeadGear[] =
	{
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
	"CUP_H_TKI_Pakol_2_06"
	};
	
	//Array of uniform classNames the player could start with
	ZKB_StartingUniforms[] =
	{
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
	"CUP_O_TKI_Khet_Partug_06"
	};
	
	ZKB_StartingGear[] = {"ItemMap","ItemWatch","ItemCompass","ItemRadio"}; //Array of gear classNames that the player starts with (NVG, Map, GPS, Watch, radio)
	
	ZKB_StartingInventory[] = {{"KeyChain",1}}; //Starting inventory for new players
	ZKB_MaxINVWeight = 60; //Default max amount of weight a player can hold for virtual items Default: 60
	
	ZKB_ATMArray[] = {"CopBaseATM","CivSpawnATM","TerrorATM","ATM_1","ATM_2","ATM_3","ATM_4","ATM_5"}; //Array of ATM's Should be an array of string object names from the 3D editor
	ZKB_StartingBankAccount = 25000; //How much new players start with in their bank account Default: 25000
	ZKB_CopPayCheck = 5000; //Cop base paycheck Default: 5000
	ZKB_ChiefPayCheck = 15000; //Police chief paycheck bonus Default: 15000
	ZKB_CivPayCheck = 2500; //Civs base paycheck Default: 2500
	ZKB_MayorPayCheck = 10000; //Mayor paycheck bonus Default: 10000
	ZKB_MaxBankAccount = 5000000; //Max amount of money a player can have in their account Default: 5000000
	
	ZKB_MaxStationMoney = 25000; //Max amount that can be robbed from a gas station Default: 25000
	ZKB_MaxVaultMoney = 300000; //Max amount that can be robbed from a bank vault Default: 300000
	
	ZKB_CopRespawnTimeBase = 15; //Base/min respawn time a cop gets before punishments added. Players respawn time resets to this + ZKB_SuicidePenalty once the player dies. Default: 15
	ZKB_CivRespawnTimeBase = 25; //Base/min respawn time a civ gets before punishments added. Players respawn time resets to this + ZKB_SuicidePenalty once the player dies. Default: 25
	ZKB_KillCopPenalty = 20; //Time added to respawn time for killing a cop Default 20
	ZKB_KillCivPenalty = 10; //Time added to respawn time for killing a civ Default: 10
	ZKB_SuicidePenalty = 60; //Time added to respawn time for suicide Default: 60
	ZKB_MaxRespawnTime = 300; //Max respawn time Default: 300
	ZKB_CopKillCopPenalty = 20000; //Penalty for cop killing a fellow cop money removed from killers bank account Default: 20000
	
	ZKB_PatrolPointBonus = 5; //Amount of money a player gets for patrolling where the pay is this * distance in meters. Default: 5
	
	ZKB_InWorkPlaceBonus = 10; //Amount of money a player gets per second for being in a workplace, money added to account when player gets paycheck. Default: 10
	//{{"WorkplaceAreaMarker",buyCost,PaycheckBonus},...}
	ZKB_WorkPlaces[] = {{"WorkPlace_1",75000,3000},{"WorkPlace_2",100000,4500},{"WorkPlace_3",150000,6000}};
	
	ZKB_SlaveCost = 50000; //Cost to buy a slave Default: 50000
	ZKB_MaxSlaves = 3; //Max number of slaves a player can own Default: 3
	ZKB_SlaveBonus = 5000; //How much the slave makes per minute Default: 5000
	ZKB_SlaveFreeReward = 15000; //How much the slave makes per minute Default: 15000
	ZKB_SlaveClass = "CUP_C_TK_Man_02"; //Unit className to spawn as the slave unit
	
	//Array of delivery point objects objects should be in array as a string 
	ZKB_DeliveryPoints[] = {"DP_1","DP_2","DP_3","DP_4","DP_5","DP_6","DP_7","DP_8","DP_9","DP_10","DP_11","DP_12"};
	ZKB_DeliveryBonus = 3.5; //Amount of money a player gets for delivery the package. this * distance = pay. Default: 3.5;
	
	ZKB_GangCreateCost = 100000; //Cost to create a gang from players inventory Default: 100000
	ZKB_GangAreaBonus = 5000; //Paycheck bonus for each gang area the players gang owns. The paycheck bonus is this multiplied number of gang areas owned divided by number of gang members online Default: 5000
	ZKB_GangAreas[] = {"GangArea1","GangArea2","GangArea3"}; //Array of gang areas. Should be string of the gangArea object
	
	ZKB_UnImpoundCost = 2500; //Cost to unImpound a vehicle Default: 2500
	ZKB_VehicleTrunkBlacklist[] = {"Money"}; //Array of virtual items not allowed in vehicle trunk
	
	//{"LicenseName", "LicenseDisplayName", Cost, {AddAction_Objects (objects to add the license action to)}, "condition for the action to show"}
	//The AddAction_Objects should be a string of the map object Variable
	ZKB_LicenseArray[] =
	{
	{"Car_License", "Car License", 3000, {"CivSpawnATM"}, "IsCiv"},
	{"Truck_License", "Truck License", 20000, {"CivSpawnATM"}, "IsCiv"},
	{"Air_License", "Air License", 100000, {"CivSpawnATM"}, "IsCiv"},

	{"Oil_Processors_License", "Oil Processor's License", 30000, {"MiningShop"}, "IsCiv"},

	{"GA1_Cocaine_Drug_Processors_License", "GA1 Cocaine Drug Processor's License", 20000, {"GangArea1"}, "IsCiv"},
	{"GA1_LSD_Drug_Processors_License", "GA1 LSD Drug Processor's License", 35000, {"GangArea1"}, "IsCiv"},
	{"GA2_Heroin_Drug_Processors_License", "GA2 Heroin Drug Processor's License", 30000, {"GangArea2"}, "IsCiv"},
	{"GA2_LSD_Drug_Processors_License", "GA2 LSD Drug Processor's License", 35000, {"GangArea2"}, "IsCiv"},
	{"GA3_Heroin_Drug_Processors_License", "GA3 Heroin Drug Processor's License", 30000, {"GangArea3"}, "IsCiv"},
	{"GA3_Marijuana_Drug_Processors_License", "GA3 Marijuana Drug Processor's License", 15000, {"GangArea3"}, "IsCiv"},

	{"Pistol_License", "Pistol License", 12000, {"GunShop"}, "IsCiv"},
	{"Rifle_License", "Rifle License", 22000, {"GunShop"}, "IsCiv"},
	//{"Engineer_License", "Engineer License", 25000, {"CivSpawnATM"}, "IsCiv"}, //Not used currently because speed upgrades are removed
	{"Terror_Training", "Terror Training", 850000, {"TerrorATM"}, "IsCiv"},

	{"Civ_Shop_License", "Civ Shop License", 10000, {"CopBaseATM"}, "IsCop"},
	{"Patrol_Officer_Training", "Patrol-Officer Training", 15000, {"CopBaseATM"}, "IsCop"},
	{"Armed_Response_Officer_Training", "Armed Response-Officer Training", 150000, {"CopBaseATM"}, "IsCop"},
	{"SOBR_Training", "SOBR Training", 300000, {"CopBaseATM"}, "IsCop"},
	{"Air_Support_Officer_Training", "Air Support-Officer Training", 250000, {"CopBaseATM"}, "IsCop"}
	};
	
	ZKB_StationRobReqCops = 0; //Required number of cops online to rob a gas station Default: 0
	ZKB_BankRobReqCops = 5; //Required number of cops online to rob the bank Default: 5
	
	//Array of game logic for the government convoy and Assassin mission to spawn at, should be array of stringed object names
	ZKB_MissionStartPositions[] = {"GovConvoySpawn_1","GovConvoySpawn_2","GovConvoySpawn_3","GovConvoySpawn_4"};

	ZKB_GovConvoyReqCops = 2; //Required number of cops that need to be online in order for the government convoy to start Default: 2
	ZKB_GovConvoyLoopTime = 45; //Time in minutes between the government convoy Default: 45
	ZKB_GovConvoyCopReward = 40000; //Reward cops get when government convoy makes it to PD Default: 40000
	ZKB_GovConvoyStealReward = 20000; //Reward for the civ that steals the money. The reward is multiplied by the number of cops online Default: 20000
	
	ZKB_VipReqCops = 2; //Required number of cops that need to be online in order for the vip mission to start Default: 2
	ZKB_VipLoopTime = 55; //Time in minutes between the assassin/VIP mission Default: 55
	ZKB_VipReward = 50000; //Reward cops get when the VIP makes it to PD Default: 50000
	ZKB_VipKilledReward = 20000; //Reward for the civ that kills the vip. The reward is multiplied by the number of cops online Default: 20000
	
	ZKB_HostageReqCops = 5; //Required number of cops online to take a hostage Default: 5
	ZKB_HostageTime = 20; //Time in minutes the hostage taker has to defend the hostage Default: 20
	ZKB_HostageSafeReward = 100000; //Reward cops get when the hostage is freed or the hostage taker fails Default: 100000
	ZKB_HostageCivReward = 350000; //Reward to the civ that took the hostage and held it for the required amount of time Default: 350000
	ZKB_HostageKilledLoss = 15000; //How much does each Cop lose if the hostage was killed Default: 15000
	ZKB_HostageKilledBounty = 20000; //How much does the civ that kills the hostage get wanted for, the amount is this multiplied by the number of cops online Default: 20000
	};
	
	
	
	