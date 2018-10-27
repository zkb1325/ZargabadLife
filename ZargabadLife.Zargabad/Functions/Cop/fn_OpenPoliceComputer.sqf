/*
	File: fn_OpenPoliceComputer.sqf
	Function: ZKB_fnc_OpenPoliceComputer
	Author: ZKB1325
	Description: Opens the full police computer menu
*/

disableSerialization;
createDialog "ZKB_DynamicButtonMenu";

private _display = uiNameSpace getVariable "ZKB_DynamicButtonMenu";
private _btnCtrl = _display displayCtrl 15510;
private _frameCtrl = _display displayCtrl 15502;
_frameCtrl ctrlSetText localize "STR_Cop_PoliceComputer";

_btnCtrl ctrlSetText localize "STR_Cop_PoliceComputerWantedMenu";
_btnCtrl buttonSetAction "call ZKB_fnc_OpenWantedMenu;";


private _btnpos = ctrlPosition _btnCtrl;

//Second Button
private _btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Cop_CivcamMenu";
_btnCtrl buttonSetAction "[] spawn ZKB_fnc_OpenCivCamMenu;";

//Third Button
_btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Cop_JailCam";
_btnCtrl buttonSetAction "[] spawn ZKB_fnc_JailCam;";

//Fourth Button
_btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Cop_SatCam";
_btnCtrl buttonSetAction "[] spawn ZKB_fnc_SatCam;";

//Fifth Button
_btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Cop_WantedList";
_btnCtrl buttonSetAction "[] call ZKB_fnc_ShowWantedList;";

//Sixth Button
_btnY = _btnpos select 1;
_btnCtrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
_btnpos set [1,_btnY + .08];
_btnCtrl ctrlSetPosition _btnpos;
_btnCtrl ctrlCommit 0;

_btnCtrl ctrlSetText localize "STR_Common_Close";
_btnCtrl buttonSetAction "closeDialog 0;";



