class ZKB_ListMenu
{
idd = 5000;														
name = "ZKB_ListMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_ListMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_ListMenu', displayNull]";

class controls 
	{

	class UniversalListMenu_BG1: IGUIBack
	{
		idc = 5001;

		x = 0.05 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class UniversalListMenu_BG1Frame: ZKB_RscFrame
	{
		idc = 5002;

		x = 0.05 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class UniversalListMenu_BG2: IGUIBack
	{
		idc = 5003;

		x = 0.525 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class UniversalListMenu_BG2Frame: ZKB_RscFrame
	{
		idc = 5004;

		x = 0.525 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class UniversalListMenu_List1: ZKB_RscListBox
	{
		idc = 5010;

		x = 0.075 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class UniversalListMenu_List2: ZKB_RscListBox
	{
		idc = 5020;

		x = 0.55 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class UniversalListMenu_Amount1: ZKB_RscEdit
	{
		idc = 5030;
		onChar = "_this spawn ZKB_fnc_CheckCharNum;";

		text = "1";
		x = 0.075 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Amount2: ZKB_RscEdit
	{
		idc = 5040;
		onChar = "_this spawn ZKB_fnc_CheckCharNum;";

		text = "1";
		x = 0.5375 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Submit1: ZKB_RscButton
	{
		idc = 5050;

		x = 0.2625 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Submit2: ZKB_RscButton
	{
		idc = 5060;

		x = 0.7375 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Cancel1: ZKB_RscButton
	{
		idc = 5070;
		action = "closedialog 0";

		text = $STR_Common_Close;
		x = 0.2625 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Cancel2: ZKB_RscButton
	{
		idc = 5080;
		action = "closedialog 0";

		text = $STR_Common_Close;
		x = 0.7375 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Info1: ZKB_RscText
	{
		idc = 5090;

		x = 0.075 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class UniversalListMenu_Info2: ZKB_RscText
	{
		idc = 5095;

		x = 0.5375 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	};
};
