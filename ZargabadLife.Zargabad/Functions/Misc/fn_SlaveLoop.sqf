#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_SlaveLoop.sqf
	Function: ZKB_fnc_SlaveLoop
	
	Description: Loops on the slave owner and checks if the slave has picked up a weapon and to add to the money earned
*/
private _slave = param [0,objNull,[objNull]];
if (isNull _slave) exitWith {};

while {alive _slave} do
	{
	
	for "_t" from 1 to 60 do
		{
		if !(alive _slave) exitWith
			{
			["STR_Slave_Died"] call ZKB_fnc_DynamicText;
			};
		
		if (_slave inArea "CopBaseAreaMarker") then
			{
			["STR_Slave_InCopBase"] call ZKB_fnc_DynamicText;
			_slave setVariable ["free",true];
			};
			
		if (_slave getVariable ["free",false]) exitWith
			{
			["STR_Slave_Freed"] call ZKB_fnc_DynamicText;
			deleteVehicle _slave;
			[player,"Being a slaver",20000] call ZKB_fnc_AddWanted;
			};
			
		if ([player] call ZKB_fnc_IsGangMember) exitWith 
			{
			["STR_Slave_JoinedGang"] call ZKB_fnc_DynamicText;
			deleteVehicle _slave;
			};
			
		if (currentWeapon _slave != "") then
			{
			["STR_Slave_NoWeapons"] call ZKB_fnc_DynamicText;
			removeAllWeapons _slave;
			};
			
		sleep 1;
		};
		
	if !(alive _slave) exitWith {};
	if (_slave getVariable ["free",false]) exitWith {};
	if ([player] call ZKB_fnc_IsGangMember) exitWith {};
	
	if (({_slave inArea (_x select 0)} count SETTING(getArray,"ZKB_WorkPlaces") > 0) and ((vehicle _slave) isEqualTo _slave)) then
		{
		private _curMoney = _slave getVariable ["money",0];
		_curMoney = _curMoney + SETTING(getNumber,"ZKB_SlaveBonus");
		_slave setVariable ["money",_curMoney,true];
		};
	};