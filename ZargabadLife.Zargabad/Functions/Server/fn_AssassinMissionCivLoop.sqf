/*
	Author: ZKB1325
	FileName: fn_AssassinMissionCivLoop.sqf
	Function: ZKB_fnc_AssassinMissionCivLoop
	Description: Civ loop to stay away from the assassin mission vip
*/
private _vipTarget = param [0,objNull,[objNull]];
if (isNull _vipTarget) exitWith {};

while {alive _vipTarget} do
	{
	if (player distance _vipTarget < 100) then
		{
		titleText [localize "STR_Assassin_CivToClose", "plain down"];
		};
	/*	//Sadly this causes issues with groups and sometimes causes the VIP to go on a manhunt for you
	if ((player distance _vipTarget < 150) and ((primaryWeapon player != "") or (handgunWeapon player != "") or ( secondaryWeapon player != "") or (currentWeapon (vehicle player) != ""))) then
		{
		[-5000] call ZKB_fnc_SetRating;
		};
		
	if (player distance _vipTarget > 300) then
		{
		[1000] call ZKB_fnc_SetRating;
		};
	*/
	sleep 1;
	};
//[100000] call ZKB_fnc_SetRating;