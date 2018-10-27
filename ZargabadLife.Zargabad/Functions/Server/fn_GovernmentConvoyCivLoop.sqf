/*
	Author: ZKB1325
	FileName: fn_GovernmentConvoyCivLoop.sqf
	Function: ZKB_fnc_GovernmentConvoyCivLoop
	Description: Civ loop to stay away from the government convoy
*/
private _convoyTruck = param [0,objNull,[objNull]];
if (isNull _convoyTruck) exitWith {};

while {alive _convoyTruck} do
	{
	if (player distance _convoyTruck < 100) then
		{
		titleText [localize "STR_GovConvoy_CivToClose", "plain down"];
		};
	sleep 1;
	};