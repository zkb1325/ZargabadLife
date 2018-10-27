class ZKB_LawEditMenu
{
idd = 22000;														
name = "ZKB_LawEditMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_LawEditMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_LawEditMenu', displayNull]";

class controls
	{

	class LawEditMenu_BG: IGUIBack
	{
		idc = 22001;
		x = 0.03 * safezoneW + safezoneX;
		y = 0.21 * safezoneH + safezoneY;
		w = 0.93 * safezoneW;
		h = 0.43 * safezoneH;
	};
	class LawMenu_Fame: RscFrame
	{
		idc = 22002;
		text = "$STR_Law_LawMenu";
		x = 0.03 * safezoneW + safezoneX;
		y = 0.21 * safezoneH + safezoneY;
		w = 0.93 * safezoneW;
		h = 0.43 * safezoneH;
	};
	class LawEditMenu_LawList: RscListBox
	{
		idc = 22010;
		x = 0.04 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.91 * safezoneW;
		h = 0.34 * safezoneH;
		onLBSelChanged = "ctrlSetText [22020,(_this select 0) lbData (_this select 1)]";
	};
	class LawEditMenu_NewLawEdit: RscEdit
	{
		idc = 22020;
		x = 0.04 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.71 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class LawEditMenu_UpdateLawBtn: RscButton
	{
		idc = 22030;
		text = "$STR_Law_ChangeLaw";
		x = 0.75 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbCurSel 22010, ctrlText 22020] call ZKB_fnc_UpdateLaw;";
	};
	};
};