/*
	Author: ZKB1325
	FileName: fn_KeyBindKnockOut.sqf
	Function: ZKB_fnc_KeyBindKnockOut
	
	Description: Key bind function for knocking someone out
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (!isNull cursorObject and cursorObject isKindOf "Man" and isPlayer cursorObject and alive cursorObject and cursorObject distance player < 4 and speed cursorObject < 3 and (vehicle player isEqualTo player) and !((playerSide isEqualTo west) and (side cursorObject isEqualTo west))) exitWith 
	{
	if (!([cursorObject] call ZKB_fnc_IsKnockedOut) and (currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) and currentWeapon player != "" and !([player] call ZKB_fnc_IsKnockedOut) and !(missionNamespace getVariable ["knockingOut",false]) and !([player] call ZKB_fnc_IsSurrending)) then 
		{
		[cursorObject] spawn ZKB_fnc_knockoutAction;
		};
	true;
	};
true;