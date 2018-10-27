enableSaving [false,false];

if (isServer) then
	{
	[] spawn ZKB_fnc_InitServer;
	};
	
if !(isdedicated) then
	{
	disableMapIndicators [true,true,true,true];
	showHUD [true,true,false,false,false,false,true,true,true];
	//enableRadio false; //Disables group chat messages
	enableSentences false;
	//0 fadeRadio 0; //Test to see if need otherwise if enabled will remove lock-on warning for helicopters
	waitUntil {!isNull player && player == player and time > 0 and !isNil "ZKB_ServerInt"};	
	
	_script = [] execVM "Configs\Variables.sqf";
	WaitUntil {scriptDone _script};

	if !(isServer) then
		{
		_script = [] execVM "Configs\Shops.sqf";
		WaitUntil {scriptDone _script};
		};

	_script = [] execVM "Configs\Factories.sqf";
	WaitUntil {scriptDone _script};
	
	waitUntil {!(isNull (findDisplay 46))};
		
	call ZKB_fnc_SetUpRadioTriggers;
	call ZKB_fnc_SetUpLicenses;
	call ZKB_fnc_AddActions;
	
	//Player Init
	call ZKB_fnc_InitPlayer;
	call ZKB_fnc_InitCBAKeyBinds;
	
	[] spawn ZKB_fnc_GasStationInit;
	[] spawn ZKB_fnc_SetUpWorkplaces;
	["HungerLoop"] spawn ZKB_fnc_Food;
	[player] call ZKB_fnc_GroupGang;
	[] spawn ZKB_fnc_PaycheckLoop;
	[] spawn ZKB_fnc_HudTags;
	[] spawn ZKB_fnc_TearGasLoop;
	};