class Land_A_tent;
class StashSmall : Land_A_tent {
	armor = 5;
	displayname = "Stash";
	icon = "\Ca\misc3\data\Icons\icon_Atent_ca.paa";
	mapsize = 3;
	model = "\z\addons\dayz_communityassets\models\dirt_stash.p3d";
	scope = 2;
	vehicleClass = "Survival";
	transportMaxMagazines = 12;
	transportMaxWeapons = 0;
	transportMaxBackpacks = 0;
};

//class House;
class StashMedium : Land_A_tent {
	armor = 50;
	displayname = "Stash Medium";
	icon = "\Ca\misc3\data\Icons\icon_Atent_ca.paa";
	mapsize = 3;
	model = "\z\addons\dayz_communityassets\models\dirt_stash_reinforced.p3d";
	scope = 2;
	vehicleClass = "Survival";
	transportMaxMagazines = 25;
	transportMaxWeapons = 1;
	transportMaxBackpacks = 0;
};

class DomeTentStorage : Land_A_tent {
	vehicleClass = "Survival";
	transportMaxMagazines = 35;
	transportMaxWeapons = 15;
	transportMaxBackpacks = 0;
};