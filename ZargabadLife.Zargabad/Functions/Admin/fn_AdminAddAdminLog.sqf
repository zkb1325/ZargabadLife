/*
	Author: ZKB1325
	FileName: fn_AdminAddAdminLog.sqf
	Function: ZKB_fnc_AdminAddAdminLog
	Description: Adds to the Admin logs

	_this: Array
		Log array
		0: String
			Localized string or string
		1+: Anything
			Anything to format into the text string be careful with objects becoming objNull
			
	[[time,"Str",%1,%2,%3,ect]]
*/
private _logArray = _this;

private _curAdminLogs = missionNamespace getVariable ["ZKB_AdminLogs",[]];
_curAdminLogs pushBack ([serverTime] + _logArray);
missionNamespace setVariable ["ZKB_AdminLogs",_curAdminLogs,true];