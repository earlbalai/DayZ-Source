class ReammoBox_EP1;	// External class reference
class Bag_Base_EP1 : ReammoBox_EP1 {
	scope = private;

	class TransportMagazines {};

	class TransportWeapons {};
	transportMaxMagazines = 0;
	transportMaxWeapons = 0;
	isbackpack = 1;
	reversed = true;
	vehicleClass = "Backpacks";

	class DestructionEffects {};

	class eventHandlers {
		init = "";
	};
};

class DZ_Patrol_Pack_EP1: Bag_Base_EP1
{
	scope = 2;
	displayName = "Patrol Pack (coyote)";
	picture = "\ca\weapons_e\data\icons\backpack_US_ASSAULT_COYOTE_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	mapsize = 2;
	model = "\ca\weapons_e\AmmoBoxes\backpack_us_assault_Coyote.p3d";
	transportMaxWeapons = 1;
	transportMaxMagazines = 8;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_Patrol_Pack_EP1'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};
};

class DZ_Assault_Pack_EP1: Bag_Base_EP1
{
	scope = 2;
	displayName = "Assault Pack (ACU)";
	picture = "\ca\weapons_e\data\icons\backpack_US_ASSAULT_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	mapSize = 2;
	model = "\ca\weapons_e\AmmoBoxes\backpack_us_assault.p3d";
	transportMaxWeapons = 1;
	transportMaxMagazines = 12;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_Assault_Pack_EP1'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};	
};

class DZ_Czech_Vest_Puch: Bag_Base_EP1
{
	displayname = "Czech Vest Pouch";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	mapsize = 2;
	model = "\ca\weapons_e\AmmoBoxes\backpack_acr_small.p3d";
	picture = "\ca\weapons_e\data\icons\backpack_ACR_small_CA.paa";
	scope = 2;
	transportmaxmagazines = 12;
	transportmaxweapons = 0;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_Czech_Vest_Puch'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};	
};

class DZ_ALICE_Pack_EP1: Bag_Base_EP1
{
	scope = 2;
	displayName = "ALICE Pack";
	picture = "\ca\weapons_e\data\icons\backpack_TK_ALICE_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	mapsize = 2;
	model = "\ca\weapons_e\AmmoBoxes\backpack_tk_alice.p3d";
	transportMaxWeapons = 2;
	transportMaxMagazines = 16;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_ALICE_Pack_EP1'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};	
};

class DZ_TK_Assault_Pack_EP1 : Bag_Base_EP1
{
	scope = 2;
	displayName = "Survival ACU";
	mapSize = 2;
	picture = "\ca\weapons_e\data\icons\backpack_CIVIL_ASSAULT_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	model = "\ca\weapons_e\AmmoBoxes\backpack_civil_assault.p3d";
	transportMaxWeapons = 2;
	transportMaxMagazines = 16;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_TK_Assault_Pack_EP1'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};	
};

class DZ_British_ACU : Bag_Base_EP1
{
	scope = 2;
	displayName = "British Assault Pack";
	mapSize = 2;
	model = "\ca\weapons_baf\Backpack_Small_BAF";
	picture = "\ca\weapons_baf\data\UI\backpack_BAF_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	transportMaxWeapons = 3;
	transportMaxMagazines = 18;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_British_ACU'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};	
};

class DZ_CivilBackpack_EP1: Bag_Base_EP1    
{
	scope = 2;
	displayName = "Czech Backpack";
	picture = "\ca\weapons_e\data\icons\backpack_ACR_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	mapsize = 2;
	model = "\ca\weapons_e\AmmoBoxes\backpack_acr.p3d";
	transportMaxWeapons = 4;
	transportMaxMagazines = 24;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_CivilBackpack_EP1'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};	
};

class DZ_Backpack_EP1: Bag_Base_EP1
{
	scope = 2;
	displayName = "Backpack (coyote)";
	picture = "\ca\weapons_e\data\icons\backpack_US_CA.paa";
	icon = "\ca\weapons_e\data\icons\mapIcon_backpack_CA.paa";
	mapsize = 2;
	model = "\ca\weapons_e\AmmoBoxes\backpack_us.p3d";
	transportMaxWeapons = 6;
	transportMaxMagazines = 24;
	class eventHandlers
	{
		init="[(_this select 0),'CfgVehicles','DZ_Backpack_EP1'] execVM '\z\addons\dayz_code\init\object_BackpackAction.sqf';";
	};
};