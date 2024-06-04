////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Gautier, v1.063, #Milace)
////////////////////////////////////////////////////////
class adminMenu 
{
	idd = 28011;
	class controls {
		class frame: RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class btn1: RscButton
		{
			idc = 1600;
			text = "Despawn attacks"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Despawn all current AI attacks"; //--- ToDo: Localize;
			action = "[] remoteExec ['GDGM_fnc_despawnAllNodesUnderAttack',2]";
		};
		class RscButton_1601: RscButton
		{
			text = "Give west"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Gives the closest node to WEST"; //--- ToDo: Localize;
			action = "closedialog 0;['WEST'] call GDGM_fnc_openGiveNode";
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Give ind"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Gives the closest node to INDEPENDENT"; //--- ToDo: Localize;
			action = "closedialog 0;['IND'] call GDGM_fnc_openGiveNode";
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Give east"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Gives the closest node to EAST"; //--- ToDo: Localize;
			action = "closedialog 0;['EAST'] call GDGM_fnc_openGiveNode";
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Collect garbage"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Despawn all unecessary positions"; //--- ToDo: Localize;
			action = "closedialog 0; [] remoteExec ['GDGM_fnc_nodeGarbageCollector',2]";
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = "Button"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1606: RscButton
		{
			idc = 1606;
			text = "Button"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1607: RscButton
		{
			idc = 1607;
			text = "Button"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1608: RscButton
		{
			idc = 1608;
			text = "Button"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1609: RscButton
		{
			idc = 1609;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1610: RscButton
		{
			idc = 1610;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1611: RscButton
		{
			idc = 1611;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1612: RscButton
		{
			idc = 1612;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1613: RscButton
		{
			idc = 1613;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1614: RscButton
		{
			idc = 1614;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1615: RscButton
		{
			idc = 1615;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1616: RscButton
		{
			idc = 1616;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscButton_1617: RscButton
		{
			idc = 1617;
			text = "Button"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "tooltip"; //--- ToDo: Localize;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.319 * safezoneH;
		};
		class btnCancel: RscButton
		{
			idc = 1618;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closedialog 0";
		};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
