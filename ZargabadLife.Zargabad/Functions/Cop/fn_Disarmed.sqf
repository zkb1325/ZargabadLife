/*
    File: fn_Disarmed.sqf
	Function: ZKB_fnc_Disarmed
    Author: ZKB1325

    Description:
	Removes all gear from a unit except Watch, Compass, GPS, Map, Radio, Uniform (unless illegal), Helmet (unless illegal), and Glasses
*/
private _disrmedBy = param [0,objNull,[objNull]];
private _illegalGearValue = 0;

if (primaryWeapon player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice);};
		};
	}forEach ((primaryWeaponItems player) + (primaryWeaponMagazine player) + ([primaryWeapon player]));
	
	player removeWeapon (primaryWeapon player);
	};
	
if (handgunWeapon player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice);};
		};
	}forEach ((handgunItems player) + (handgunMagazine player) + ([handgunWeapon player]));

	player removeWeapon (handgunWeapon player);
	};	
	
if (secondaryWeapon player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice);};
		};
	}forEach ((secondaryWeaponItems player) + (secondaryWeaponMagazine player) + ([secondaryWeapon player]));

	player removeWeapon (secondaryWeapon player);
	};
	
if (backpack player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice);};
		};
	}forEach ((backpackItems player) + ([backpack player]));

	removeBackpack player;
	};
	
if (vest player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice);};
		};
	}forEach ((vestItems player) + ([vest player]));

	removeVest player;
	};	
	
if (uniform player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice);};
		};
	player removeItemFromUniform _x;
	}forEach (uniformItems player);
	
	private _itemConfig = "getText (_x >> ""className"") isEqualTo (uniform player)" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice); removeUniform player;};
		};
	};
	
if (headgear player != "") then
	{
	private _itemConfig = "getText (_x >> ""className"") isEqualTo (headgear player)" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice); removeHeadgear player;};
		};
	};
	
if (hmd player != "") then
	{
	private _itemConfig = "getText (_x >> ""className"") isEqualTo (hmd player)" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_illegalGearValue = _illegalGearValue + ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemSellPrice); player removeItem (hmd player);};
		};
	};
	
["STR_Cop_Disarmed",[name _disrmedBy]] call ZKB_fnc_DynamicText;
if (_illegalGearValue > 0) then
	{
	[player,"Illegal Gear",_illegalGearValue] call ZKB_fnc_AddWanted;
	["STR_Cop_DisarmedIllegal",[name player,[_illegalGearValue] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",[west,player],false];
	};
[] spawn ZKB_fnc_SavePlayer;
	