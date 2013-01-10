class CfgWeapons {

	class ItemCore;
	class ItemMap1: ItemCore {
		descriptionshort = "Map";
		displayname = "Map";
		picture = "\z\addons\dayz_code\cfgweapons\icons\gear_picture_map_01_ca.paa";
		scope = 2;
		simulation = "ItemMap";
	};
	class ItemMap2: ItemCore {
		descriptionshort = "Map";
		displayname = "Map";
		picture = "\z\addons\dayz_code\cfgweapons\icons\gear_picture_map_02_ca.paa";
		scope = 2;
		simulation = "ItemMap";
	};
	class ItemMap3: ItemCore {
		descriptionshort = "Map";
		displayname = "Map";
		picture = "\z\addons\dayz_code\cfgweapons\icons\gear_picture_map_03_ca.paa";
		scope = 2;
		simulation = "ItemMap";
	};
	class ItemMap_Debug: ItemCore {
		descriptionshort = "Debug Map - Admin use only";
		displayname = "Map";
		picture = "\ca\ui\data\gear_picture_map_ca.paa";
		scope = 2;
		simulation = "ItemMap";
		class Library {
			libtextdesc = "Debug Map - Admin use only";
		};
	};
	
};