#include "..\..\ConfigMacros.hpp"
/*
    File: fn_RobStation.sqf
	Function: ZKB_fnc_RobStation
    Author: ZKB1325

    Description:
    Function for gas station robbing
	
	this addAction[localize "STR_Common_Rob" + " " + localize "STR_Shop_Station1Shop",ZKB_fnc_RobStation,"",0,false,false,"",'!(currentWeapon player == "") and (playerSide isEqualTo civilian) and ((round ((servertime - (_target getVariable ["LastRobbed",0])) * 10)) > 5000)'];

*/

private _shop = param [0, objNull, [objNull]];
private _shopName = (if (isLocalized ((_shop getVariable "ShopData") select 1)) then {localize ((_shop getVariable "ShopData") select 1)}else{((_shop getVariable "ShopData") select 1)});

private _robAmount = (round ((servertime - (_shop getVariable ["LastRobbed",0])) * 10)) min SETTING(getNumber,"ZKB_MaxStationMoney");
["Money", _robAmount] call ZKB_fnc_InvAddItem;
["STR_Robbing_Stole", [[_robAmount] call ZKB_fnc_FormatNumber, _shopName]] call ZKB_fnc_DynamicText;
["STR_Robbing_RobbedGlobal", [_shopName]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
_shop setVariable ["LastRobbed",servertime,true];
[player,"Robbed gas station",_robAmount] call ZKB_fnc_AddWanted;
call ZKB_fnc_SavePlayer;
