/*
	Author: ZKB1325
	FileName: fn_ManufactureItem.sqf
	Function: ZKB_fnc_ManufactureItem
	Description: Starts the production of an item
*/

private ["_item","_requiredresources","_facarray","_facstorage","_workers","_reqitem","_hasreqitem","_factoryqueue","_manutime"];

_item = param [0,"",[""]];

if (_item isEqualTo "") exitWith {};

_requiredresources = [_item] call ZKB_fnc_GetItemNeedFactoryItems;
_facarray = ZKB_OpenFactory getVariable "FactoryInfo";
_facstorage = missionNameSpace getVariable [(_facarray select 6)+"Storage", []];
_workers = missionNameSpace getVariable [(_facarray select 6)+"Workers", 0];

if (_workers <= 0) exitWith {["STR_Fac_ManufactureNoWorkers"] call ZKB_fnc_DynamicText;};

_hasreqitem = 0;
{
_reqitem = _x;
	{
	if ((_x select 0) isEqualTo (_reqitem select 0)) then
		{
		if ((_x select 1) >= (_reqitem select 1)) then
			{
			_hasreqitem = _hasreqitem + 1;
			};
		};
	}forEach _facstorage;

}forEach _requiredresources;

if !(_hasreqitem isEqualTo (count _requiredresources)) exitWith {["STR_Fac_ManufactureNoResource"] call ZKB_fnc_DynamicText;};

{
[ZKB_OpenFactory, "Remove", [(_x select 0), (_x select 1)], (_x select 1), true] call ZKB_fnc_UpdateFacStorage;
}forEach _requiredresources;

_factoryqueue = missionNameSpace getVariable [(_facarray select 6)+"Queue", []];
_manutime = round(((([_item] call ZKB_fnc_GetItemBuyPrice)*.02)/_workers)/1.5) max 5;	

_factoryqueue pushBack [_item,_manutime];
missionNameSpace setVariable [(_facarray select 6)+"Queue", _factoryqueue];

["STR_Fac_ManufactureQueueAdd", [([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
call ZKB_fnc_SavePlayer;
	
	
	
	
	
	
	