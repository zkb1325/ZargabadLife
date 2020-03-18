class ZKB_Phone
{
idd = 8000;														
name = "ZKB_Phone";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_Phone', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_Phone', displayNull]";

class controls
	{

	class Phone_BG: IGUIBack
	{
		idc = 8001;
		x = 0.125 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.75 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Phone_Frame: ZKB_RscFrame
	{
		idc = 8002;
		x = 0.125 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.75 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Phone_Message: ZKB_RscEdit
	{
		idc = 8010;
		x = 0.1375 * safezoneW + safezoneX;
		y = 0.31 * safezoneH + safezoneY;
		w = 0.7125 * safezoneW;
		h = 0.06 * safezoneH;
		onChar = "[_this, 8010] spawn ZKB_fnc_CheckValidChar;";
	};
	class Phone_PlayerList: ZKB_RscCombo
	{
		idc = 8020;
		x = 0.1375 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Phone_Send: ZKB_RscButton
	{
		idc = 8030;
		text = $STR_ItemMisc_PhoneSend;
		x = 0.3625 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[""SendMessage""] call ZKB_fnc_Phone";
	};
	class Phone_Cancel: ZKB_RscButton
	{
		idc = 8040;
		text = $STR_Common_Close;
		x = 0.65 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};
	