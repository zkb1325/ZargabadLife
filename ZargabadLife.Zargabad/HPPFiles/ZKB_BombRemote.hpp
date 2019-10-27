class ZKB_BombRemote
{
idd = 11000;														
name = "ZKB_BombRemote";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_BombRemote', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_BombRemote', displayNull]";

class controls
	{

	class BombRemote_BG: IGUIBack
	{
		idc = 11001;
		x = 0.38 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.24 * safezoneW;
		h = 0.13 * safezoneH;
	};
	class BombRemote_Frame: ZKB_RscFrame
	{
		idc = 11002;
		x = 0.38 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.24 * safezoneW;
		h = 0.13 * safezoneH;
	};
	class BombRemote_BombCode: ZKB_RscStructuredText
	{
		idc = 11010;
		text = $STR_ItemMisc_BombCode;
		x = 0.39 * safezoneW + safezoneX;
		y = 0.45 * safezoneH + safezoneY;
		w = 0.08 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class BombRemote_Code: ZKB_RscEdit
	{
		idc = 11020;
		x = 0.47 * safezoneW + safezoneX;
		y = 0.45 * safezoneH + safezoneY;
		w = 0.13 * safezoneW;
		h = 0.04 * safezoneH;
		onChar = "[_this, 11020] spawn ZKB_fnc_CheckValidChar;";
	};
	class BombRemote_Execute: ZKB_RscButton
	{
		idc = 11030;
		text = $STR_ItemMisc_Execute;
		x = 0.39 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[""Execute""] call ZKB_fnc_BombRemote";
	};
	class BombRemote_Cancel: ZKB_RscButton
	{
		idc = 11040;
		text = $STR_Common_Close;
		x = 0.51 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};