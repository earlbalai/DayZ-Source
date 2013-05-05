class CfgVehicles {
	class AllVehicles;
	class Air : AllVehicles 
	{
		class NewTurret;
		class ViewPilot;
		class AnimationSources;
	};
	class Helicopter : Air 
	{
		class HitPoints; 
		class Turrets
        {
            class MainTurret: NewTurret
            {
                class Turrets;
				class ViewOptics;
            };
        };
	};
	
	//External Class
	class SkodaBase;
	class ATV_Base_EP1;
	class RubberBoat;
	class UAZ_Unarmed_Base;
	class HMMWV_Base;
	class AH6_Base_EP1;
	class An2_Base_EP1;
	class TT650_Base;
	class V3S_Base;
	class Bag_Base_EP1;
	class Bag_Base_BAF;
	class House {
		class DestructionEffects;
	};
	class SpawnableWreck : House {};
	class Strategic;
	class NonStrategic;

	#include "CfgVehicles\RepairParts.hpp" //names for all reapir parts. Needs moving to hitpoints
	//ZEDS
	#include "CfgVehicles\Zeds.hpp" //old type zeds
	#include "CfgVehicles\NewZeds.hpp" //new type zeds
	//Survivor Skins	
	#include "CfgVehicles\Skins.hpp"
	//Bags
	#include "CfgVehicles\Bags.hpp"
	//Includes all DayZ Vehilces
	//Car's
	#include "CfgVehicles\Car\HMMWV.hpp"
	#include "CfgVehicles\Car\CAR_HATCHBACK.hpp"
	#include "CfgVehicles\Car\UAZ_CDF.hpp"
	#include "CfgVehicles\Car\CAR_SEDAN.hpp"
	#include "CfgVehicles\Car\V3S_Civ.hpp"
	//Helicopter's
	#include "CfgVehicles\Helicopter\MI17.hpp"
	#include "CfgVehicles\Helicopter\UH1H.hpp"
	#include "CfgVehicles\Helicopter\AH6X.hpp"
	#include "CfgVehicles\Helicopter\MH6J_DZ.hpp"
	//Wreck's
	#include "CfgVehicles\Helicopter\MI8Wreck.hpp"
	#include "CfgVehicles\Helicopter\UH1Wreck.hpp"
	#include "CfgVehicles\Helicopter\UH60Wreck.hpp"
	//Plane's
	#include "CfgVehicles\Plane\AN2_DZ.hpp"
	//Bikes
	#include "CfgVehicles\Bikes\ATV_US_EP1.hpp"
	#include "CfgVehicles\Bikes\ATV_CZ_EP1.hpp"
	#include "CfgVehicles\Bikes\TT650_Ins.hpp"
	//Boat
	#include "CfgVehicles\Boat\PBX.hpp"
		
	class Land_Fire;
	class Land_Fire_DZ : Land_Fire {
		transportMaxMagazines = 1;
		transportMaxWeapons = 0;
		transportMaxBackpacks = 0;
		};
	class Animal;
	class Pastor;
	class Fin;
	class DZAnimal: Animal
	{
		scope = 0;
		side = 1;
		accuracy = 0.25;
		boneHead = "head";
		bonePrimaryWeapon = "head";
		triggerAnim = "";
		picture = "";
		icon = "\Ca\animals2\data\mapicon_animals_ca.paa";
		mapSize = 10;
		weaponSlots = 0;
		fsmFormation = "";
		fsmDanger = "";
		agentTasks[] = {};
		moves = "CfgMovesAnimal";
		memoryPointHeadAxis = "head_axis";
		woman = 0;
		faceType = "Default";
		boneLEye = "l_eye";
		boneREye = "r_eye";
		boneLEyelidUp = "eye_upl";
		boneREyelidUp = "eye_upr";
		boneLEyelidDown = "eye_lwl";
		boneREyelidDown = "eye_lwr";
		boneLPupil = "l_pupila";
		boneRPupil = "r_pupila";
		memoryPointAim = "aimPoint";
		memoryPointCameraTarget = "camera";
		extCameraPosition[] = {0,0.5,-2.5};
		class EventHandlers{};
		class Wounds
		{
			tex[] = {};
			mat[] = {};
		};
		class VariablesScalar {};
		class VariablesString {};
	};
	class DZ_Pastor : Pastor {
		scope = 2;
		side = 1;
		model = "\ca\animals2\Dogs\Pastor\Pastor";
		displayName = "Alsatian";
		moves = "CfgMovesDogDZ";
		gestures = "CfgGesturesDogDZ";
		fsmDanger = "";
		fsmFormation = "";
		agentTasks[] = {};
		woman = 0;
		class EventHandlers{};
		class Wounds
		{
			tex[] = {};
			mat[] = {};
		};
		class VariablesScalar {};
		class VariablesString {};
	};
	
	class DZ_Fin : Fin {
		scope = 2;
		model = "\ca\animals2\Dogs\Fin\Fin";
		displayName = "Fin";
		moves = "CfgMovesDogDZ";
		gestures = "CfgGesturesDogDZ";
		fsmDanger = "";
		fsmFormation = "";
	};
	
	// This parent class is made to make referring to these objects easier later with allMissionObjects
	
	class HouseDZ: House {
		class MarkerLights
		{
			class RedBlinking
			{
				name = "";
				color[] = {0,0.0,0,0};
				ambient[] = {0,0,0,0};
				brightness = 0;
				blinking = "false";
			};
		};
		class Reflectors
		{
			class MainLight
			{
				color[] = {0,0.0,0,0};
				ambient[] = {0,0,0,0};
				brightness = 0;
				position = "";
				direction = "";
				hitpoint = "";
				selection = "";
				size = 0;
				period[] = {0,1};
			};
		};
	};
	//Buildings
	#include "CfgVehicles\Buildings\Land_A_Crane_02b.hpp"
	#include "CfgVehicles\Buildings\Land_A_FuelStation_Feed.hpp"
	#include "CfgVehicles\Buildings\Land_A_TVTower_Mid.hpp"
	#include "CfgVehicles\Buildings\Land_A_TVTower_Top.hpp"
	#include "CfgVehicles\Buildings\Land_Farm_WTower.hpp"
	#include "CfgVehicles\Buildings\Land_HouseB_Tenement.hpp"
	#include "CfgVehicles\Buildings\Land_Ind_MalyKomin.hpp"
	#include "CfgVehicles\Buildings\Land_komin.hpp"
	#include "CfgVehicles\Buildings\Land_majak.hpp"
	#include "CfgVehicles\Buildings\Land_Mil_ControlTower.hpp"
	#include "CfgVehicles\Buildings\Land_NAV_Lighthouse.hpp"
	#include "CfgVehicles\Buildings\Land_NavigLight.hpp"
	#include "CfgVehicles\Buildings\Land_Rail_Semafor.hpp"
	#include "CfgVehicles\Buildings\Land_Rail_Zavora.hpp"
	#include "CfgVehicles\Buildings\Land_runway_edgelight.hpp"
	#include "CfgVehicles\Buildings\Land_Stoplight.hpp"
	#include "CfgVehicles\Buildings\Land_telek1.hpp"
	#include "CfgVehicles\Buildings\Land_VASICore.hpp"
	#include "CfgVehicles\Buildings\Land_Vysilac_FM.hpp"
	//WeaponHolder
	#include "CfgVehicles\WeaponHolder.hpp"	
};
class CfgNonAIVehicles {
	#include "CfgVehicles\StreetLamps.hpp"
};