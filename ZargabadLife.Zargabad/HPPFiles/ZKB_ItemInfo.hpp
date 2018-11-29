class ZKB_ItemInfo
{
idd = 6000;														
name = "ZKB_ItemInfo";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_ItemInfo', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_ItemInfo', displayNull]";

class controls
	{
	class ItemInfo_BG: IGUIBack
	{
		idc = 6001;
		x = 0.175 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.65 * safezoneW;
		h = 0.68 * safezoneH;
	};
	class ItemInfo_Frame: RscFrame
	{
		idc = 6002;
		text = "$STR_MainMenu_ItemInfo";
		x = 0.175 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.65 * safezoneW;
		h = 0.68 * safezoneH;
	};
	class ItemInfo_NameFilterText: RscStructuredText
	{
		idc = -1;
		text = "$STR_MainMenu_ItemInfoItemNameFilterText";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.03 * safezoneH;
		class Attributes
			{
			align = "right";
			};
	};
	class ItemInfo_NameFilterEdit: RscEdit
	{
		idc = 6040;
		x = 0.25 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class ItemInfo_TypeFilterText: RscStructuredText
	{
		idc = -1;
		text = "$STR_MainMenu_ItemInfoItemTypeFilterText";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.03 * safezoneH;
		class Attributes
			{
			align = "right";
			};
	};
	class ItemInfo_TypeFilterEdit: RscEdit
	{
		idc = 6050;
		x = 0.25 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class ItemInfo_ApplyFilter: RscButton
	{
		idc = 6060;
		text = "$STR_MainMenu_ItemInfoApplyFilter";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ctrlText 6040,ctrlText 6050] call ZKB_fnc_AddItemInfoFilter;";
	};
	class ItemInfo_ResetFilter: RscButton
	{
		idc = 6060;
		text = "$STR_MainMenu_ItemInfoClearFilter";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.04 * safezoneH;
		action = "missionNamespace setVariable [""itemInfoFilter"",[[],[]]]; [] call ZKB_fnc_AddItemInfoFilter;";
	};
	class ItemInfo_CurTypeFilterCtrl: RscControlsGroup
		{
		idc = 6075;
		x = 0.2 * safezoneW + safezoneX;
		y = 0.33 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.06 * safezoneH;
		
		class controls
			{
			class ItemInfo_CurTypeFilter: RscStructuredText
			{
				idc = 6080;
				text = "";
				x = 0;
				y = 0;
				w = 0.2 * safezoneW;
				h = 0.06 * safezoneH;
			};
			};
		};
	class ItemInfo_ItemList: RscListBox
	{
		idc = 6010;
		onLBSelChanged = "[((_this select 0) lbData (_this select 1))] call ZKB_fnc_ItemInfoSelChange";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class ItemInfo_InfoTextCtrl: RscControlsGroup
		{
		
		idc = 6015;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.52 * safezoneH;
		
		class controls
			{
		
			class ItemInfo_InfoText: RscStructuredText
			{
				idc = 6020;
				text = "";
				x = 0;
				y = 0;
				w = 0.375 * safezoneW;
				h = 0.52 * safezoneH;
			};	
			};
		};
	class ItemInfo_TextFrame: RscFrame
	{
		idc = 6021;
		x = 0.425 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.52 * safezoneH;
	};
	class ItemInfo_SpawnItem: RscButton
	{
		idc = 6031;
		text = "$STR_MainMenu_ItemInfoSpawnItem";
		x = 0.425 * safezoneW + safezoneX;
		y = 0.76 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [6010,lbCurSel 6010]] call ZKB_fnc_ItemInfoMenuSpawnItem;";
	};
	class ItemInfo_Back: RscButton
	{
		idc = 6030;
		text = "$STR_Common_Back";
		x = 0.5125 * safezoneW + safezoneX;
		y = 0.76 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0; createDialog ""ZKB_MainMenu"";";
	};
	};
};

