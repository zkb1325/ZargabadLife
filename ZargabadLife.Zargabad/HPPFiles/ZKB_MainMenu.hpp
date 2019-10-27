class ZKB_MainMenu
{
idd = -1;														
name = "ZKB_MainMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_MainMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_MainMenu', displayNull]";

class controls
	{
	class Menu_BG: IGUIBack
	{
		idc = -1;

		x = 0.4 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.46 * safezoneH;
	};
	class Menu_Fame: ZKB_RscFrame
	{
		idc = -1;
		
		text = $STR_MainMenu_MainMenu;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.46 * safezoneH;
	};
	class Menu_GraphicBtn: ZKB_RscButton
	{
		action = "closedialog 0; createDialog ""ZKB_ViewSettings"";";

		idc = -1;
		text = $STR_MainMenu_Settings;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Menu_SayTextBtn: ZKB_RscButton
	{
		action = "closedialog 0; [""Open""] call ZKB_fnc_SayTextMenu;";

		idc = -1;
		text = $STR_MainMenu_ShoutTexts;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Menu_TutorialBtn: ZKB_RscButton
	{
		action = "closedialog 0; [localize ""STR_MainMenu_TutorialText"", localize ""STR_MainMenu_Tutorial""] call ZKB_fnc_FillMenuGenText;";

		idc = -1;
		text = $STR_MainMenu_Tutorial;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Menu_FAQBtn: ZKB_RscButton
	{
		action = "closedialog 0; [localize ""STR_MainMenu_FAQText"", localize ""STR_MainMenu_FAQ""] call ZKB_fnc_FillMenuGenText;";

		idc = -1;
		text = $STR_MainMenu_FAQ;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.46 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Menu_AboutBtn: ZKB_RscButton
	{
		action = "closedialog 0; [localize ""STR_MainMenu_AboutText"", localize ""STR_MainMenu_About""] call ZKB_fnc_FillMenuGenText;";

		idc = -1;
		text = $STR_MainMenu_About;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.52 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Menu_ItemInfoBtn: ZKB_RscButton
	{
		action = "closedialog 0; call ZKB_fnc_ItemInfoMenu;";

		idc = -1;
		text = $STR_MainMenu_ItemInfo;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Menu_CloseBtn: ZKB_RscButton
	{
		action = "closedialog 0;";

		idc = -1;
		text = $STR_Common_Close;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	};
};