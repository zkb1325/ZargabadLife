/*
	File: fn_SearchPlayer.sqf
	Function: ZKB_fnc_SearchPlayer
	Author: ZKB1325
	Description: searches a player for illegal items
	
	0: Object
		player to search
*/
private _searchedPlayer = param [0,objNull,[objNull]];
if (isNull _searchedPlayer) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (!([_searchedPlayer] call ZKB_fnc_IsRestrained) and !([_searchedPlayer] call ZKB_fnc_IsSurrending)) exitWith {["STR_Cop_NotSurrenderingOrRestrained",[name _searchedPlayer]] call ZKB_fnc_DynamicText;};

["STR_Cop_Searched",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_searchedPlayer,false];

private _searchedPlayerInventory = _searchedPlayer getVariable ["ZKB_Inventory",[]];
private _searchedPlayerInventoryRemove = [];

private _illegalValue = 0;

{
if ([_x select 0] call ZKB_fnc_GetItemIsIllegal) then
	{
	_illegalValue = _illegalValue + (([_x select 0] call ZKB_fnc_GetItemSellPrice)*(_x select 1));
	_searchedPlayerInventoryRemove pushBack _x;
	if ((_x select 0) isEqualTo "BlueInk") then
		{
		[_searchedPlayer,format ["Robbing The Bank ($%1)",(_x select 1)],0] call ZKB_fnc_AddWanted;
		};
	};
}forEach _searchedPlayerInventory;

if (_illegalValue > 0) then
	{
	[_searchedPlayer,"Illegal Items",_illegalValue] call ZKB_fnc_AddWanted;
	["STR_Cop_SearchIllegal",[name _searchedPlayer, [_illegalValue] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	_searchedPlayerInventoryRemove remoteExecCall ["ZKB_fnc_SearchPlayerRemoveItems",_searchedPlayer,false];
	}
	else
	{
	["STR_Cop_SearchNothing",[name _searchedPlayer]] call ZKB_fnc_DynamicText;
	};