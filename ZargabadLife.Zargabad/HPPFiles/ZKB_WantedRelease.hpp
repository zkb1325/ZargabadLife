class ZKB_WantedRelease
{
idd = 16000;														
name = "ZKB_WantedRelease";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_WantedRelease', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_WantedRelease', displayNull]";

class controls
	{
	class WantedRelease_BG: IGUIBack
	{
		idc = 16001;
		x = 0.16 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.7 * safezoneW;
		h = 0.24 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.5};
	};
	class DynamicButtonMenu_Frame: RscFrame
	{
		idc = 16002;
		x = 0.16 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.7 * safezoneW;
		h = 0.24 * safezoneH;
	};
	class WantedRelease_SetWantedTxt: RscStructuredText
	{
		idc = 16010;
		text = "$STR_Cop_WantedMenuSetWantedMenu";
		x = 0.17 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class WantedRelease_SetWantedPlayerList: RscCombo
	{
		idc = 16020;
		x = 0.17 * safezoneW + safezoneX;
		y = 0.33 * safezoneH + safezoneY;
		w = 0.19 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class WantedRelease_CrimeReason: RscEdit
	{
		idc = 16030;
		text = "$STR_Cop_WantedMenuSetDescription";
		x = 0.17 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.31 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class WantedRelease_SetWantedBtn: RscButton
	{
		idc = 16040;
		text = "$STR_Cop_WantedMenuSetWanted";
		x = 0.17 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.14 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [16020,lbCurSel 16020],ctrlText 16030] call ZKB_fnc_SetWanted;";
	};
	class WantedRelease_SetUnWantedBtn: RscButton
	{
		idc = 16050;
		text = "$STR_Cop_WantedMenuPardon";
		x = 0.32 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.14 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [16020,lbCurSel 16020]] call ZKB_fnc_PardonPlayer;";
	};
	class WantedRelease_JailReleaseTxt: RscStructuredText
	{
		idc = 16060;
		text = "$STR_Cop_WantedMenuJailRelease";
		x = 0.52 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class WantedRelease_ReleaseMenuPlayerList: RscCombo
	{
		idc = 16070;
		x = 0.52 * safezoneW + safezoneX;
		y = 0.33 * safezoneH + safezoneY;
		w = 0.14 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class WantedRelease_JailReleaseBtn: RscButton
	{
		idc = 16080;
		text = "$STR_Cop_WantedMenuSetFree";
		x = 0.67 * safezoneW + safezoneX;
		y = 0.33 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [16070,lbCurSel 16070]] call ZKB_fnc_FreePlayer;";
	};
	class WantedRelease_VertTrenLine: RscText
	{
		idc = 16090;
		x = 0.49 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.01 * safezoneW;
		h = 0.24 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,0.5};
	};
	class WantedRelease_Cancel: RscButton
	{
		idc = 16110;
		text = "$STR_Common_Close";
		x = 0.58 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};