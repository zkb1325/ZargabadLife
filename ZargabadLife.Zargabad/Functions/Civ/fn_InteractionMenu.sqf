/*
    File: fn_InteractionMenu.sqf
	Function: ZKB_fnc_InteractionMenu
    Author: ZKB1325

    Description:
	Opens the civ interaction menu for robbing and what ever else gets added
*/
private _interactedUnit = param [0,objNull,[objNull,""]];
if (typeName _interactedUnit isEqualTo typeName "") then {_interactedUnit = [_interactedUnit] call ZKB_fnc_GetPlayerFromID;};
if (isNull _interactedUnit) exitWith {};

ZKB_InteractionTarget = _interactedUnit;

disableSerialization;
createDialog "ZKB_DynamicButtonMenu";

private _display = uiNameSpace getVariable "ZKB_DynamicButtonMenu";
private _btnCtrl = _display displayCtrl 15510;
private _frameCtrl = _display displayCtrl 15502;
_frameCtrl ctrlSetText (name ZKB_InteractionTarget);

_btnCtrl ctrlSetText localize "STR_Common_Close";
_btnCtrl buttonSetAction "closeDialog 0;";


//Second Button
private _btnpos = ctrlPosition _btnCtrl;

private _btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Civ_InteractionMenuRob";
_btnCtrl buttonSetAction "[ZKB_InteractionTarget] call ZKB_fnc_RobPlayer;";

if (currentWeapon player isEqualTo "") then
	{
	_btnCtrl ctrlEnable false;
	_btnCtrl ctrlSetTooltip localize "STR_Civ_InteractionMenuRobNoWeapon";
	};
	

//Third Button
private _btnpos = ctrlPosition _btnCtrl;

private _btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Civ_InteractionMenuOpenGear";
_btnCtrl buttonSetAction "if (isNull ZKB_InteractionTarget) exitWith {closeDialog 0; [""STR_Bank_TransferPlayerNotInGame""] call ZKB_fnc_DynamicText;}; if (!([ZKB_InteractionTarget] call ZKB_fnc_IsSurrending) and !([ZKB_InteractionTarget] call ZKB_fnc_IsKnockedOut) and !([ZKB_InteractionTarget] call ZKB_fnc_IsRestrained)) exitWith {[""STR_Cop_NotSurrendering"",[name ZKB_InteractionTarget]] call ZKB_fnc_DynamicText;}; player action [""Gear"",ZKB_InteractionTarget];";

if (currentWeapon player isEqualTo "") then
	{
	_btnCtrl ctrlEnable false;
	_btnCtrl ctrlSetTooltip localize "STR_Civ_InteractionMenuRobNoWeapon";
	};
	
	
	

while {!isNull _display} do
	{
	if ((isNull ZKB_InteractionTarget) or (ZKB_InteractionTarget distance player > 3)) exitWith
		{
		closeDialog 0;
		};
	sleep .01;
	};

