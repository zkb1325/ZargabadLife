#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AdminCompItemReceive.sqf
	Function: ZKB_fnc_AdminCompItemReceive
	Description: Comps an item to a player. Can be virtual item, gear, or vehicle

*/
private _compedBy = param [0,objNull,[objNull]];
private _compItem = param [1,"",[""]];
private _compAmount = param [2,0,[0]];

private _itemClass = getText (missionConfigFile >> "Item_Config" >> _compItem >> "className");
private _itemtype = ([_itemClass] call ZKB_fnc_GetConfigByClass);

if !(_itemtype == "VirtualItem") then
	{
	if !(_itemtype == "CfgVehicles" and ((_itemClass call ZKB_fnc_GetGearType) == 0)) then {_itemtype = "CfgBackpack";};
	};
	
switch _itemtype do
	{
	case "VirtualItem":
		{
		[_compItem,_compAmount,true] call ZKB_fnc_InvAddItem;
		["STR_Admin_CompReceiveItem",[name _compedBy,[_compAmount] call ZKB_fnc_FormatNumber,[_compItem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
		};	
	case "CfgVehicles":
		{
		[_itemClass,player,-1,player,"",[],0,true] spawn ZKB_fnc_CreateVehicle;
		["STR_Admin_CompReceiveVehicle",[name _compedBy,[_compItem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
		};
	default
		{
		private _gearbox = objNull;
		if (count (nearestObjects [player,["GroundWeaponHolder"],2]) > 0) then
			{
			_gearbox = ((nearestObjects [player,["GroundWeaponHolder"],2]) select 0);
			}
			else
			{
			_gearbox = "GroundWeaponHolder" createVehicle position player; 
			_gearbox setPosATL getPosATL player;
			};
			
		private _geartype = _itemClass call ZKB_fnc_GetGearType;
		switch _geartype do 
			{	
			case 1:{
					_gearbox addWeaponCargoGlobal [_itemClass, _compAmount];
					};
			case 2:{
					_gearbox addMagazineCargoGlobal [_itemClass, _compAmount];
					};
			case 3:{
					_gearbox addItemCargoGlobal [_itemClass, _compAmount];
					};
			case 4:{ 
					_gearbox addBackpackCargoGlobal [_itemClass, _compAmount];
					};
			};
		["STR_Admin_CompReceiveGearItem",[name _compedBy,[_compAmount] call ZKB_fnc_FormatNumber,[_compItem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
		};
	};
