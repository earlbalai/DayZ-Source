class CfgMagazines {
	class CA_Magazine;	// External class reference
	class FoodDrink; //External class reference
	class ItemSodaEmpty; //External class reference
	class FoodEdible; //External class reference
	class TrashTinCan; //External class reference

	//skins translations
	class SkinBase : CA_Magazine {
		displayName = $STR_EQUIP_NAME_CLOTHES;
		descriptionShort = $STR_EQUIP_DESC_CLOTHES;
		class ItemActions {
			class Use {
				text = $STR_EQUIP_TEXT_CLOTHES;
			};
		};
	};
	class Skin_Sniper1_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_GHILLIE;
		descriptionShort = $STR_EQUIP_DESC_GHILLIE;
	};
	
	class Skin_Camo1_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_CAMO;
		descriptionShort = $STR_EQUIP_DESC_CAMO;
	};
	
	class Skin_Survivor2_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_CIV;
		descriptionShort = $STR_EQUIP_DESC_CIV;
	};
	
	class Skin_Soldier1_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_SOLDIER;
		descriptionShort = $STR_EQUIP_DESC_SOLDIER;
	}; 
	
	class Quiver : CA_Magazine {
		scope = public;
		ammo = "WoodenArrow";
		count = 6;
		type = 256;
		descriptionShort = $STR_ITEMQUIVER_CODE_DESC;
		displayName = $STR_ITEMQUIVER_CODE_NAME;
		initSpeed = 150;
		model = "\z\addons\dayz_communityassets\models\quiver";
		picture = "\z\addons\dayz_communityassets\pictures\equip_quiver_ca.paa";
		class ItemActions {
			class TakeArrow {
				text = "Take arrow from quiver";
				script = "spawn player_takearrow;";
			};
			class FillQuiver {
				text = "Fill quiver";
				script = "spawn player_fillquiver;";
			};
		};
	};
	
	class WoodenArrow : CA_Magazine {
		scope = public;
		displayName = $STR_ITEMWOODENARROW_CODE_NAME;
		model = "\dayz_weapons\models\bolt_gear";
		picture = "\z\addons\dayz_communityassets\pictures\equip_warrow_ca.paa";
		ammo = "WoodenArrow";
		count = 1;
		initSpeed = 150;
		descriptionShort = $STR_ITEMWOODENARROW_CODE_DESC;
		
		class ItemActions {
			class CreateQuiver {
				text = "Create quiver";
				script = "spawn player_createquiver;";
			};
		};
	};
	
	class ItemSoda : FoodDrink {
		scope = public;
		sfx = "soda";
		sfxdis = 3;
	};
	
	class FoodRaw : FoodEdible {
		scope = public;
		count = 1;
		type = 256;
	};
	
	class FoodCooked : FoodEdible {
		scope = public;
		count = 1;
	};
	
	class ItemJerrycan : CA_Magazine {
		emptycan = "ItemJerrycanEmpty";
		displayName = $STR_ITEM_NAME_JERRYCAN;
		descriptionShort = $STR_ITEM_DESC_JERRYCAN;
	}; 

	class ItemJerrycanEmpty : ItemJerrycan {
		fullcan = "ItemJerrycan";
		displayName = $STR_ITEM_NAME_JERRYCAN_EMPTY;
		descriptionShort = $STR_ITEM_DESC_JERRYCAN_EMPTY;
	};
	class ItemFuelcan : CA_Magazine {
		scope = public;
		count = 1;
		fuelQuantity = 5;
		emptycan = "ItemFuelcanEmpty";
		type = 256;
		displayName = $STR_ITEM_NAME_FUELCAN;
		descriptionShort = $STR_ITEM_DESC_FUELCAN;
		model = "z\addons\dayz_communityassets\models\fuelcan.p3d";
		picture = "\z\addons\dayz_communityassets\pictures\equip_fuelcan_CA.paa";
	};
	class ItemFuelcanEmpty :  ItemFuelcan {
		scope = public;
		count = 1;
		fuelQuantity = 0;
		fullcan = "ItemFuelcan";
		type = 256;
		displayName = $STR_ITEM_NAME_FUELCAN_EMPTY;
		descriptionShort = $STR_ITEM_DESC_FUELCAN_EMPTY;
		model = "z\addons\dayz_communityassets\models\fuelcan.p3d";
		picture = "\z\addons\dayz_communityassets\pictures\equip_fuelcan_empty_CA.paa";
	};

	class HandGrenade;	// External class reference
	class HandRoadFlare : HandGrenade {
		class ItemActions {
			class CombineMag {
				text = $STR_MAG_COMBINE;
				script = "spawn player_combineMag;";
			};
		};
	};
	
	class ChemLightMag : HandGrenade {
		class ItemActions {
			class CombineMag {
				text = $STR_MAG_COMBINE;
				script = "spawn player_combineMag;";
			};
		};
	};
	
	class HandChemBlue : ChemLightMag {
		class ItemActions {
			class CombineMag {
				text = $STR_MAG_COMBINE;
				script = "spawn player_combineMag;";
			};
		};
	};
	
	class HandChemGreen : ChemLightMag {
		class ItemActions {
			class CombineMag {
				text = $STR_MAG_COMBINE;
				script = "spawn player_combineMag;";
			};
		};
	};
	
	class HandChemRed : ChemLightMag {
		class ItemActions {
			class CombineMag {
				text = $STR_MAG_COMBINE;
				script = "spawn player_combineMag;";
			};
		};
	};
	//add here any magazines types you want to be re-combined like shown before
	
	#include "CfgMagazines\CombineMag.hpp"
	#include "CfgMagazines\FoodEdible.hpp"
	#include "CfgMagazines\FoodMeatCooked.hpp"
	#include "CfgMagazines\FoodMeatRaw.hpp"
	#include "CfgMagazines\ItemSoda.hpp"
	#include "CfgMagazines\ItemSodaEmpty.hpp"
	#include "CfgMagazines\MeleeSwing.hpp"
	#include "CfgMagazines\TrashTinCan.hpp"
	#include "CfgMagazines\Deployable.hpp"
	#include "CfgMagazines\TrashLoot.hpp"
};
