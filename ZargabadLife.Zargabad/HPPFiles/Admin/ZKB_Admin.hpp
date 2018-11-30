class ZKB_Admin
{
idd = 50000;														
name = "ZKB_Admin";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_Admin', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_Admin', displayNull]";

class controls
	{
	class Admin_BG: IGUIBack
		{
		idc = -1;
		x = 0.05 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.9 * safezoneH;
		};
	class Admin_Frame: RscFrame
		{
		idc = -1;
		text = "$STR_Admin_Menu";
		x = 0.05 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.82 * safezoneH;
		};
	class Admin_ActionList: RscListbox
		{
		idc = 50001;
		onLBSelChanged = "[((_this select 0) lbData (_this select 1)),lbData [50002,lbCurSel 50002],(_this select 0),(_this select 1)] call ZKB_fnc_ExecAdminCommand";
		x = 0.0625 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.395 * safezoneH;
		};	
	class Admin_TP_PlayerList: RscListbox
		{
		idc = 50002;
		onLBSelChanged = "[lbData [50001,lbCurSel 50001],((_this select 0) lbData (_this select 1)),((findDisplay 50000) displayCtrl 50001),lbCurSel 50001] call ZKB_fnc_ExecAdminCommand";
		x = 0.0625 * safezoneW + safezoneX;
		y = 0.505 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.445 * safezoneH;
		};
		
	#include "Admin_TP.hpp" //50010 - 50016
	#include "Admin_Comp.hpp" //50020 - 50038
	#include "Admin_AdminLogs.hpp" //50040 - 50043
	#include "Admin_PlayerLogs.hpp" //50050 - 50053
	#include "Admin_PlayerInfo.hpp" //50060 - 50067
	};
};

