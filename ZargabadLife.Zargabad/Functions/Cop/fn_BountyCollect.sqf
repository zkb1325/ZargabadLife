#include "..\..\ConfigMacros.hpp"
/*
    File: fn_BountyCollect.sqf
	Function: ZKB_fnc_BountyCollect
    Author: ZKB1325

    Description:
	Collects the bounty and shares it between cops
*/
private _bounty = param [0,0,[0]];
private _bountiesName = param [1,"",[""]];
private _bountySpreadMultiplier = (param [2,1,[1]]) max 1;

private _bountyCollected = floor (_bounty/_bountySpreadMultiplier);

["STR_Cop_BountyCollect",[_bountiesName,[_bounty] call ZKB_fnc_FormatNumber,[_bountyCollected] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
ZKB_BankAccount = (ZKB_BankAccount + _bountyCollected) min SETTING(getNumber,"ZKB_MaxBankAccount");