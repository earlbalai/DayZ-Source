class CfgWeapons {
	class ItemCore;
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
	
	class ItemCompass: ItemCore {
		model="z\addons\dayz_communityassets\models\compass.p3d";
	};
	
	class ItemWatch: ItemCore {
		model="z\addons\dayz_communityassets\models\watch.p3d";
	};
	
	class ItemMap: ItemCore {
		model="z\addons\dayz_communityassets\models\map.p3d";
	};
	
	class Crossbow;
	class Crossbow_DZ : Crossbow {
		magazines[] =
		{
			"Quiver",
			"WoodenArrow"
		};
	};
	class MeleeWeapon;
	class MeleeHatchet: MeleeWeapon
	{
		scope=2;
		melee= "true";
		autoreload=1;
		magazineReloadTime=0;
		model="\dayz_weapons\models\Hatchet_weaponized";
		picture="\dayz_equip\textures\equip_hatchet_CA.paa";
		displayName=$STR_EQUIP_NAME_HATCHET;
		droppeditem= "ItemHatchet";
		magazines[]=
		{
			"Hatchet_Swing"
		};
		handAnim[]=
		{
			"OFP2_ManSkeleton",
			"\dayz_weapons\anim\melee_hatchet_holding.rtm"
		};
		class ItemActions
		{
			class Use
			{
				text="$STR_ACTIONS_CHOPWOOD";
				script="spawn player_chopWood;";
			};
			class Toolbelt
			{
				text=$STR_ACTIONS_2TB;
				script="spawn player_addToolbelt;";
				use[]=
				{
					"MeleeHatchet"
				};
				output[]=
				{
					"ItemHatchet"
				};
			};
			class Drop
			{
				text=$STR_ACTIONS_DROP;
				script="spawn player_dropWeapon;";
				use[]=
				{
					"Hatchet_Swing"
				};
			};
		};
		class Library
		{
			libTextDesc=$STR_EQUIP_DESC_HATCHET;
		};
		descriptionShort=$STR_EQUIP_DESC_HATCHET;
	};	
	class ItemHatchet : ItemCore {
		displayName = $STR_EQUIP_NAME_HATCHET;
		descriptionShort = $STR_EQUIP_DESC_HATCHET;
	
		class ItemActions {
			class Toolbelt {
				text = $STR_ACTIONS_RFROMTB;
			};
		};
	};
	class MeleeCrowbar: MeleeWeapon
	{
		scope=2;
		melee= "true";
		autoreload=1;
		magazineReloadTime=0;
		model="\dayz_weapons\models\crowbar_weaponized";
		picture="\dayz_weapons\textures\equip_crowbar_CA.paa";
		displayName=$STR_EQUIP_NAME_CROWBAR;
		droppeditem= "ItemCrowbar";
		magazines[]=
		{
			"Crowbar_Swing"
		};
		handAnim[]=
		{
			"OFP2_ManSkeleton",
			"\dayz_weapons\anim\melee_hatchet_holding.rtm"
		};
		class ItemActions
		{
			class Toolbelt
			{
				text=$STR_ACTIONS_2TB;
				script="spawn player_addToolbelt;";
				use[]=
				{
					"MeleeCrowbar"
				};
				output[]=
				{
					"ItemCrowbar"
				};
			};
			class Drop
			{
				text=$STR_ACTIONS_DROP;
				script="spawn player_dropWeapon;";
				use[]=
				{
					"Crowbar_Swing"
				};
			};
		};
		class Library
		{
			libTextDesc=$STR_EQUIP_DESC_CROWBAR;
		};
		descriptionShort=$STR_EQUIP_DESC_CROWBAR; 
	};	
	class ItemCrowbar: ItemCore
	{
		scope=2;
		displayName=$STR_EQUIP_NAME_CROWBAR;
		model="\dayz_equip\models\crowbar.p3d";
		picture="\z\addons\dayz_communityassets\pictures\equip_crowbar_CA.paa";
		descriptionShort=$STR_EQUIP_DESC_CROWBAR;
		class ItemActions
		{
			class Toolbelt
			{
				text=$STR_ACTIONS_RFROMTB;
				script="spawn player_addToolbelt;";
				use[]=
				{
					"ItemCrowbar"
				};
				output[]=
				{
					"MeleeCrowbar"
				};
			};
		};
	};
	class MeleeMachete: MeleeWeapon
	{
		scope=2;
		melee= "true";
		autoreload=1;
		magazineReloadTime=0;
		model="\z\addons\dayz_communityassets\models\machete_weaponized.p3d";
		picture="\z\addons\dayz_communityassets\pictures\equip_machete_CA.paa";
		displayName="$STR_EQUIP_NAME_MACHETE";
		droppeditem= "MeleeMachete";
		magazines[]=
		{
			"Machete_Swing"
		};
		handAnim[]=
		{
			"OFP2_ManSkeleton",
			"\dayz_weapons\anim\melee_hatchet_holding.rtm"
		};
		class ItemActions
		{
			class Drop
			{
				text=$STR_ACTIONS_DROP;
				script="spawn player_dropWeapon;";
				use[]=
				{
					"Machete_Swing"
				};
			};
		};
		class Library
		{
			libTextDesc="$STR_EQUIP_DESC_MACHETE";
		};
		descriptionShort="$STR_EQUIP_DESC_MACHETE";
	};	
	class ItemMachete: ItemCore
	{
		scope=2;
		displayName="$STR_EQUIP_NAME_MACHETE";
		model="\z\addons\dayz_communityassets\models\machete.p3d";
		picture="\z\addons\dayz_communityassets\pictures\equip_machete_CA.paa";
		descriptionShort="$STR_EQUIP_DESC_MACHETE";
		class ItemActions
		{
			class Toolbelt
			{
				text=$STR_ACTIONS_RFROMTB;
				script="spawn player_addToolbelt;";
				use[]=
				{
					"ItemMachete"
				};
				output[]=
				{
					"MeleeMachete"
				};
			};
		};
	};
	
	class MeleeBaseBallBat: MeleeWeapon
	{
		scope=2;
		melee= "true";
		autoreload=1;
		magazineReloadTime=0;
		model="\z\addons\dayz_communityassets\models\baseball_bat_weaponized.p3d";
		picture="\z\addons\dayz_communityassets\pictures\equip_baseball_bat_ca.paa";
		displayName="$STR_EQUIP_NAME_BASEBALLBAT";
		droppeditem= "MeleeBaseBallBat";
		magazines[]=
		{
			"Bat_Swing"
		};
		handAnim[]=
		{
			"OFP2_ManSkeleton",
			"\dayz_weapons\anim\melee_hatchet_holding.rtm"
		};
		class ItemActions
		{
			class Drop
			{
				text=$STR_ACTIONS_DROP;
				script="spawn player_dropWeapon;";
			};
		};
		class Library
		{
			libTextDesc="$STR_EQUIP_DESC_BASEBALLBAT";
		};
		descriptionShort="$STR_EQUIP_DESC_BASEBALLBAT";
	};
	class MeleeBaseBallBatBarbed: MeleeWeapon
	{
		scope=2;
		melee= "true";
		autoreload=1;
		magazineReloadTime=0;
		model="\z\addons\dayz_communityassets\models\baseball_bat_barbed_weaponized.p3d";
		picture="\z\addons\dayz_communityassets\pictures\equip_baseball_bat_barbed_ca.paa";
		displayName="$STR_EQUIP_NAME_BASEBALLBATBARBED";
		droppeditem= "MeleeBaseBallBatBarbed";
		magazines[]=
		{
			"BatBarbed_Swing"
		};
		handAnim[]=
		{
			"OFP2_ManSkeleton",
			"\dayz_weapons\anim\melee_hatchet_holding.rtm"
		};
		class ItemActions
		{
			class Drop
			{
				text=$STR_ACTIONS_DROP;
				script="spawn player_dropWeapon;";
			};
		};
		class Library
		{
			libTextDesc="$STR_EQUIP_DESC_BASEBALLBATBARBED";
		};
		descriptionShort="$STR_EQUIP_DESC_BASEBALLBATBARBED";
	};

	class MeleeBaseBallBatNails : MeleeWeapon
	{
		scope=2;
		melee= "true";
		autoreload=1;
		magazineReloadTime=0;
		model="\z\addons\dayz_communityassets\models\baseball_bat_nails_weaponized.p3d";
		picture="\z\addons\dayz_communityassets\pictures\equip_baseball_bat_nails_ca.paa";
		displayName="$STR_EQUIP_NAME_BASEBALLBATNAILS";
		droppeditem= "MeleeBaseBallBatNails";
		magazines[]=
		{
			"BatNails_Swing"
		};
		handAnim[]=
		{
			"OFP2_ManSkeleton",
			"\dayz_weapons\anim\melee_hatchet_holding.rtm"
		};
		class ItemActions
		{
			class Drop
			{
				text=$STR_ACTIONS_DROP;
				script="spawn player_dropWeapon;";
			};
		};
		class Library
		{
			libTextDesc="$STR_EQUIP_DESC_BASEBALLBATNAILS";
		};
		descriptionShort="$STR_EQUIP_DESC_BASEBALLBATNAILS";
	};
	
	class PistolCore;	// External class reference
	class Pistol;	// External class reference
	class MeleeFlashlight : Pistol {
		class ItemActions {
			class Toolbelt {
				text = $STR_ACTIONS_2TB;
			};
		};
	};
	
	class ItemFlashlight : ItemCore {
		class ItemActions {
			class Toolbelt {
				text = $STR_ACTIONS_RFROMTB;
			};
		};
	}; 

	class MeleeFlashlightRed : MeleeFlashlight {
		class ItemActions {
			class Toolbelt {
				text = $STR_ACTIONS_2TB;
			};
		};
	};

	class ItemFlashlightRed : ItemCore {
		class ItemActions {
			class Toolbelt {
				text = $STR_ACTIONS_RFROMTB;
			};
		};
	};

	class GrenadeLauncher;  // External class reference
	class Flare : GrenadeLauncher {
		class ThrowMuzzle;
		class MolotovCocktailMuzzle : ThrowMuzzle {
			displayName = "$STR_ACTION_THROW";
			magazines[] = {
				"TrashJackDaniels", 
				"ItemSodaEmpty", 
				"TrashTinCan",
				"FoodCanGriffEmpty",
				"FoodCanBadguyEmpty",
				"FoodCanBoneboyEmpty",
				"FoodCanCornEmpty",
				"FoodCanCurgonEmpty",
				"FoodCanDemonEmpty",
				"FoodCanFraggleosEmpty",
				"FoodCanHerpyEmpty",
				"FoodCanDerpyEmpty",
				"FoodCanOrlokEmpty",
				"FoodCanPowellEmpty",
				"FoodCanTylersEmpty",
				"FoodCanUnlabeledEmpty",
				"FoodCanRusUnlabeledEmpty",
				"FoodCanRusPorkEmpty",
				"FoodCanRusPeasEmpty",
				"FoodCanRusMilkEmpty",
				"FoodCanRusCornEmpty",
				"FoodCanRusStewEmpty",
				"ItemSodaCokeEmpty",
				"ItemSodaPepsiEmpty",
				"ItemSodaMdewEmpty",
				"ItemSodaMtngreenEmpty",
				"ItemSodaR4z0rEmpty",
				"ItemSodaClaysEmpty",
				"ItemSodaSmashtEmpty", 
				"ItemSodaDrwasteEmpty", 
				"ItemSodaLemonadeEmpty", 
				"ItemSodaLvgEmpty", 
				"ItemSodaMzlyEmpty", 
				"ItemSodaRabbitEmpty"
			};          
		};
	}; 
	class M107;	// External class reference
	class M107_DZ : M107 {
		displayname = "M107_DZ";
		type = "1";
		canlock = 0;
		cursor = "RifleCursor";
		cursoraim = "Foresight";
	};
	class BAF_AS50_scoped;	// External class reference
	class BAF_AS50_scoped_DZ : BAF_AS50_scoped {
		displayname = "AS50_DZ";
		type = "1";
		canlock = 0;
		//cursor = "RifleCursor";
		//cursoraim = "Foresight";
	};
};