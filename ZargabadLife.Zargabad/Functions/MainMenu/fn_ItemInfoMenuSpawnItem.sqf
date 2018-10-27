/*
	Author: ZKB1325
	File: fn_ItemInfoMenuSpawnItem.sqf
	Function: ZKB_fnc_ItemInfoMenuSpawnItem
	Description: Spawns the selected Item from the item info menu. 
	Virtual items are forced into the players inventory.
	Gear is created in a weapon holder on the ground or a nearby already existing weapon holder.
	Vehicles are created next to the player
*/
private _item = param [0,"",[""]];
private _itemClass = getText (missionConfigFile >> "Item_Config" >> _item >> "className");

private _itemtype = ([_itemClass] call ZKB_fnc_GetConfigByClass);

if !(_itemtype == "VirtualItem") then
	{
	if !(_itemtype == "CfgVehicles" and ((_itemClass call ZKB_fnc_GetGearType) == 0)) then {_itemtype = "CfgBackpack";};
	};
	
switch _itemtype do
	{
	case "VirtualItem":
		{
		[_item,1,true] call ZKB_fnc_InvAddItem;
		["STR_MainMenu_ItemInfoSpawnInventory",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
		};	
	case "CfgVehicles":
		{
		[_itemClass,player,-1,player,"",[],0,true] spawn ZKB_fnc_CreateVehicle;
		["STR_MainMenu_ItemInfoSpawnVehicle",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
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
		["STR_MainMenu_ItemInfoSpawnGear",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;
		};
	};