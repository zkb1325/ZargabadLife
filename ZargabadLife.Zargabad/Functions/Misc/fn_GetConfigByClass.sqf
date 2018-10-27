/*
	File: fn_GetConfigByClass.sqf
	Function: ZKB_fnc_GetConfigByClass
	Author: ZKB1325
	Description: returns the config class based off given class name.


*/
private["_class","_return"];
_class = if (typeName _this == "Array") then {(_this select 0)}else{_this};

_return = "";
_return = switch (true) do
{
	case isClass(configFile >> "CfgWeapons" >> _class): {"CfgWeapons"};
	case isClass(configFile >> "CfgMagazines" >> _class): {"CfgMagazines"};
	case isClass(configFile >> "CfgVehicles" >> _class): {"CfgVehicles"};
	case isClass(configFile >> "CfgAmmo" >> _class): {"CfgAmmo"};
	case isClass(configFile >> "CfgGlasses" >> _class): {"CfgGlasses"};
	default {"VirtualItem"};
};
_return;