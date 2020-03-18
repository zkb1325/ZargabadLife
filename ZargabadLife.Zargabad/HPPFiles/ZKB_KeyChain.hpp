class ZKB_KeyChain
{
idd = 3000;														
name = "ZKB_KeyChain";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_KeyChain', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_KeyChain', displayNull]";

class controls
	{
	class KeyChain_BG: IGUIBack
	{
		idc = 3001;
		x = 0.34 * safezoneW + safezoneX;
		y = 0.11 * safezoneH + safezoneY;
		w = 0.33 * safezoneW;
		h = 0.81 * safezoneH;
	};
	class KeyChain_Frame: ZKB_RscFrame
	{
		idc = 3002;
		x = 0.34 * safezoneW + safezoneX;
		y = 0.11 * safezoneH + safezoneY;
		w = 0.33 * safezoneW;
		h = 0.81 * safezoneH;
	};
	class KeyChain_List: ZKB_RscListBox
	{
		idc = 3010;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.54 * safezoneH;
	};
	class KeyChain_Use: ZKB_RscButton
	{
		idc = 3020;
		text = $STR_Inv_Use;
		action = "[""UseKey"", (lbData [3010, (lbCurSel 3010)])] spawn ZKB_fnc_KeyChain;";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.7 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class KeyChain_Give: ZKB_RscButton
	{
		idc = 3030;
		text = $STR_Inv_Give;
		action = "[""GiveKey"", (lbData [3010, (lbCurSel 3010)]), (lbData [3050, (lbCurSel 3050)])] spawn ZKB_fnc_KeyChain;";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.75 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class KeyChain_Cancel: ZKB_RscButton
	{
		idc = 3040;
		text = $STR_Common_Close;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.8 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class KeyChain_PlayerList: ZKB_RscCombo
	{
		idc = 3050;

		x = 0.35 * safezoneW + safezoneX;
		y = 0.86 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.04 * safezoneH;
	};
	};
};