/*
	Author: ZKB1325
	FileName: fn_ServerLoadStats.sqf
	Function: ZKB_fnc_ServerLoadStats
	
	Description: Loads all server stats. Mayor, Police chief, laws, taxes, shop stock.
*/

if !("exists" call ZKB_ServerStats) exitWith {};

missionNameSpace setVariable ["currentMayor",["read",["Mayor","MayorUID",""]] call ZKB_ServerStats,true];
ZKB_TaxArray = ["read",["Mayor","taxes",ZKB_TaxArray]] call ZKB_ServerStats;
publicVariable "ZKB_TaxArray";
ZKB_LawArray = ["read",["Mayor","Laws",ZKB_LawArray]] call ZKB_ServerStats;
publicVariable "ZKB_LawArray";
missionNameSpace setVariable ["currentChief",["read",["Chief","ChiefUID",""]] call ZKB_ServerStats,true];

private ["_shopData"];
{
_shopData = (_x select 0) getVariable "ShopData";
_shopData set [8,["read",["ShopStock",format ["Shop_%1",_forEachIndex],_shopData select 8]] call ZKB_ServerStats];
(_x select 0) setVariable ["ShopData",_shopData,true];
}forEach ZKB_ShopDefines;

setDate (["read",["Date","Date",date]] call ZKB_ServerStats);