/*
	Author: ZKB1325
	FileName: fn_AdminTPMap.sqf
	Function: ZKB_fnc_AdminTPMap
	Description: TP selected player back to last pos

*/
[] spawn
	{
	closeDialog 0; 
	openMap [true,true];
	waitUntil {visibleMap};
	switch (playerSide) do 
		{
		case west: {if (!visibleMap) then {[] spawn ZKB_fnc_CopMarkers;}};
		case civilian: {if (!visibleMap) then {[] spawn ZKB_fnc_CivMarkers;}};
		}; 
	onMapSingleClick {(vehicle player) setPos _pos; openMap [false,false]; ["STR_Admin_AdminLogTpMap",name player,mapGridPosition _pos] call ZKB_fnc_AdminAddAdminLog; onMapSingleClick {};};
	};