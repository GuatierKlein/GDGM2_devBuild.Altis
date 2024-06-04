class dialogAttackSelect {
	idd = 19021;
	class controls {
		class frame: RscPicture
		{
			idc = -1;
			x = 0.293784 * safezoneW + safezoneX;
			y = 0.225024 * safezoneH + safezoneY;
			w = 0.412431 * safezoneW;
			h = 0.549951 * safezoneH;
			text = "Images\paperSquare.jpg";
		};
		class listBox: RscListbox
		{
			idc = 190211;
			x = 0.29894 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.13404 * safezoneW;
			h = 0.263977 * safezoneH;
		};
		class titleList: RscText
		{
			idc = -1;
			text = "Battlegroups"; //--- ToDo: Localize;
			x = 0.314406 * safezoneW + safezoneX;
			y = 0.26902 * safezoneH + safezoneY;
			w = 0.0670201 * safezoneW;
			h = 0.0439961 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class map: RscMapControl
		{
			idc = 190212;
			x = 0.43298 * safezoneW + safezoneX;
			y = 0.28002 * safezoneH + safezoneY;
			w = 0.25777 * safezoneW;
			h = 0.45096 * safezoneH;
		};
		class btnAttack: RscButton
		{
			idc = -1;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.314406 * safezoneW + safezoneX;
			y = 0.697982 * safezoneH + safezoneY;
			w = 0.0876417 * safezoneW;
			h = 0.0549951 * safezoneH;
			action = "closedialog 0";
		};
		class titleSup: RscText
		{
			idc = -1;
			text = "Available supplies :"; //--- ToDo: Localize;
			x = 0.314406 * safezoneW + safezoneX;
			y = 0.587992 * safezoneH + safezoneY;
			w = 0.0721755 * safezoneW;
			h = 0.0439961 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlSup: RscText
		{
			idc = 190213;
			text = ""; //--- ToDo: Localize;
			x = 0.386581 * safezoneW + safezoneX;
			y = 0.587992 * safezoneH + safezoneY;
			w = 0.0360877 * safezoneW;
			h = 0.0439961 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class titleRes: RscText
		{
			idc = -1;
			text = "Available reserves :"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721755 * safezoneW;
			h = 0.043996 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlRes: RscText
		{
			idc = 190214;
			text = ""; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0360877 * safezoneW;
			h = 0.043996 * safezoneH;
			colorText[] = {0,0,0,1};
		};
	};
};


