class WeaponHolderBase;
class WoodenArrowF : WeaponHolderBase {
	scope = public;
	displayName = "WoodenArrowF";
	model = "\dayz_weapons\models\bolt";
	
	class eventHandlers 
	{
		init = "[(_this select 0),'cfgMagazines','WoodenArrow'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};	
class WeaponHolder_ItemCrowbar: WeaponHolderBase
{
	scope=2;
	displayName="Crowbar";
	model="\dayz_equip\models\crowbar.p3d";
	class eventHandlers
	{
		init="[(_this select 0),'cfgWeapons','ItemCrowbar'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};
class WeaponHolder_MeleeBaseBallBat: WeaponHolderBase
{
	scope=2;
	displayName="BaseBallBat";
	model="\z\addons\dayz_communityassets\models\baseball_bat.p3d";
	class eventHandlers
	{
		init="[(_this select 0),'cfgWeapons','MeleeBaseBallBat'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};
class WeaponHolder_MeleeBatBarbed: WeaponHolderBase
{
	scope=2;
	displayName="BaseBallBatBarbed";
	model="\z\addons\dayz_communityassets\models\baseball_bat.p3d";
	class eventHandlers
	{
		init="[(_this select 0),'cfgWeapons','MeleeBaseBallBatBarbed'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};
class WeaponHolder_MeleeBaseBallBatNails: WeaponHolderBase
{
	scope=2;
	displayName="MeleeBaseBallBatNails";
	model="\z\addons\dayz_communityassets\models\baseball_bat_nails.p3d";
	class eventHandlers
	{
		init="[(_this select 0),'cfgWeapons','MeleeBaseBallBatNails'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};	
class WeaponHolder_MeleeMachete: WeaponHolderBase
{
	scope=2;
	displayName="Machete";
	model="\z\addons\dayz_communityassets\models\machete.p3d";
	class eventHandlers
	{
		init="[(_this select 0),'cfgWeapons','MeleeMachete'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};
class WeaponHolder_ItemFuelcanEmpty : WeaponHolderBase {
	scope = public;
	displayName = "5L Fuelcan Empty";
	model = "z\addons\dayz_communityassets\models\fuelcan.p3d";
	
	class eventHandlers {
		init = "[(_this select 0),'cfgMagazines','ItemFuelcanEmpty'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};
class WeaponHolder_ItemFuelcan : WeaponHolderBase {
	scope = public;
	displayName = "5L Fuelcan Full";
	model = "z\addons\dayz_communityassets\models\fuelcan.p3d";
	
	class eventHandlers {
		init = "[(_this select 0),'cfgMagazines','ItemFuelcan'] execVM '\z\addons\dayz_code\init\object_pickupAction.sqf';";
	};
};
