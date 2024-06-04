class dialogBuyVehicle 
{
	idd = 16041;

	class controls 
	{
		class frame: RscText
		{
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		// class titleText: RscText
		// {
		// 	idc = 161203;
		// 	text = "BUY VEHICLE"; 
		// 	x = 0.391719 * safezoneW + safezoneX;
		// 	y = 0.28 * safezoneH + safezoneY;
		// 	w = 0.0773437 * safezoneW;
		// 	h = 0.055 * safezoneH;
		// };
		class picture: RscPicture
		{
			idc = 160411;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class listBox: RscListbox
		{
			idc = 160412;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class btnBuy: RscButton
		{
			idc = 161203;
			text = "GET"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
			// action = "[] spawn GDGM_fnc_spawnVehBuy";
		};
		class btnClose: RscButton
		{
			idc = -1;
			text = "CLOSE"; 
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0";
		};
		class textPrice: RscText
		{
			idc = -1;
			text = "Cost : "; 
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class textMoney: RscText
		{
			idc = -1;
			text = "Supply points :"; 
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ctrlText_price: RscText
		{
			text = "<cost>"; 
			idc = 1004;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class ctrlText_money: RscText
		{
			text = "<points>"; 
			idc = 1005;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
	};
};