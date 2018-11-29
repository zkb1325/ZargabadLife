class Admin_Comp_BG: IGUIBack
{
	idc = 50020;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.3 * safezoneH;
};
class Admin_Comp_Amount: RscEdit
{
	idc = 50021;
	text = "1";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.12 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_InventoryToggle: RscCheckbox
{
	idc = 50022;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_InventoryToggleText: RscStructuredText
{
	idc = 50023;
	text = "$STR_Admin_CompCheckBoxText";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_CompMoneyBtn: RscButton
{
	idc = 50024;
	text = "$STR_Admin_CompSelectedPlayer";
	action = "[lbData [50002,lbCurSel 50002],ctrlText 50021,cbChecked ((findDisplay 50000) displayCtrl 50022)] call ZKB_fnc_AdminCompPlayer;";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_CompEveryoneMoneyBtn: RscButton
{
	idc = 50025;
	text = "$STR_Admin_CompEveryone";
	action = "[true,ctrlText 50021,cbChecked ((findDisplay 50000) displayCtrl 50022)] call ZKB_fnc_AdminCompPlayer;";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_BG2: IGUIBack
{
	idc = 50026;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.275 * safezoneW;
	h = 0.74 * safezoneH;
};
class Admin_Comp_ItemList: RscListbox
{
	idc = 50027;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.36 * safezoneH;
};
class Admin_Comp_ItemAmount: RscEdit
{
	idc = 50028;
	text = "1";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_CompItemBtn: RscButton
{
	idc = 50029;
	text = "$STR_Admin_CompGivePlayerItem";
	action = "[lbData [50002,lbCurSel 50002],lbData [50027,lbCurSel 50027],ctrlText 50028] call ZKB_fnc_AdminCompItem;";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.04 * safezoneH;
};
class Admin_Comp_CompEveryoneItemBtn: RscButton
{
	idc = 50030;
	text = "$STR_Admin_CompGiveEveryoneItem";
	action = "[true,lbData [50027,lbCurSel 50027],ctrlText 50028] call ZKB_fnc_AdminCompItem;";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.76 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.04 * safezoneH;
};

class Admin_Comp_ItemFilterText: RscStructuredText
{
	idc = 50031;
	text = "$STR_MainMenu_ItemInfoItemNameFilterText";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.12 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.03 * safezoneH;
};
class Admin_Comp_ItemFilterEdit: RscEdit
{
	idc = 50032;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.12 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.03 * safezoneH;
};
class Admin_Comp_TypeFilterText: RscStructuredText
{
	idc = 50033;
	text = "$STR_MainMenu_ItemInfoItemTypeFilterText";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.03 * safezoneH;
};
class Admin_Comp_TypeFilterEdit: RscEdit
{
	idc = 50034;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.03 * safezoneH;
};
class ItemInfo_CurTypeFilterCtrl: RscControlsGroup
		{
		idc = 50035;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
		
		class controls
			{
			class Admin_Comp_CurFilters: RscStructuredText
			{
				idc = 50036;
				text = "";
				x = 0;
				y = 0;
				w = 0.225 * safezoneW;
				h = 0.04 * safezoneH;
			};
			};
		};
class Admin_Comp_ApplyFilter: RscButton
{
	idc = 50037;
	text = "$STR_MainMenu_ItemInfoApplyFilter";
	action = "[ctrlText 50032,ctrlText 50034] call ZKB_fnc_AdminCompAddItemInfoFilter;";
	x = 0.6625 * safezoneW + safezoneX;
	y = 0.12 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.03 * safezoneH;
};
class Admin_Comp_ClearFilter: RscButton
{
	idc = 50038;
	text = "$STR_MainMenu_ItemInfoClearFilter";
	action = "missionNamespace setVariable [""itemInfoFilter"",[[],[]]]; [] call ZKB_fnc_AdminCompAddItemInfoFilter;";
	x = 0.6625 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.03 * safezoneH;
};

