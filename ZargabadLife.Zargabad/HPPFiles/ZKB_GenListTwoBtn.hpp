class ZKB_GenListTwoBtn
{
idd = 12000;														
name = "ZKB_GenListTwoBtn";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_GenListTwoBtn', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_GenListTwoBtn', displayNull]";

class controls
	{
	class GenericList_BG: IGUIBack
	{
		idc = 12001;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.8 * safezoneH;
	};
	class GenericList_List: ZKB_RscListBox
	{
		idc = 12010;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.64 * safezoneH;
	};
	class GenericList_Btn1: ZKB_RscButton
	{
		idc = 12020;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.84 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	class GenericList_Btn2: ZKB_RscButton
	{
		idc = 12030;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.84 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};