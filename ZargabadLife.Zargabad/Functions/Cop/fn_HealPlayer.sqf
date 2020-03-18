/*
    File: fn_HealPlayer.sqf
	Function: ZKB_fnc_HealPlayer
    Author: ZKB1325

    Description:
	Heals the player
*/
private _healedUnit = param [0,objNull,[objNull]];
if (isNull _healedUnit) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};

_healedUnit setDamage 0;
["STR_Cop_HealedBy",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_healedUnit,false];
["STR_Cop_Healed",[name _healedUnit]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsCopHealed",name player,name _healedUnit] call ZKB_fnc_AdminAddPlayerLog;