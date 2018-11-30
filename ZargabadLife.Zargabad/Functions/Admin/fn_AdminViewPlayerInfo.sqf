/*
	Author: ZKB1325
	FileName: fn_AdminViewPlayerInfo.sqf
	Function: ZKB_fnc_AdminViewPlayerInfo
	Description: Views the player logs

*/
private _player = param [0,objNull,[objNull]];
if (isNull _player) exitWith {};

private _display = uiNamespace getVariable "ZKB_Admin";
private _playerInfoFrameCtrl = _display displayCtrl 50061;
private _playerInfoBoxCtrl = _display displayCtrl 50063;
private _playerInfoFrame2Ctrl = _display displayCtrl 50065;
private _playerInfoLogBoxCtrl = _display displayCtrl 50067;

_playerInfoFrameCtrl ctrlSetText format [localize "STR_Admin_PlayerInfoFrame",name _player];
_playerInfoFrame2Ctrl ctrlSetText format [localize "STR_Admin_PlayerInfoLogsFrame",name _player];

private _playerInfoStr = "";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoName",name _player];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoPlayer",_player];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoBankAccount",[_player getVariable ["BankAccount",0]] call ZKB_fnc_FormatNumber];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoCopKills",(_player getVariable ["CopKills",[0,0]]) select 0,(_player getVariable ["CopKills",[0,0]]) select 1];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoCivKills",(_player getVariable ["CivKills",[0,0]]) select 0,(_player getVariable ["CivKills",[0,0]]) select 1];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoSuicides",_player getVariable ["Suicides",0]];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoDeaths",_player getVariable ["Deaths",0]];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + format [localize "STR_Admin_PlayerInfoHunger",_player getVariable ["Hunger",0]];
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Admin_PlayerInfoInventory";
private _playerInventoryItems = _player getVariable ["ZKB_Inventory",[]];
_playerInfoStr = _playerInfoStr + "<br/>";
{
_playerInfoStr = _playerInfoStr + format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)]call ZKB_fnc_FormatNumber)];
_playerInfoStr = _playerInfoStr + "<br/>";
}forEach _playerInventoryItems;

_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_PlayersLicenses";
_playerInfoStr = _playerInfoStr + "<br/>";
_playerLicense = (_player getVariable ["ZKB_Licenses",[]]);
if (count _playerLicense > 0) then
	{
	{
	_playerInfoStr = _playerInfoStr + (_x call ZKB_fnc_GetLicenseDisplayName);
	_playerInfoStr = _playerInfoStr + "<br/>";
	}forEach _playerLicense;
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};

_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_PrimaryWeapon";
_playerInfoStr = _playerInfoStr + "<br/>";
if (primaryWeapon _player != "") then
	{
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	}forEach (([primaryWeapon _player]) + (primaryWeaponMagazine _player) + (primaryWeaponItems _player));
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};

_playerInfoStr = _playerInfoStr + "<br/>";	
_playerInfoStr = _playerInfoStr + localize "STR_Cop_Handgun";
_playerInfoStr = _playerInfoStr + "<br/>";
if (handgunWeapon _player != "") then
	{
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	}forEach (([handgunWeapon _player]) + (handgunMagazine _player) + (handgunItems _player));
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};	

_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_Secondary";
_playerInfoStr = _playerInfoStr + "<br/>";
if (secondaryWeapon _player != "") then
	{
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	}forEach (([secondaryWeapon _player]) + (secondaryWeaponMagazine _player) + (secondaryWeaponItems _player));
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};
	
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_Uniform";
_playerInfoStr = _playerInfoStr + "<br/>";
if (uniform _player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	}forEach (([uniform _player]) + (uniformItems _player));
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};

_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_Vest";
_playerInfoStr = _playerInfoStr + "<br/>";
if (vest _player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	}forEach (([vest _player]) + (vestItems _player));
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};

_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_Backpack";
_playerInfoStr = _playerInfoStr + "<br/>";
if (backpack _player != "") then
	{
	
	{
	private _item = _x;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	}forEach (([backpack _player]) + (backpackItems _player));
	}
	else
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};	

_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Admin_PlayerInfoHat";
_playerInfoStr = _playerInfoStr + "<br/>";
if ((headgear _player) isEqualTo "") then
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	}
	else
	{
	private _item = headgear _player;
	private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
	if (count _itemConfig > 0) then
		{
		_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
		_playerInfoStr = _playerInfoStr + "<br/>";
		};
	};
	
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Cop_OtherGear";
_playerInfoStr = _playerInfoStr + "<br/>";
{
private _item = _x;
private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
if (count _itemConfig > 0) then
	{
	_playerInfoStr = _playerInfoStr + format ["- %1",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName)];
	_playerInfoStr = _playerInfoStr + "<br/>";
	};
}forEach (([goggles _player]) + (assignedItems _player));

