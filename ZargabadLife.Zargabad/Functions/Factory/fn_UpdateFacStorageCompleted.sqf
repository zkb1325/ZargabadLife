/*
	Author: ZKB1325
	FileName: fn_UpdateFacStorageCompleted.sqf
	Function: ZKB_fnc_UpdateFacStorageCompleted
	Description: Handles updating whats in the factories completed storage
	
	0: object
		Factory object
	1: String
		"Add" or "Remove"	
	2: String
		Item
	3: Number
		Amount to handle
		
*/
private _factoryobject = param [0,objNull,[objNull]];
if (isNull _factoryobject) exitWith {};

private _type = _this select 1;
if ((_this select 2) isEqualTo "") exitWith {};

private _item = param [2,"",[""]];
if (_item isEqualTo "") exitWith {};
private _amount = param [3,0,[0]];

_factoryarray = _factoryobject getVariable "FactoryInfo";
_facstoragecompleted = missionNameSpace getVariable [(_factoryarray select 6)+"StorageCompleted", []];

switch _type do
	{
	case "Add": 
		{
		private _return = 0;
		{
		if ((_x select 0) == _item) exitWith
			{
			_return = (_x select 1);
			};
		}forEach _facstoragecompleted;
		
		if (_return <= 0) then
			{
			_facstoragecompleted pushBack [_item,_amount];
			missionNameSpace setVariable [(_factoryarray select 6)+"StorageCompleted",_facstoragecompleted];
			}
			else
			{
			{
			if ((_x select 0) == _item) exitWith
				{
				_facstoragecompleted set [_forEachIndex, [_item, (_x select 1) + _amount]];
				};
			}forEach _facstoragecompleted;
			missionNameSpace setVariable [(_factoryarray select 6)+"StorageCompleted",_facstoragecompleted];
			};	
		};
		
	case "Remove":
		{
		
		{
		if ((_x select 0) == _item) exitWith
			{
			if (((_x select 1) - _amount) <= 0) then
				{
				_facstoragecompleted set [_forEachIndex, "Remove"];
				_facstoragecompleted = _facstoragecompleted - ["Remove"];
				missionNameSpace setVariable [(_factoryarray select 6)+"StorageCompleted",_facstoragecompleted];
				}
				else
				{
				_storagearr = _x;
				_storagearr set [1, (_storagearr select 1) - _amount];
				_facstoragecompleted set [_forEachIndex, _storagearr];
				missionNameSpace setVariable [(_factoryarray select 6)+"StorageCompleted",_facstoragecompleted];
				};	
			};
			
		}forEach _facstoragecompleted;
		
		};
		
	default {};
	};

