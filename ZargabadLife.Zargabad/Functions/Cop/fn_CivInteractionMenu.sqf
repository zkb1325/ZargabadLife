/*
    File: fn_CivInteractionMenu.sqf
	Function: ZKB_fnc_CivInteractionMenu
    Author: ZKB1325

    Description:
	Opens the interaction menu of a civilian
*/
private _interactedUnit = param [0,objNull,[objNull,""]];
if (typeName _interactedUnit isEqualTo typeName "") then {_interactedUnit = [_interactedUnit] call ZKB_fnc_GetPlayerFromID;};
if (isNull _interactedUnit) exitWith {};

ZKB_CopInteractionTarget = _interactedUnit;

disableSerialization;
createDialog "ZKB_CopToCivMenu";
private _display = uiNamespace getVariable "ZKB_CopToCivMenu";
private _frameCtrl = _display displayCtrl 14002;
private _arrestTimeCtrl = _display displayCtrl 14030;
private _arrestSliderCtrl = _display displayCtrl 14040;
_frameCtrl ctrlSetText (name ZKB_CopInteractionTarget);

_arrestSliderCtrl sliderSetSpeed [1, 5];
_arrestSliderCtrl sliderSetRange [0, 30];
_arrestSliderCtrl sliderSetPosition 0;

_arrestTimeCtrl ctrlSetText format [localize "STR_Cop_ArrestTime",0];

while {!isNull _display} do
	{
	if ((isNull ZKB_CopInteractionTarget) or (ZKB_CopInteractionTarget distance player > 3)) exitWith
		{
		closeDialog 0;
		};
	sleep .01;
	};
