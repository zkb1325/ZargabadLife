/*
	Author: ZKB1325
	FileName: fn_UpdateVehicleTrunk.sqf
	Function: ZKB_fnc_UpdateVehicleTrunk
	Description: Handles updating whats in the vehicles trunk
	
	0: object
		vehicle
	1: String
		"Add" or "Remove"	
	2: String or Array
		"[Item, Amount_Available]"
		[Item, Amount_Available]
	3: Number
		Amount to handle
	4: Bool (Default: False)
		True/False if items are added to vehicles trunk, true wont remove anything from player inventory. if items are removed from factory it wont add any items to a players inventory
		
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

private _type = param [1,"",[""]];
if (_type isEqualTo "") exitWith {};

private _itemArr = param [2,"",["",[]]];
if (_itemArr isEqualTo "" or _itemArr isEqualTo []) exitWith {};
private _handleItem = "";
private _handleItemAmount = 0;


if (typeName _itemArr isEqualTo typeName "") then
	{
	_itemArr = call compile _itemArr;	
	_handleItem = _itemArr select 0;
	_handleItemAmount = _itemArr select 1;	
	}
	else
	{
	_handleItem = _itemArr select 0;
	_handleItemAmount = _itemArr select 1;
	};
	
private _handleAmount = param [3,0,[0,""]];	
	
if (typeName _handleAmount isEqualTo typeName "") then
	{
	_handleAmount = floor (abs (parseNumber _handleAmount));
	}
	else
	{
	_handleAmount = floor (abs _handleAmount);
	};
_forced = param [4, false, [false]];

private _vehicleTrunkItems = _vehicle getVariable ["VehicleTrunk",[]];

switch _type do
	{
	case "Add": 
		{
		if (_forced) exitWith
			{
			if (([_vehicle,_handleItem] call ZKB_fnc_GetTrunkItemAmount) <= 0) then
				{
				_vehicleTrunkItems pushBack [_handleItem,_handleamount];
				_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
				}
				else
				{
				{
				if ((_x select 0) == _handleItem) exitWith
					{
					_vehicleTrunkItems set [_forEachIndex, [_handleItem, (_x select 1) + _handleamount]];
					};
				}forEach _vehicleTrunkItems;
				_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
				};	
			};

		if !([_handleItem] call ZKB_fnc_GetItemCanGive) exitWith {["STR_Inv_NotAllowedToGive", [[_handleItem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
		if !([_handleItem] call ZKB_fnc_GetItemCanDrop) exitWith {["STR_Inv_NotAllowedToDrop", [[_handleItem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
		private _curVehicleWeight = 0;
		{
		_curVehicleWeight = _curVehicleWeight + (([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1));
		}forEach _vehicleTrunkItems;
		if ((([_handleItem] call ZKB_fnc_GetInvItemAmount) - _handleamount) < 0) exitWith {["STR_Fac_NotEnoughToStore"] call ZKB_fnc_DynamicText;};		
		if ((_curVehicleWeight + (([_handleItem] call ZKB_fnc_GetItemWeight)*_handleamount)) > ([typeOf _vehicle] call ZKB_fnc_GetItemTrunkSpace)) exitWith {["STR_Vehicle_VehicleTrunkFull"] call ZKB_fnc_DynamicText;};		
		
		[_handleItem, _handleamount] call ZKB_fnc_InvRemoveItem;
		
		if (([_vehicle,_handleItem] call ZKB_fnc_GetTrunkItemAmount) <= 0) then
				{
				_vehicleTrunkItems pushBack [_handleItem,_handleamount];
				_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
				}
				else
				{
				{
				if ((_x select 0) == _handleItem) exitWith
					{
					_vehicleTrunkItems set [_forEachIndex, [_handleItem, (_x select 1) + _handleamount]];
					};
				}forEach _vehicleTrunkItems;
				_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
				};	
			
		};
		
	case "Remove":
		{
		
		{
		if ((_x select 0) == _handleItem) exitWith
			{
			if (_forced) then
				{
				if (((_x select 1) - _handleamount) <= 0) then
					{
					_vehicleTrunkItems set [_forEachIndex, "Remove"];
					_vehicleTrunkItems = _vehicleTrunkItems - ["Remove"];
					_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
					}
					else
					{
					_storagearr = _x;
					_storagearr set [1, (_storagearr select 1) - _handleamount];
					_vehicleTrunkItems set [_forEachIndex, _storagearr];
					_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
					};	
				}
				else
				{
				if (((_x select 1) - _handleamount) < 0) exitWith {["STR_Vehicle_NotEnoughToTake"] call ZKB_fnc_DynamicText;};
		
				if !([_handleItem, _handleamount] call ZKB_fnc_InvAddItem) exitWith {};
				
				if (((_x select 1) - _handleamount) <= 0) then
					{
					_vehicleTrunkItems set [_forEachIndex, "Remove"];
					_vehicleTrunkItems = _vehicleTrunkItems - ["Remove"];
					_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
					}
					else
					{
					_storagearr = _x;
					_storagearr set [1, (_storagearr select 1) - _handleamount];
					_vehicleTrunkItems set [_forEachIndex, _storagearr];
					_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];
					};
					
				};	
			};
			
		}forEach _vehicleTrunkItems;
		
		};
	};

