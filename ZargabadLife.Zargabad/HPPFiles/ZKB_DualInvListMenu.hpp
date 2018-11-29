class ZKB_DualInvListMenu
{
idd = 5000;														
name = "ZKB_DualInvListMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_DualInvListMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_DualInvListMenu', displayNull]";

class controls 
	{

	class DualInvListMenu_BG1: IGUIBack
	{
		idc = 5001;

		x = 0.05 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class DualInvListMenu_BG1Frame: RscFrame
	{
		idc = 5002;

		x = 0.05 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class DualInvListMenu_BG2: IGUIBack
	{
		idc = 5003;

		x = 0.525 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class DualInvListMenu_BG2Frame: RscFrame
	{
		idc = 5004;

		x = 0.525 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.425 * safezoneW;
		h = 0.58 * safezoneH;
	};
	class DualInvListMenu_List1: RscListBox
	{
		idc = 5010;
		onLBSelChanged = "[(_this select 0),0,(_this select 0) lbData (_this select 1),parseNumber (ctrlText 5030)] call ZKB_fnc_DualInvUpdateBtn;";
		onLBDrop = "_this call ZKB_fnc_DualInvDropEvent;";
		//onLBDragging = "_this call ZKB_fnc_DualInvDraggingEvent;";
		canDrag = 1;
		x = 0.075 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class DualInvListMenu_List2: RscListBox
	{
		idc = 5020;
		onLBSelChanged = "[(_this select 0),1,(_this select 0) lbData (_this select 1),parseNumber (ctrlText 5030)] call ZKB_fnc_DualInvUpdateBtn;";
		onLBDrop = "_this call ZKB_fnc_DualInvDropEvent;";
		//onLBDragging = "_this call ZKB_fnc_DualInvDraggingEvent;";
		canDrag = 1;
		x = 0.55 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class DualInvListMenu_Amount1: RscEdit
	{
		idc = 5030;
		onChar = "_this spawn ZKB_fnc_CheckCharNum;";
		text = "1";
		x = 0.075 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Amount2: RscEdit
	{
		idc = 5040;
		onChar = "_this spawn ZKB_fnc_CheckCharNum;";
		text = "1";
		x = 0.5375 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Submit1: RscButton
	{
		idc = 5050;
		action = "[((findDisplay 5000) displayCtrl 5010),((findDisplay 5000) displayCtrl 5020),lbData [5010,lbCurSel 5010],parseNumber (ctrlText 5030)] call ZKB_fnc_DualInvTransfer;";
		x = 0.2625 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Submit2: RscButton
	{
		idc = 5060;
		action = "[((findDisplay 5000) displayCtrl 5020),((findDisplay 5000) displayCtrl 5010),lbData [5020,lbCurSel 5020],parseNumber (ctrlText 5040)] call ZKB_fnc_DualInvTransfer;";
		x = 0.7375 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Cancel1: RscButton
	{
		idc = 5070;
		action = "closedialog 0";
		text = "$STR_Common_Close";
		x = 0.2625 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Cancel2: RscButton
	{
		idc = 5080;
		action = "closedialog 0";
		text = "$STR_Common_Close";
		x = 0.7375 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Info1: RscText
	{
		idc = 5090;
		x = 0.075 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class DualInvListMenu_Info2: RscText
	{
		idc = 5095;
		x = 0.5375 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	};
};
