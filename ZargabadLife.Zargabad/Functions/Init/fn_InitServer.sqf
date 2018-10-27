/*
	Author: ZKB1325
	FileName: fn_InitServer.sqf
	Function: ZKB_fnc_InitServer
	
	Description: Init for the server, the client wont load until this function is done
*/

addMissionEventHandler ["HandleDisconnect",{deletevehicle (_this select 0);}];

[] spawn ZKB_fnc_ElectionLoop;


_handle = [] execVM "Configs\Shops.sqf";
waitUntil {scriptDone _handle};

//Array of laws have as many as you want or just add "" to let the player come up with some on there own
ZKB_LawArray = ["Always Drive on the RIGHT side of the road","Always Holster weapons in Towns.","Speed limits 60 in town 90 out","","","","","","","","","","","",""];
publicVariable "ZKB_LawArray";
ZKB_TaxArray = [5, 5, 5, 5, 5]; //Array of Taxes [Item Tax, Vehicle Tax, Magazine Tax, Weapon Tax, Bank Transfer Tax]
publicVariable "ZKB_TaxArray";

[] spawn ZKB_fnc_GovernmentConvoy;
[] spawn ZKB_fnc_AssassinMission;

ZKB_ServerInt = true;
publicVariable "ZKB_ServerInt";