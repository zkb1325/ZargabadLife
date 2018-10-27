#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_OpenInfoMenu.sqf
	Function: ZKB_fnc_OpenInfoMenu
*/
private _info = "";

disableSerialization;
createDialog "ZKB_GenTextBox";
private _display = uiNamespace getVariable "ZKB_GenTextBox";
private _textBoxCtrl = _display displayCtrl 1510;
private _frameCtrl = _display displayCtrl 1502;
_frameCtrl ctrlSetText localize "STR_MainMenu_InfoMenu";


while {!isNull _display} do
{
_info = "";
_info = _info + "<t size='1.2'>";
_info = _info + format [localize "STR_MainMenu_InfoDate",(date select 2),(date select 1),(date select 0)];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoUptime",[serverTime,"HH:MM:SS"] call BIS_fnc_secondsToString];
_info = _info + "<br/>";
_info = _info + "<br/>";
_info = _info + localize "STR_MainMenu_InfoPlayerInfo";
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoMoney",[["Money"] call ZKB_fnc_GetInvItemAmount] call ZKB_fnc_FormatNumber];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoBank",[ZKB_BankAccount] call ZKB_fnc_FormatNumber];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoHunger",ZKB_Hunger];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoWeight",[player] call ZKB_fnc_GetInvTotalWeight,player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")]];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoCopKills",(ZKB_CopsKilled select 0),(ZKB_CopsKilled select 1)];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoCivKills",(ZKB_CivsKilled select 0),(ZKB_CivsKilled select 1)];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoSuicides",ZKB_Suicides];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoDeaths",ZKB_Deaths];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoRespawnTime",if (IsCop) then {((SETTING(getNumber,"ZKB_CopRespawnTimeBase") + ((ZKB_CivsKilled select 0) * SETTING(getNumber,"ZKB_KillCivPenaltyt")) + (ZKB_Suicides * SETTING(getNumber,"ZKB_SuicidePenalty"))) min SETTING(getNumber,"ZKB_MaxRespawnTime"))}else{((SETTING(getNumber,"ZKB_CivRespawnTimeBase") + ((ZKB_CivsKilled select 0) * SETTING(getNumber,"ZKB_KillCivPenaltyt")) + ((ZKB_CopsKilled select 0) * SETTING(getNumber,"ZKB_KillCopPenalty")) + (ZKB_Suicides * SETTING(getNumber,"ZKB_SuicidePenalty"))) min SETTING(getNumber,"ZKB_MaxRespawnTime"))}];
_info = _info + "<br/>";
//_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoDemeritPoints",ZKB_DemeritPoints];
//_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoShovelDurability",ZKB_ShovelDur];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoPickaxeDurability",ZKB_PickaxeDur];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoPlayerInfoJackHammerDurability",ZKB_JackhammerDur];
_info = _info + "<br/>";
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoPlayerInfoLicense";
_info = _info + "<br/>";
{
_info = _info + (_x call ZKB_fnc_GetLicenseDisplayName) + "<br/>";
}forEach (player getVariable ["ZKB_Licenses",[]]);
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoFactoryInfo";
_info = _info + "<br/>";
{
private _facVar = _x;
private _facName = ((ZKB_FactoryDefines select (ZKB_FactoryDefines findIf {_facVar isEqualTo (_x select 6)})) select 1);
_info = _info + _facName + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoFactoryInfoWorkers",missionNamespace getVariable [_facVar+"Workers",0]];
_info = _info + "<br/>";
private _facQueue = (missionNamespace getVariable [_facVar+"Queue",[]]);
_info = _info + format [localize "STR_MainMenu_InfoFactoryInfoCurProduction",if (count _facQueue > 0) then {([(_facQueue select 0) select 0] call ZKB_fnc_GetItemName)}else{localize "STR_Common_Nothing"}];
_info = _info + "<br/>";
_info = _info + localize "STR_MainMenu_InfoFactoryInfoCurQueue";
_info = _info + "<br/>";
if (count _facQueue > 0) then
	{
	{
	_info = _info + format [" - %1",([_x select 0] call ZKB_fnc_GetItemName)];
	_info = _info + "<br/>";
	}forEach _facQueue;
	}
	else
	{
	_info = _info + localize "STR_Common_Nothing";
	_info = _info + "<br/>";
	};
private _facCompleted = (missionNamespace getVariable [_facVar+"StorageCompleted",[]]);
_info = _info + localize "STR_MainMenu_InfoFactoryInfoCurComplete";
_info = _info + "<br/>";
if (count _facCompleted > 0) then
	{
	{
	_info = _info + format [" - (%2x) %1",([_x select 0] call ZKB_fnc_GetItemName),[(_x select 1)] call ZKB_fnc_FormatNumber];
	_info = _info + "<br/>";
	}forEach _facCompleted;
	}
	else
	{
	_info = _info + localize "STR_Common_Nothing";
	_info = _info + "<br/>";
	};

//["Storage","Queue","StorageCompleted","Workers"];
_info = _info + "<br/>";
}forEach ZKB_OwnedFactories;
_info = _info + "<br/>";


