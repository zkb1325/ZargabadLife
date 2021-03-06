/*
	Author: ZKB1325
	FileName: fn_AdminViewAdminLogs.sqf
	Function: ZKB_fnc_AdminViewAdminLogs
	Description: Views the admin logs

*/
private _display = uiNamespace getVariable "ZKB_Admin";
private _logCtrl = _display displayCtrl 50043;
private _adminLogs = missionNamespace getVariable ["ZKB_AdminLogs",[]];
private _adminLogsStr = "";

{
private _str = (_x select 1);
private _formatArr = (_x select [2,50]);
_adminLogsStr = _adminLogsStr + format ["%1: ",[(_x select 0),"HH:MM:SS"] call BIS_fnc_secondsToString];
if (isLocalized _str) then
	{
	_adminLogsStr = _adminLogsStr + (switch (count _formatArr) do
		{
		case 0: {localize _str;};
		case 1: {format [localize _str, (_formatArr select 0)]};
		case 2: {format [localize _str, (_formatArr select 0), (_formatArr select 1)]};
		case 3: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2)]};
		case 4: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3)]};
		case 5: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4)]};
		case 6: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5)]};
		case 7: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6)]};
		case 8: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7)]};
		case 9: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8)]};
		case 10: {format [localize _str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8), (_formatArr select 9)]};
		});
	}
	else
	{
	_adminLogsStr = _adminLogsStr + (switch (count _formatArr) do
		{
		case 0: {localize _str;};
		case 1: {format [_str, (_formatArr select 0)]};
		case 2: {format [_str, (_formatArr select 0), (_formatArr select 1)]};
		case 3: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2)]};
		case 4: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3)]};
		case 5: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4)]};
		case 6: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5)]};
		case 7: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6)]};
		case 8: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7)]};
		case 9: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8)]};
		case 10: {format [_str, (_formatArr select 0), (_formatArr select 1), (_formatArr select 2), (_formatArr select 3), (_formatArr select 4), (_formatArr select 5), (_formatArr select 6), (_formatArr select 7), (_formatArr select 8), (_formatArr select 9)]};
		});
	};
_adminLogsStr = _adminLogsStr + "<br/>";
}forEach _adminLogs;

_logCtrl ctrlSetStructuredText parseText _adminLogsStr;

_logCtrl ctrlSetPosition [(ctrlPosition _logCtrl) select 0, (ctrlPosition _logCtrl) select 1, (ctrlPosition _logCtrl) select 2, ctrlTextHeight _logCtrl];
_logCtrl ctrlCommit 0;