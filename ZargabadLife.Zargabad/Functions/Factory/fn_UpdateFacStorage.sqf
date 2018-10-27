/*
	Author: ZKB1325
	FileName: fn_UpdateFacStorage.sqf
	Function: ZKB_fnc_UpdateFacStorage
	Description: Handles updating whats in the factorys storage
	
	0: object
		Factory object
	1: String
		"Add" or "Remove"	
	2: String or Array
		"[Item, Amount_Available]"
		[Item, Amount_Available]
	3: Number
		Amount to handle
	4: Bool (Default: False)
		True/False if items are added to factory true wont remove anything from player inventory. if items are removed from factory it wont add any items to a players inventory
		
*/
private ["_factoryobject","_type","_itemarr","_handleitem","_handleitemamount","_handleamount","_forced","_factoryarray","_factorystorage","_storagearr"];

_factoryobject = param [0,objNull,[objNull]];
if (isNull _factoryobject) exitWith {};
ZKB_OpenFactory = _factoryobject;

_type = _this select 1;
if ((_this select 2) isEqualTo "") exitWith {};

if ((typeName (_this select 2)) == "String") then
	{
	_itemarr = call compile (_this select 2);	
	_handleitem = _itemarr select 0;
	_handleitemamount = _itemarr select 1;	
	}
	else
	{
	_itemarr = (_this select 2);
	_handleitem = _itemarr select 0;
	_handleitemamount = _itemarr select 1;
	};
	
if ((typeName (_this select 3)) == "String") then
	{
	_handleamount = floor (abs (parseNumber (_this select 3)));
	}
	else
	{
	_handleamount = floor (abs (_this select 3));
	};
_forced = param [4, false, [false]];

_factoryarray = _factoryobject getVariable "FactoryInfo";
_factorystorage = missionNameSpace getVariable [(_factoryarray select 6)+"Storage", []];

switch _type do
	{
	case "Add": 
		{
		if (_forced) exitWith
			{
			if ([_handleitem] call ZKB_fnc_GetFacItemAmount <= 0) then
				{
				_factorystorage pushBack [_handleitem,_handleamount];
				missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
				}
				else
				{
				{
				if ((_x select 0) == _handleitem) exitWith
					{
					_factorystorage set [_forEachIndex, [_handleitem, (_x select 1) + _handleamount]];
					};
				}forEach _factorystorage;
				missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
				};	
			};

		if ((([_handleitem] call ZKB_fnc_GetInvItemAmount) - _handleamount) < 0) exitWith {["STR_Fac_NotEnoughToStore"] call ZKB_fnc_DynamicText;};		
		
		[_handleitem, _handleamount] call ZKB_fnc_InvRemoveItem;
		
		if (([_handleitem] call ZKB_fnc_GetFacItemAmount) <= 0) then
				{
				_factorystorage pushBack [_handleitem,_handleamount];
				missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
				}
				else
				{
				{
				if ((_x select 0) == _handleitem) exitWith
					{
					_factorystorage set [_forEachIndex, [_handleitem, (_x select 1) + _handleamount]];
					};
				}forEach _factorystorage;
				missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
				};	
			
		};
		
	case "Remove":
		{
		
		{
		if ((_x select 0) == _handleitem) exitWith
			{
			if (_forced) then
				{
				if (((_x select 1) - _handleamount) <= 0) then
					{
					_factorystorage set [_forEachIndex, "Remove"];
					_factorystorage = _factorystorage - ["Remove"];
					missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
					}
					else
					{
					_storagearr = _x;
					_storagearr set [1, (_storagearr select 1) - _handleamount];
					_factorystorage set [_forEachIndex, _storagearr];
					missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
					};	
				}
				else
				{
				if (((_x select 1) - _handleamount) < 0) exitWith {["STR_Fac_NotEnoughToTake"] call ZKB_fnc_DynamicText;};
		
				if !([_handleitem, _handleamount] call ZKB_fnc_InvAddItem) exitWith {};
		
				if (((_x select 1) - _handleamount) <= 0) then
					{
					_factorystorage set [_forEachIndex, "Remove"];
					_factorystorage = _factorystorage - ["Remove"];
					missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
					}
					else
					{
					_storagearr = _x;
					_storagearr set [1, (_storagearr select 1) - _handleamount];
					_factorystorage set [_forEachIndex, _storagearr];
					missionNameSpace setVariable [(_factoryarray select 6)+"Storage",_factorystorage];
					};
				};	
			};
			
		}forEach _factorystorage;
		
		};
		
	default {};
	};

