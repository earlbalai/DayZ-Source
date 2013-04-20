class CfgMagazines {
	class CA_Magazine;	// External class reference
	class FoodDrink; //External class reference
	class ItemSodaEmpty; //External class reference
	class FoodEdible; //External class reference
	class TrashTinCan; //External class reference
	
	class Melee_Swing : CA_Magazine {
	//	scopeWeapon = protected;
	//	scopeMagazine = protected;
	//	magazineType = WeaponNoSlot;
		type = VSoft;
		flash = "";
		flashSize = 0;
		initSpeed = 100;
		maxLeadSpeed = 15; //20
		dexterity = 2; //20
		picture = "\dayz_weapons\textures\equip_shells_ca.paa";
		displayName = "crt";
		displayNameMagazine = "crt";
		shortNameMagazine = "crt";
		optics = false;
		distanceZoomMin = 0;
		distanceZoomMax = 0;
		reloadTime = 0.1;
		magazineReloadTime = 0.01;
		drySound[] = {"", 0, 1};
		reloadMagazineSound[] = {"", 0, 1};
		modes[] = {"Single"};
		sound[] = {"Weapons\grenade_launch", 0.0031623, 1};
		reloadSound[] = {"", 0.0003162, 1};
		showEmpty = 0;
		autoReload = true;
		count = 100000;
		canLock = LockNo;
		//
		burst = 1;
		multiplier = 1;
		ffMagnitude = 0.1;
		ffFrequency = 1;
		ffCount = 1;
		recoil = "Empty";
		dispersion = 0.2;
	};
	
	class ItemTent : CA_Magazine {
		scope = public;
		count = 1;
		type = (256 * 3);
		displayName = $STR_EQUIP_NAME_20;
		model = "\dayz_equip\models\tentbag_gear.p3d";
		picture = "\dayz_equip\textures\equip_tentbag_ca.paa";
		descriptionShort = $STR_EQUIP_DESC_20;
		
		class ItemActions {
			class Pitch {
				text = $STR_PITCH_TENT;
				script = "spawn player_tentPitch;";
			};
		};
	};
	
	class ItemSandbag : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		displayName = $STR_EQUIP_NAME_21;
		model = "\dayz_equip\models\sandbags.p3d";
		picture = "\dayz_equip\textures\equip_sandbag_ca.paa";
		descriptionShort = $STR_EQUIP_DESC_21;
		
		class ItemActions {
			class Build {
				text = $STR_ACTION_BUILD;
				script = "spawn player_build;";
				require = "ItemEtool";
				create = "Sandbag1_DZ";
			};
		};
	};
	
	class ItemTankTrap : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		displayName = $STR_EQUIP_NAME_22;
		model = "\dayz_equip\models\tank_trap_kit.p3d";
		picture = "\dayz_equip\textures\equip_tanktrap_kit_CA.paa";
		descriptionShort = $STR_EQUIP_DESC_22;
		
		class ItemActions {
			class Build {
				text = $STR_ACTION_BUILD;
				script = "spawn player_build;";
				require = "ItemToolbox";
				create = "Hedgehog_DZ";
			};
		};
	};
	
	class TrapBear : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		displayName = $STR_EQUIP_NAME_BEARTRAP;
		model = "\dayz_equip\models\bear_trap_gear.p3d";
		picture = "\dayz_equip\textures\equip_bear_trap_ca.paa";
		descriptionShort = $STR_EQUIP_DESC_BEARTRAP;
		
		class ItemActions {
			class Build {
				text = $STR_ACTION_BUILD;
				script = "spawn player_setTrap;";
				require = "ItemToolbox";
				create = "BearTrap_DZ";
			};
		};
	};
	
	class ItemWire : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		displayName = $STR_EQUIP_NAME_23;
		model = "\dayz_equip\models\Fence_wire_kit.p3d";
		picture = "\dayz_equip\textures\equip_fencewire_kit_CA.paa";
		descriptionShort = $STR_EQUIP_DESC_23;
		
		class ItemActions {
			class Build {
				text = $STR_ACTION_BUILD;
				script = "spawn player_build;";
				require = "ItemToolbox";
				create = "Wire_cat1";
			};
		};
	};
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

	class ItemTrashToiletpaper : CA_Magazine {
		scope = public;
		count = 1;
		displayName = $STR_JUNK_NAME_TOILETPAPER;
		descriptionShort = $STR_JUNK_DESC_TOILETPAPER;
		model = "z\addons\dayz_communityassets\models\toiletpaper.p3d";
		picture = "\z\addons\dayz_communityassets\pictures\equip_toiletpaper_CA.paa";
		type = 256;
	};
	class ItemTrashRazor : CA_Magazine {
		scope = public;
		count = 1;
		displayName = $STR_JUNK_NAME_RAZOR;
		descriptionShort = $STR_JUNK_DESC_RAZOR;
		model = "z\addons\dayz_communityassets\models\razor.p3d";
		picture = "\z\addons\dayz_communityassets\pictures\equip_razor_CA.paa";
		type = 256;
	};
	class ItemBookBible : CA_Magazine {
		scope = public;
		count = 1;
		displayName = $STR_BOOK_NAME_BIBLE;
		descriptionShort = $STR_BOOK_DESC_BIBLE;
		model = "z\addons\dayz_communityassets\models\bible.p3d";
		picture = "\z\addons\dayz_communityassets\pictures\equip_bible_CA.paa";
		type = 256;
	};
	class ItemNails : CA_Magazine {
		scope = public;
		count = 1;
		displayName = $STR_ITEM_NAME_NAILS;
		descriptionShort = $STR_ITEM_DESC_NAILS;
		model = "z\addons\dayz_communityassets\models\nails.p3d";
		picture = "\z\addons\dayz_communityassets\pictures\equip_nails_ca.paa";
		type = 256;
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
	
	#include "CombineMag.hpp"
	#include "FoodEdible.hpp"
	#include "FoodMeatCooked.hpp"
	#include "FoodMeatRaw.hpp"
	#include "ItemSoda.hpp"
	#include "ItemSodaEmpty.hpp"
	#include "MeleeSwing.hpp"
	#include "TrashTinCan.hpp"
};
