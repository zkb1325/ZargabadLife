#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_GovernmentConvoyCivWin.sqf
	Function: ZKB_fnc_GovernmentConvoyCivWin
	Description: Civ winning government convoy
*/
(_this select 0) setVariable ["civWins",true,true];
private _stoleAmount = round ((playersNumber west) * SETTING(getNumber,"ZKB_GovConvoyStealReward"));
["STR_GovConvoy_Stole",[[_stoleAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
["Money",_stoleAmount] call ZKB_fnc_InvAddItem;
[player,format ["Theft of Government Funds ($%1)",_stoleAmount],_stoleAmount] call ZKB_fnc_AddWanted;