if ((count (assignedItems _player) isEqualTo 0) or (goggles _player) isEqualTo "") then
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};
	
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Admin_PlayerInfoVehicles";
_playerInfoStr = _playerInfoStr + "<br/>";
{
private _item = typeOf _x;
private _itemConfig = "getText (_x >> ""className"") isEqualTo _item" configClasses (missionConfigFile >> "Item_Config"); //Get the itemConfig class from item className
if (count _itemConfig > 0) then
	{
	_playerInfoStr = _playerInfoStr + format ["- %1 (%2)  %3",([configName (_itemConfig select 0)] call ZKB_fnc_GetItemName),(_x getVariable ["plate",_x]),format [localize "STR_Admin_PlayerInfoVehOwner",if ((_x getVariable ["VehicleOwner",""]) isEqualTo (getPlayerUID _player)) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}]];
	_playerInfoStr = _playerInfoStr + "<br/>";
	};
}forEach (_player getVariable ["ZKB_Keys",[]]);

if (count (_player getVariable ["ZKB_Keys",[]]) isEqualTo 0) then
	{
	_playerInfoStr = _playerInfoStr + ("- " + localize "STR_Common_None");
	_playerInfoStr = _playerInfoStr + "<br/>";
	};
	
_playerInfoStr = _playerInfoStr + "<br/>";
_playerInfoStr = _playerInfoStr + localize "STR_Admin_PlayerInfoWanted";
_playerInfoStr = _playerInfoStr + "<br/>";
if (count (_player getVariable ["warrants",[]]) > 0) then
	{
	private _wantedText = "";
	private _crimes = "";
	private _crimeList = [];
	private _crimeArray = ((_player getVariable ["warrants",[]]) select 0);
	{
	_crime = _x;
	if !(_crime in _crimeList) then
		{
		_crimeList pushBack _crime;
		_crimes = _crimes + format ["(%1x) %2<br/>",{_x isEqualTo _crime}count _crimeArray,_crime];
		};
	}forEach _crimeArray;
	_wantedText = _wantedText + format [localize "STR_Cop_WantedListWanted",_player,name _player,[((_player getVariable ["warrants",[]]) select 1)] call ZKB_fnc_FormatNumber];
	_wantedText = _wantedText + "<br/>" + _crimes + "<br/>";
	_playerInfoStr = _playerInfoStr + _wantedText;
	};
	

_playerInfoBoxCtrl ctrlSetStructuredText parseText _playerInfoStr;

_playerInfoBoxCtrl ctrlSetPosition [(ctrlPosition _playerInfoBoxCtrl) select 0, (ctrlPosition _playerInfoBoxCtrl) select 1, (ctrlPosition _playerInfoBoxCtrl) select 2, ctrlTextHeight _playerInfoBoxCtrl];
_playerInfoBoxCtrl ctrlCommit 0;


private _playerLogs = missionNamespace getVariable [format ["ZKB_%1Logs",getPlayerUID _player],[]];
private _playerLogsStr = "";

{
private _str = (_x select 1);
private _formatArr = (_x select [2,50]);
_playerLogsStr = _playerLogsStr + format ["%1: ",[(_x select 0),"HH:MM:SS"] call BIS_fnc_secondsToString];
if (isLocalized _str) then
	{
	_playerLogsStr = _playerLogsStr + (switch (count _formatArr) do
		{
		case 0: {_str;};
		case 1: {format [localize _str, (_formatArr select 0)]};
		case 2: {format [localize _str, (_formatArr select 0), (_formatArr select 1)]};
		case 3: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2)]};
		case 4: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3)]};
		case 5: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4)]};
		case 6: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5)]};
		case 7: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6)]};
		case 8: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7)]};
		case 9: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8)]};
		case 10: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8), (_formatArr select 9)]};
		});
	}
	else
	{
	_playerLogsStr = _playerLogsStr + (switch (count _formatArr) do
		{
		case 0: {_str;};
		case 1: {format [_str, (_formatArr select 0)]};
		case 2: {format [_str, (_formatArr select 0), (_formatArr select 1)]};
		case 3: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2)]};
		case 4: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3)]};
		case 5: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4)]};
		case 6: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5)]};
		case 7: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6)]};
		case 8: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7)]};
		case 9: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8)]};
		case 10: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8), (_formatArr select 9)]};
		});
	};
_playerLogsStr = _playerLogsStr + "<br/>";
}forEach _playerLogs;

_playerInfoLogBoxCtrl ctrlSetStructuredText parseText _playerLogsStr;

_playerInfoLogBoxCtrl ctrlSetPosition [(ctrlPosition _playerInfoLogBoxCtrl) select 0, (ctrlPosition _playerInfoLogBoxCtrl) select 1, (ctrlPosition _playerInfoLogBoxCtrl) select 2, ctrlTextHeight _playerInfoLogBoxCtrl];
_playerInfoLogBoxCtrl ctrlCommit 0;