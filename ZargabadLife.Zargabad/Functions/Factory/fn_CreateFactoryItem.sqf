/*
	File: fn_CreateFactoryItem.sqf
	Function: ZKB_fnc_CreateFactoryItem
	Author: ZKB1325
	Description: Runs when a player clicks the create button in a factory
*/

private _item = param [0,"",[""]];
if (_item isEqualTo "") exitWith {};
private _itemClass = getText (missionConfigFile >> "Item_Config" >> _item >> "className");


private _facarray = ZKB_OpenFactory getVariable "FactoryInfo";
private _facstoragecompleted = missionNameSpace getVariable [(_facarray select 6)+"StorageCompleted", []];
private _itemtype = ([_itemClass] call ZKB_fnc_GetConfigByClass);

if !(_itemtype == "VirtualItem") then
	{
	if !(_itemtype == "CfgVehicles" and ((_itemClass call ZKB_fnc_GetGearType) == 0)) then {_itemtype = "CfgBackpack";};
	};

private _amountready = 0;	
{
if ((_x select 0) == _item) exitWith
	{
	_amountready = (_x select 1);
	};	
}forEach _facstoragecompleted;
	
if (_amountready < 1) exitWith {["STR_Fac_CreateNoneReady",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;};

switch _itemtype do
	{
	case "VirtualItem":
		{
		[ZKB_OpenFactory,"Remove",_item,1] call ZKB_fnc_UpdateFacStorageCompleted;
		[missionNameSpace,(_facarray select 6)+"Storage",_item,1] call ZKB_fnc_DualInvAddItem;
		["STR_Fac_CreatedItem",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
		};	
	case "CfgVehicles":
		{
		private _vehspawnpoint = (_facarray select 4);
		if (isNull _vehspawnpoint) exitWith {};
		private _impounded = false;
		if (count (nearestobjects [getpos _vehspawnpoint,["motorcycle","Car","Tank","Ship","Air"], 3]) > 0) then {_impounded = [(nearestobjects [getpos _vehspawnpoint,["motorcycle","Car","Tank","Ship","Air"], 3]) # 0,true] call ZKB_fnc_Impound;};
		if ((count (nearestobjects [getpos _vehspawnpoint,["motorcycle","Car","Tank","Ship","Air"], 3]) > 0) and !_impounded) exitWith {["STR_Shop_VehSpawnBlocked"] call ZKB_fnc_DynamicText;};
		[ZKB_OpenFactory,"Remove",_item,1] call ZKB_fnc_UpdateFacStorageCompleted;
		[_itemClass,_vehspawnpoint,-1,player] spawn ZKB_fnc_CreateVehicle;
		closeDialog 0;
		["STR_Fac_CreatedVeh",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
		};
	default
		{
		[ZKB_OpenFactory,"Remove",_item,1] call ZKB_fnc_UpdateFacStorageCompleted;
		private _gearbox = (_facarray select 3);
		if (isNull _gearbox) then 
			{
			if (count (nearestObjects [player,["GroundWeaponHolder"],2]) > 0) then
				{
				_gearbox = ((nearestObjects [player,["GroundWeaponHolder"],2]) select 0);
				}
				else
				{
				_gearbox = "GroundWeaponHolder" createVehicle position player; 
				_gearbox setPosATL getPosATL player;
				};
			};
		private _geartype = _itemClass call ZKB_fnc_GetGearType;
		switch _geartype do 
			{	
			case 1:{
					_gearbox addWeaponCargoGlobal [_itemClass, 1];
					};
			case 2:{
					_gearbox addMagazineCargoGlobal [_itemClass, 1];
					};
			case 3:{
					_gearbox addItemCargoGlobal [_itemClass, 1];
					};
			case 4:{ 
					_gearbox addBackpackCargoGlobal [_itemClass, 1];
					};
			};
		["STR_Fac_CreatedGear",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
		};
	};