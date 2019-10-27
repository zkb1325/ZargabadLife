#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_FishingPole.sqf
	Function: ZKB_fnc_FishingPole
	Description: Runs when player uses fishing pole
*/
private ["_fishingarea","_arearadius","_caughtfish","_caughtamount"];
_fishingarea = _this select 0;
_arearadius = _this select 1;

if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

_caughtfish = "";
_caughtamount = 0;

switch (true) do
	{
	case (player distance getMarkerpos "FishingAreaBass" <= 30): {_caughtfish = "Bass"; _caughtamount = ceil random 3;};	
	case(player distance getMarkerpos "FishingAreaTrout" <= 30): {_caughtfish = "Trout"; _caughtamount = ceil random 6;};	
	case (player distance getMarkerpos "FishingAreaPerch" <= 30): {_caughtfish = "Perch"; _caughtamount = ceil random 4;};	
	case (player distance getMarkerpos "FishingAreaWalleye" <= 30): {_caughtfish = "Walleye"; _caughtamount = ceil random 5;};
	};
	
if (_caughtfish == "") exitWith {["STR_ItemMisc_NotNearFish"] call ZKB_fnc_DynamicText;};
if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_caughtfish] call ZKB_fnc_GetItemWeight)*_caughtamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};

if (ZKB_PerformingAction) exitWith {["STR_Common_AlreadyPerformingAction"] call ZKB_fnc_DynamicText;};
ZKB_PerformingAction = true;

if(animationState player != "AwopPercMstpSgthWnonDnon_end") then 
	{
	[player,"AwopPercMstpSgthWnonDnon_end",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "AwopPercMstpSgthWnonDnon_end";
	player playMoveNow "AwopPercMstpSgthWnonDnon_end";
	};
	
sleep 1.5;

if(animationState player != "normal") then 
	{
	[player,"normal",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "normal";
	player playMoveNow "normal";
	};

[_caughtfish, _caughtamount] call ZKB_fnc_InvAddItem;	
["STR_ItemMisc_CaughtFish", [[_caughtamount] call ZKB_fnc_FormatNumber,[_caughtfish] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsCaughtFish",name player,[_caughtamount] call ZKB_fnc_FormatNumber,[_caughtfish] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;

ZKB_PerformingAction = false;
	