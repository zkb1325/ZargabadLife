/*
	File: fn_EscMenuInterupt.sqf
	Function: ZKB_fnc_EscMenuInterupt
	Author: ZKB1325
	Description: Runs when a player opens the esc menu
*/
	
[] spawn
	{
	disableSerialization;
	private["_abortButton","_aborttime"];
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton ctrlEnable false;
	_aborttime = time + 1;
	
	waitUntil {
			_abortButton ctrlSetText format["%1",[(_aborttime - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_aborttime - time) <= 0 || isNull (findDisplay 49)
			};
			
	_abortButton ctrlEnable true;	
	_abortButton ctrlSetText localize "STR_Common_Abort";
	_abortButton ctrlCommit 0;
	};
	
[] spawn
	{
	disableSerialization;
	private["_respawnbtn","_respawntime"];
	waitUntil{!isNull (findDisplay 49)};
	_respawnbtn = (findDisplay 49) displayCtrl 1010;
	_respawnbtn ctrlEnable false;
	_respawntime = time + 30;
	
	waitUntil {
			_respawnbtn ctrlSetText format["%1",[(_respawntime - time),"SS.MS"] call BIS_fnc_secondsToString];
			_respawnbtn ctrlCommit 0;
			round(_respawntime - time) <= 0 || isNull (findDisplay 49)
			};
			
	_respawnbtn ctrlEnable true;	
	_respawnbtn ctrlSetText localize "STR_Common_Respawn";
	_respawnbtn ctrlCommit 0;
	};