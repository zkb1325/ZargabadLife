class ZKB_GangCreate
{
idd = 19000;														
name = "ZKB_GangCreate";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_GangCreate', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_GangCreate', displayNull]";

class controls
	{
	class GangCreate_BG: IGUIBack
	{
		idc = 19001;
		x = 0.2925 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class GangCreate_Frame: RscFrame
	{
		idc = 19002;
		x = 0.2925 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class GangCreate_Header: RscStructuredText
	{
		idc = 19010;
		text = $STR_Gang_CreateNewGang;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
		{
		align = "center";
		};
	};
	class GangCreate_GangName: RscEdit
	{
		idc = 19020;
		text = $STR_Gang_GangName;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.3625 * safezoneW;
		h = 0.04 * safezoneH;
		onChar = "[_this, 19020] spawn ZKB_fnc_CheckValidChar;";
	};
	class GangCreate_CreateBtn: RscButton
	{
		idc = 19030;
		text = $STR_Gang_Create;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.47 * safezoneH + safezoneY;
		w = 0.1775 * safezoneW;
		h = 0.04 * safezoneH;
		action = "call ZKB_fnc_GangCreated;";
	};
	class GangCreate_GangCreateInfo: RscStructuredText
	{
		idc = 19040;
		text = $STR_Gang_NewGangInfo;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.52 * safezoneH + safezoneY;
		w = 0.3625 * safezoneW;
		h = 0.08 * safezoneH;
	};
	class GangCreate_Cancel: RscButton
	{
		idc = 19050;
		text = $STR_Common_Close;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.47 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};
