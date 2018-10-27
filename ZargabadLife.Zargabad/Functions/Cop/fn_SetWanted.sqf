/*
	File: fn_SetWanted.sqf
	Function: ZKB_fnc_SetWanted
	Author: ZKB1325
	Description: Sets a player wanted from the wanted menu
*/
private _player = param [0,"",[objNull,""]];
if (typeName _player isEqualTo typeName "") then {_player = [_player] call ZKB_fnc_GetPlayerFromID};
if (isNull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _crimeDescription = param [1,"",[""]];
if ((_crimeDescription isEqualTo "") or (_crimeDescription isEqualTo (localize "STR_Cop_WantedMenuSetDescription"))) exitWith {["STR_Cop_WantedMenuSetWantedNoDescription"] call ZKB_fnc_DynamicText;};

[_player,_crimeDescription] call ZKB_fnc_AddWanted;
["STR_Cop_WantedMenuSetWantedGlobal",[name _player,_crimeDescription,name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];