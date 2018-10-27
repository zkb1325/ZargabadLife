/*
	File: fn_OpenPoliceComputerLite.sqf
	Function: ZKB_fnc_OpenPoliceComputerLite
	Author: ZKB1325
	Description: Opens the lite police computer menu
*/

disableSerialization;
createDialog "ZKB_DynamicButtonMenu";

private _display = uiNameSpace getVariable "ZKB_DynamicButtonMenu";
private _btnCtrl = _display displayCtrl 15510;
private _frameCtrl = _display displayCtrl 15502;
_frameCtrl ctrlSetText localize "STR_Cop_PoliceComputerLite";

_btnCtrl ctrlSetText localize "STR_Cop_PoliceComputerWantedMenu";
_btnCtrl buttonSetAction "call ZKB_fnc_OpenWantedMenu;";


private _btnpos = ctrlPosition _btnCtrl;


//Second Button
private _btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Cop_JailCam";
_btnCtrl buttonSetAction "[] spawn ZKB_fnc_JailCam;";

//Third Button
_btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Cop_WantedList";
_btnCtrl buttonSetAction "[] call ZKB_fnc_ShowWantedList;";

//fourth Button
_btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Common_Close";
_btnCtrl buttonSetAction "closeDialog 0;";