_info =_info + localize "STR_MainMenu_InfoGovernment";
_info = _info + "<br/>";
private _curMayor = (missionNamespace getVariable ["currentMayor",""]);
private _curMayorObj = ([_curMayor] call ZKB_fnc_GetPlayerFromID);
_info = _info + format [localize "STR_MainMenu_InfoGovernmentMayor",if (_curMayor isEqualTo "") then {localize "STR_Common_None"}else{if (isNull _curMayorObj) then {localize "STR_MainMenu_InfoGovernmentNotOnline"}else{"(" + (str _curMayorObj) + ") " + (name _curMayorObj)}}];
_info = _info + "<br/>";
private _curChief = (missionNamespace getVariable ["currentChief",""]);
private _curChiefObj = ([_curChief] call ZKB_fnc_GetPlayerFromID);
_info = _info + format [localize "STR_MainMenu_InfoGovernmentChief",if (_curChief isEqualTo "") then {localize "STR_Common_None"}else{if (isNull _curChiefObj) then {localize "STR_MainMenu_InfoGovernmentNotOnline"}else{"(" + (str _curChiefObj) + ") " + (name _curChiefObj)}}];
_info = _info + "<br/>";
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoGovernmentTaxes";
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoGovernmentItemTax",(ZKB_TaxArray select 0),"%"];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoGovernmentVehicleTax",(ZKB_TaxArray select 1),"%"];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoGovernmentMagazineTax",(ZKB_TaxArray select 2),"%"];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoGovernmentWeaponTax",(ZKB_TaxArray select 3),"%"];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoGovernmentTransferTax",(ZKB_TaxArray select 4),"%"];
_info = _info + "<br/>";
_info = _info + "<br/>";
_info = _info + localize "STR_MainMenu_InfoGovernmentLaws";
_info = _info + "<br/>";
{
_info = _info + format ["%1: %2<br/>",_forEachIndex+1,_x];
}forEach ZKB_LawArray;

_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoBank";
_info = _info + "<br/>";
private _safeValue = 0;
{
for "_i" from 1 to (floor ((serverTime - (_x getVariable ["lastRobbed",0])) / 40)) do //Get total seconds passed since last robbery and add money for every 40 seconds passed
	{
	_safeValue = _safeValue + round (1000 + (random 1000));
	};
}forEach [BankSafe_1,BankSafe_2,BankSafe_3];
_info = _info + format [localize "STR_MainMenu_InfoBanksSafes",[_safeValue min (SETTING(getNumber,"ZKB_MaxVaultMoney")*3)] call ZKB_fnc_FormatNumber];
_info = _info + "<br/>";
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoWorkPlaces";
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoWorkPlaceInAreaPayCheckBonus",[round (ZKB_TimeInWorkPlace * SETTING(getNumber,"ZKB_InWorkPlaceBonus"))] call ZKB_fnc_FormatNumber];
_info = _info + "<br/>";
{
if ((_x select 0) in (missionNamespace getVariable ["ownedWorkplaces",[]])) then
	{
	_info = _info + format [localize "STR_MainMenu_InfoWorkPlacesOwned",_forEachIndex+1,[(_x select 2)] call ZKB_fnc_FormatNumber];
	_info = _info + "<br/>";
	};
}forEach SETTING(getArray,"ZKB_WorkPlaces");
_info = _info + "<br/>";

