#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_HostageKilledKiller.sqf
	Function: ZKB_fnc_HostageKilledKiller
	
	Description: Runs on the civ that killed the hostage
*/
private _bounty = round (SETTING(getNumber,"ZKB_HostageKilledBounty") * (playersNumber west));
["STR_Hostage_HostageKilledCiv",[[_bounty] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
[player,"Killing the Hostage",_bounty] call ZKB_fnc_AddWanted;