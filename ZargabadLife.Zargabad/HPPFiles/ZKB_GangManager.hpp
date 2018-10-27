class ZKB_GangManager
{
idd = 18000;														
name = "ZKB_GangManager";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_GangManager', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_GangManager', displayNull]";

class controls
	{

	class GangManager_BG: IGUIBack
	{
		idc = 18001;
		x = 0.24 * safezoneW + safezoneX;
		y = 0.13 * safezoneH + safezoneY;
		w = 0.47 * safezoneW;
		h = 0.43 * safezoneH;
	};
	class GangManager_Frame: RscFrame
	{
		idc = 18002;
		text = $STR_Gang_ManageGang;
		x = 0.24 * safezoneW + safezoneX;
		y = 0.13 * safezoneH + safezoneY;
		w = 0.47 * safezoneW;
		h = 0.43 * safezoneH;
	};
	class GangManager_KickHeader: RscStructuredText
	{
		idc = 18010;
		text = $STR_Gang_KickMember;
		x = 0.26 * safezoneW + safezoneX;
		y = 0.17 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
		{
		align = "center";
		};
	};
	
	class GangManager_GangMemberList: RscListBox
	{
		idc = 18020;
		x = 0.26 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.15 * safezoneH;
	};
	class GangManager_KickBtn: RscButton
	{
		idc = 18030;
		text = $STR_Gang_KickBtn;
		x = 0.26 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [18020, (lbCurSel 18020)]] call ZKB_fnc_KickFromGang;";
	};
	class GangManager_JoinHeader: RscStructuredText
	{
		idc = 18040;
		text = $STR_Gang_JoinAllowed;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.17 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
		{
		align = "center";
		}
	};
	class GangManager_JoinAllowList: RscListBox
	{
		idc = 18050;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.08 * safezoneH;
	};
	class GangManager_JoinAllowUpdateBtn: RscButton
	{
		idc = 18060;
		text = $STR_Gang_Update;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [18050, (lbCurSel 18050)]] call ZKB_fnc_UpdateGangLock;";
	};
	class GangManager_Cancel: RscButton
	{
		idc = 18070;
		text = $STR_Common_Close;
		x = 0.38 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};
