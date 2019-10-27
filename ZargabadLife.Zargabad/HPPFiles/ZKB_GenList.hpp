class ZKB_GenList
{
idd = 1000;														
name = "ZKB_GenList";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_GenList', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_GenList', displayNull]";

class controls
	{
	class GenericList_BG: IGUIBack
	{
		idc = 1001;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.8 * safezoneH;
	};	
	class GenericList_Frame: ZKB_RscFrame
	{
		idc = 1002;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.8 * safezoneH;
	};
	class GenericList_List: ZKB_RscListBox
	{
		idc = 1010;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.64 * safezoneH;
	};
	class GenericList_Btn: ZKB_RscButton
	{
		idc = 1020;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.84 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
		text = "$STR_Common_Close";
	};
	};
};