_info = _info + localize "STR_MainMenu_InfoGangs";
_info = _info + "<br/>";
{
private _gangArray = missionNamespace getVariable [format ["GangArray_%1",_x],[]];
private _gangMembers = (_gangArray select 1);
_info = _info + (_gangArray select 0);

_info = _info + "<br/>";
private _areasControlled = 0;
{
if ((GMVAR(_x,objNull) getVariable ["GangControl",""]) isEqualTo (_gangArray select 0)) then
	{
	_info = _info + (GMVAR(_x,objNull) getVariable ["GangAreaName","Gang Area"]) + "<br/>";
	_areasControlled = _areasControlled + 1;
	};
}forEach SETTING(getArray,"ZKB_GangAreas");
if (_areasControlled isEqualTo 0) then {_info = _info + localize "STR_MainMenu_InfoGangNocontrol" + "<br/>";};
{
if (_forEachIndex isEqualTo 0) then
	{
	_info = _info + format ["%1 %2<br/>",(_x select 1),localize "STR_MainMenu_InfoGangsLeader"];
	}
	else
	{
	_info = _info + (_x select 1) + "<br/>";
	};
}forEach _gangMembers;
_info = _info + "<br/>";
}forEach (missionNamespace getVariable ["ZKB_GangIndexArray",[]]);
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoDemand";
_info = _info + "<br/>";
private _itemStockArray = ["OilBarrel", OilShop] call ZKB_fnc_ShopGetItemStock;
private _itemStock = _itemStockArray select 0;
private _itemMaxStock = _itemStockArray select 1;
private _cost =  (["OilBarrel"] call ZKB_fnc_GetItemSellPrice) max 1;
private _costTax =  (["OilBarrel"] call ZKB_fnc_GetItemSellPriceWithTax) max 1;
private _demand = _costtax*0.5*(_itemstock-(_itemmaxstock*0.5))/(0.5*_itemmaxstock);
private _fuelCost = round((((_cost*(_costtax/_cost)) - _demand)/2)/15);
_info = _info + format [localize "STR_MainMenu_InfoDemandFuelDemand",switch (true) do {case (_demand < 0):{localize "STR_MainMenu_InfoDemandHigh";};case (_demand > 0):{localize "STR_MainMenu_InfoDemandLow";};case (_demand isEqualTo 0):{localize "STR_MainMenu_InfoDemandNormal";};}];
_info = _info + "<br/>";
_info = _info + format [localize "STR_MainMenu_InfoDemandFuelCost",[_fuelCost] call ZKB_fnc_FormatNumber];
_info = _info + "<br/>";
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoPlayers";
_info = _info + "<br/>";
private _civs = [];
private _cops = [];
{if (side _x isEqualTo civilian) then {_civs pushBack _x;};}forEach playableUnits;
_civs = [_civs, [], {str _x}, "ASCEND"] call BIS_fnc_sortBy;
{if (side _x isEqualTo west) then {_cops pushBack _x;};}forEach playableUnits;
_cops = [_cops, [], {str _x}, "ASCEND"] call BIS_fnc_sortBy;
{
_info = _info + format ["(%1) %2",_x, name _x];
_info = _info + "<br/>";
}forEach (_civs + _cops);
_info = _info + "<br/>";
_info = _info + "<br/>";


_info = _info + localize "STR_MainMenu_InfoWanted";
_info = _info + "<br/>";
private _wantedText = "";
private _crimes = "";
private _crimeList = [];
private _crimeArray = [];
{
_crimes = "";
_crimeList = [];
if (([_x] call ZKB_fnc_IsWanted) and !(_x getVariable ["InJail",false])) then
	{
	_crimeArray = ((_x getVariable ["warrants",[]]) select 0);
	{
    _crime = _x;
    if !(_crime in _crimeList) then
		{
			_crimeList pushBack _crime;
			_crimes = _crimes + format ["(%1x) %2<br/>",{_x isEqualTo _crime}count _crimeArray,_crime];
		};
	}forEach _crimeArray;
	_wantedText = _wantedText + format [localize "STR_Cop_WantedListWanted",_x,name _x,((_x getVariable ["warrants",[]]) select 1)];
	_wantedText = _wantedText + "<br/>" + _crimes + "<br/>";
	};
}forEach _civs;
_info = _info + _wantedText;
_info = _info + "<br/>";

_textBoxCtrl ctrlSetStructuredText parseText _info;

_textBoxCtrl ctrlSetPosition [(ctrlPosition _textBoxCtrl) select 0, (ctrlPosition _textBoxCtrl) select 1, (ctrlPosition _textBoxCtrl) select 2, ctrlTextHeight _textBoxCtrl];
_textBoxCtrl ctrlCommit 0;

sleep .1;
};