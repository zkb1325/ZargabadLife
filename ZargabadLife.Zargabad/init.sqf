#include "ConfigMacros.hpp"
enableSaving [false,false];

if (isServer) then
	{
	[] spawn ZKB_fnc_InitServer;
	};
	
if !(isdedicated) then
	{
	disableMapIndicators [true,true,true,true];
	showHUD [true,true,false,false,false,false,true,true,true];
	//enableRadio false; //Disables group chat messages including scripted
	enableSentences false;
	//0 fadeRadio 0; //Test to see if need otherwise if enabled will remove lock-on warning for helicopters
	
	waitUntil {!isNull player && player == player and time > 0 and !(isNull (findDisplay 46))};
	startLoadingScreen [localize "STR_Loading_Server"];	
	waitUntil {!isNil "ZKB_ServerInt"};	
	progressLoadingScreen .1;
	_script = [] execVM "Configs\Variables.sqf";
	WaitUntil {scriptDone _script};
	progressLoadingScreen .2;
	if !(isServer) then
		{
		_script = [] execVM "Configs\Shops.sqf";
		WaitUntil {scriptDone _script};
		};

	_script = [] execVM "Configs\Factories.sqf";
	WaitUntil {scriptDone _script};
	progressLoadingScreen .3;
		
	call ZKB_fnc_SetUpRadioTriggers;
	progressLoadingScreen .4;
	call ZKB_fnc_SetUpLicenses;
	progressLoadingScreen .5;
	call ZKB_fnc_AddActions;
	progressLoadingScreen .6;
	
	//Player Init
	call ZKB_fnc_InitPlayer;
	progressLoadingScreen .7;
	if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) then 
		{
		call ZKB_fnc_InitCBAKeyBinds;
		};
	progressLoadingScreen .8;
	
	[] spawn ZKB_fnc_GasStationInit;
	[] spawn ZKB_fnc_SetUpWorkplaces;
	["HungerLoop"] spawn ZKB_fnc_Food;
	[player] call ZKB_fnc_GroupGang;
	progressLoadingScreen .9;
	[] spawn ZKB_fnc_PaycheckLoop;
	[] spawn ZKB_fnc_HudTags;
	[] spawn ZKB_fnc_TearGasLoop;
	progressLoadingScreen 1;
	endLoadingScreen;
	};