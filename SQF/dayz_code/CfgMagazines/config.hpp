class CfgMagazines {
	class CA_Magazine;	// External class reference

	class DayZ_Code_FoodEdible : CA_Magazine {
		isFood = 1;
		count = 1;
		type = 256;
		class ItemActions {
			class Eat {
				text = $STR_EAT_FOOD;
				script = "spawn player_eat;";
			};
		};
	};

	class FoodboarCooked : DayZ_Code_FoodEdible {
		scope = public;
		count = 1;
		displayName = "BoarCooked";
		model = "\z\addons\dayz_code\CfgMagazines\models\boar_geo.p3d";
		picture = "\z\addons\dayz_code\CfgMagazines\picture\icon_boar_steak_cooked_ca.paa";
		descriptionShort = $STR_EQUIP_DESC_25;
		bloodRegen = 200;
	};
	class FoodSteakCooked2 : DayZ_Code_FoodEdible {
		scope = public;
		count = 1;
		displayName = $STR_EQUIP_NAME_25;
		model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
		picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
		descriptionShort = $STR_EQUIP_DESC_25;
		bloodRegen = 400;
	};

	class FoodBaconCooked : DayZ_Code_FoodEdible {
		scope = public;
		count = 1;
		displayName = $STR_EQUIP_NAME_25;
		model = "\dayz_equip\models\food_steak_cooked_gear.p3d";
		picture = "\dayz_equip\textures\equip_steak_cooked_ca.paa";
		descriptionShort = $STR_EQUIP_DESC_25;
		bloodRegen = 800;
	};
	
};