#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_ServerSaveStats.sqf
	Function: ZKB_fnc_ServerSaveStats
	
	Description: Intended to save server stats. Mayor, Police chief, laws, taxes, shop stock.
*/
private _statID = param [0,"",[""]];
private _statData = param [1,nil,[1,"",[]]];

switch _statID do
	{
	case "mayor":
		{
		["write",["Mayor","MayorUID",_statData]] call ZKB_ServerStats;
		};
	case "taxes":
		{
		["write",["Mayor","Taxes",_statData]] call ZKB_ServerStats;
		};
	case "laws":
		{
		["write",["Mayor","Laws",_statData]] call ZKB_ServerStats;
		};
	case "chief":
		{
		["write",["Chief","ChiefUID",_statData]] call ZKB_ServerStats;
		};
	case "shopstocks": //If anything in ZKB_ShopDefines is changed make sure to wipe the stats for shop stocks 
		{
		private ["_shopData","_curShopStock"];
		{
		_shopData = (_x select 0) getVariable "ShopData";
		_curShopStock = _shopData select 8;
		["write",["ShopStock",format ["Shop_%1",_forEachIndex],_curShopStock]] call ZKB_ServerStats;
		}forEach ZKB_ShopDefines;
		};
	default {diag_log format ["Error saving server stat, Unknown ID: %1 - Data: %2",_statID,_statData];};
	};