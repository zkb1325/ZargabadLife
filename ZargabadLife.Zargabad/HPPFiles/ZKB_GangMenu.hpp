class ZKB_GangMenu
{
idd = 17000;														
name = "ZKB_GangMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_GangMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_GangMenu', displayNull]";

class controls
	{

	class GangMenu_BG: IGUIBack
	{
		idc = 17001;
		x = 0.175 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.675 * safezoneW;
		h = 0.24 * safezoneH;
	};	
	class GangMenu_Frame: RscFrame
	{
		idc = 17002;
		text = $STR_Gang_GangMenu;
		x = 0.175 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.675 * safezoneW;
		h = 0.24 * safezoneH;
	};
	class GangMenu_JoinBtn: RscButton
	{
		idc = 17010;
		text = $STR_Gang_Join;
		x = 0.2 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.1375 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [17050, (lbCurSel 17050)]] call ZKB_fnc_JoinGang;";
	};
	class GangMenu_LeaveBtn: RscButton
	{
		idc = 17020;
		text = $STR_Gang_Leave;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.1375 * safezoneW;
		h = 0.04 * safezoneH;
		action = "call ZKB_fnc_LeaveGang;";
	};
	class GangMenu_ManageBtn: RscButton
	{
		idc = 17030;
		text = $STR_Gang_Manage;
		x = 0.3625 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.1375 * safezoneW;
		h = 0.04 * safezoneH;
		action = "call ZKB_fnc_ManageGang;";
	};
	class GangMenu_CreateBtn: RscButton
	{
		idc = 17040;
		text = $STR_Gang_Create;
		x = 0.6875 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.1375 * safezoneW;
		h = 0.04 * safezoneH;
		action = "call ZKB_fnc_GangCreate;";
	};
	class GangMenu_GangList: RscListBox
	{
		idc = 17050;

		x = 0.2 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.625 * safezoneW;
		h = 0.1 * safezoneH;
	};
	};
};