class CfgWeapons {
	class ItemCore;
	class Crossbow;
	class Rifle;
	class MeleeWeapon : Rifle {
		canDrop = true;
	};
	class PistolCore;	// External class reference
	class Pistol;	// External class reference
	class GrenadeLauncher;  // External class reference
	//class M107;	// External class reference
	//class BAF_AS50_scoped;	// External class reference
	
	#include "CfgWeapons\ItemEtool.hpp"
	#include "CfgWeapons\ItemShovel.hpp"
	
	#include "CfgWeapons\MeleeMachete.hpp"
	#include "CfgWeapons\ItemMachete.hpp"
	#include "CfgWeapons\MeleeHatchet.hpp"
	#include "CfgWeapons\ItemHatchet.hpp"
	#include "CfgWeapons\MeleeCrowbar.hpp"
	#include "CfgWeapons\ItemCrowbar.hpp"
	#include "CfgWeapons\Crossbow.hpp"
	#include "CfgWeapons\MeleeBaseBallBat.hpp"
//	#include "CfgWeapons\MeleeBaseBallBatBarbed.hpp"
//	#include "CfgWeapons\MeleeBaseBallBatNails.hpp"
	
	#include "CfgWeapons\ItemWatch.hpp"
	#include "CfgWeapons\ItemMap.hpp"
	#include "CfgWeapons\ItemMap_Debug.hpp"
	#include "CfgWeapons\ItemCompass.hpp"
	#include "CfgWeapons\Flashlight.hpp"
	#include "CfgWeapons\Flare.hpp"
	
	//Sniper Rifel
	//#include "CfgWeapons\AS50.hpp"
	#include "CfgWeapons\M107.hpp"
	
	//crafting
	#include "CfgCrafting\CfgCrafting.hpp"
	

};