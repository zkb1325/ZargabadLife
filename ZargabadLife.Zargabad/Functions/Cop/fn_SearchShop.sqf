/*
	File: fn_SearchShop.sqf
	Function: ZKB_fnc_SearchShop
	Author: ZKB1325
	Description: searches a shop for illegal items sold and wants the players the sold
	
	0: Object
		shop object to search
*/
private _shop = param [0,objNull,[objNull]];
if (isNull _shop) exitWith {};
private _soldArray = _shop getVariable ["soldDrugs",[]];
if (count _soldArray isEqualTo 0) exitWith {["STR_Cop_SearchedShopNothing",[(if (isLocalized ((_shop getVariable "ShopData") select 1)) then {localize ((_shop getVariable "ShopData") select 1)}else{((_shop getVariable "ShopData") select 1)})]] call ZKB_fnc_DynamicText;};

{
private _soldPlayer = [(_x select 0)] call ZKB_fnc_GetPlayerFromID;
if (!(isNull _soldPlayer) and !(side _soldPlayer isEqualTo west)) then
	{
	["STR_Cop_SearchedShopSold",[(if (isLocalized ((_shop getVariable "ShopData") select 1)) then {localize ((_shop getVariable "ShopData") select 1)}else{((_shop getVariable "ShopData") select 1)}),name _soldPlayer,[_x select 1] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	[_soldPlayer,format ["Drug Dealing ($%1)",(_x select 1)],(_x select 1)] call ZKB_fnc_AddWanted;
	};
}forEach _soldArray;

_shop setVariable ["soldDrugs",[],true];