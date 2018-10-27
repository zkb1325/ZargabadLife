/*
	File: fn_OpenCivCamMenu.sqf
	Function: ZKB_fnc_OpenCivCamMenu
	Author: ZKB1325
	Description: Opens the civcam menu
*/

disableSerialization;
createDialog "ZKB_CivCamMenu";

private _display = uiNameSpace getVariable "ZKB_CivCamMenu";
private _civListCtrl = _display displayCtrl 24020;
private _lengthSliderCtrl = _display displayCtrl 24030;
private _durationCtrl = _display displayCtrl 24040;
private _costCtrl = _display displayCtrl 24050;

_lengthSliderCtrl sliderSetRange [5,90];
_lengthSliderCtrl sliderSetSpeed [1,5];
_lengthSliderCtrl sliderSetPosition 5;

{
if (side _x isEqualTo civilian) then
	{
	private _index = _civListCtrl lbAdd (name _x);
	_civListCtrl lbSetData [_index,getPlayerUID _x];
	};
}forEach playableUnits;
lbSort [_civListCtrl, "ASC"];

while {!isNull _display} do
	{
	_durationCtrl ctrlSetStructuredText parseText format [localize "STR_Cop_CivcamMenuDuration",[round (sliderPosition _lengthSliderCtrl),"MM:SS"] call BIS_fnc_secondsToString];
	_costCtrl ctrlSetStructuredText parseText format [localize "STR_Cop_CivcamMenuCost",[(round (sliderPosition _lengthSliderCtrl)) * 750] call ZKB_fnc_FormatNumber];
	sleep .1;
	};