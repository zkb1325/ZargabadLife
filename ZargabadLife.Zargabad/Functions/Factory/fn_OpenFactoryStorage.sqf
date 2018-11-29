#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_OpenFactoryStorage.sqf
	Function: ZKB_fnc_OpenFactoryStorage
	Description: Gets needed info to open the factory storage menu
*/
ZKB_OpenFactory = _this select 0;
private _facInfo = ZKB_OpenFactory getVariable "FactoryInfo";
private _facStorageVar = (_facInfo select 6)+"Storage";

[
[missionNamespace,_facStorageVar,-1,false,"STR_Fac_FactoryStorage","STR_Fac_TakeItem",[true]+ZKB_FactoryResources],
[player,"ZKB_Inventory",player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")],true,"STR_Inv_Inventory","STR_Fac_StoreItem"]
] spawn ZKB_fnc_DualInvOpen;
