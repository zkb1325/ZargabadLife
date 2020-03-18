/*
	File: fn_CheckInventory.sqf
	Function: ZKB_fnc_CheckInventory
	Author: ZKB1325
	Description: Views the inventory of a player
	
	0: Object
		player to check the inventory of
*/
private _checkedPlayer = param [0,objNull,[objNull]];
if (isNull _checkedPlayer) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (!([_checkedPlayer] call ZKB_fnc_IsRestrained) and !([_checkedPlayer] call ZKB_fnc_IsSurrending)) exitWith {["STR_Cop_NotSurrenderingOrRestrained",[name _checkedPlayer]] call ZKB_fnc_DynamicText;};

closeDialog 0;

disableSerialization;
createDialog "ZKB_GenList";

private _display = uiNamespace getVariable "ZKB_GenList";
private _frame = _display displayCtrl 1002;
private _listCtrl = _display displayCtrl 1010;

_frame ctrlSetText format [localize "STR_Cop_PlayersInventory",(name _checkedPlayer)];
["STR_Admin_PlayerLogsCheckedInventory",name player,name _checkedPlayer] call ZKB_fnc_AdminAddPlayerLog;

private _playerInventoryItems = _checkedPlayer getVariable ["ZKB_Inventory",[]];

{
private _index = _listCtrl lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)]call ZKB_fnc_FormatNumber)];
if ([_x select 0] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
}forEach _playerInventoryItems;

_listCtrl lbAdd "";
_listCtrl lbAdd localize "STR_Cop_PlayersLicenses";
_playerLicense = (_checkedPlayer getVariable ["ZKB_Licenses",[]]);
if (count _playerLicense > 0) then
	{
	{
	_listCtrl lbAdd (_x call ZKB_fnc_GetLicenseDisplayName);
	}forEach _playerLicense;
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};

_listCtrl lbAdd "";
_listCtrl lbAdd localize "STR_Cop_PrimaryWeapon";

if (primaryWeapon _checkedPlayer != "") then
	{
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
		};
	}forEach (([primaryWeapon _checkedPlayer]) + (primaryWeaponMagazine _checkedPlayer) + (primaryWeaponItems _checkedPlayer));
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};

_listCtrl lbAdd "";	
_listCtrl lbAdd localize "STR_Cop_Handgun";

if (handgunWeapon _checkedPlayer != "") then
	{
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
		};
	}forEach (([handgunWeapon _checkedPlayer]) + (handgunMagazine _checkedPlayer) + (handgunItems _checkedPlayer));
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};	

_listCtrl lbAdd "";	
_listCtrl lbAdd localize "STR_Cop_Secondary";

if (secondaryWeapon _checkedPlayer != "") then
	{
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
		};
	}forEach (([secondaryWeapon _checkedPlayer]) + (secondaryWeaponMagazine _checkedPlayer) + (secondaryWeaponItems _checkedPlayer));
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};
	
_listCtrl lbAdd "";
_listCtrl lbAdd localize "STR_Cop_Uniform";

if (uniform _checkedPlayer != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
		};
	}forEach (([uniform _checkedPlayer]) + (uniformItems _checkedPlayer));
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};

_listCtrl lbAdd "";	
_listCtrl lbAdd localize "STR_Cop_Vest";

if (vest _checkedPlayer != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
		};
	}forEach (([vest _checkedPlayer]) + (vestItems _checkedPlayer));
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};

_listCtrl lbAdd "";	
_listCtrl lbAdd localize "STR_Cop_Backpack";

if (backpack _checkedPlayer != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
		};
	}forEach (([backpack _checkedPlayer]) + (backpackItems _checkedPlayer));
	}
	else
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};	

_listCtrl lbAdd "";	
_listCtrl lbAdd localize "STR_Cop_OtherGear";
	
{
private _item = _x;
private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
if (count _itemConfig > 0) then
	{
	private _index = _listCtrl lbAdd format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
	if ([configName (_itemConfig select 0)] call ZKB_fnc_GetItemIsIllegal) then {_listCtrl lbSetColor [_index, [1,0,0,1]]};
	};
}forEach (([headgear _checkedPlayer]) + ([goggles _checkedPlayer]) + (assignedItems _checkedPlayer));

if (count (([headgear _checkedPlayer]) + ([goggles _checkedPlayer]) + (assignedItems _checkedPlayer)) isEqualTo 0) then
	{
	_listCtrl lbAdd ("- " + localize "STR_Common_None");
	};
	
	
	
	
	
	
	
	
	
	
	