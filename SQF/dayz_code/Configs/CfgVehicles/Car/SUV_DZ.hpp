class SUV_DZ: SUV_Base_EP1 {
	afmax = 200;
	armor = 25;
	scope = 2;
	side = 2;
	crew = "";
	typicalCargo[] = {};
	transportMaxWeapons = 15;
	transportMaxMagazines = 40;
	transportmaxbackpacks = 5;
	armorcrash0[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_01", 0.707946, 1, 200};
	armorcrash1[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_02", 0.707946, 1, 200};
	armorcrash2[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_03", 0.707946, 1, 200};
	armorcrash3[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_04", 0.707946, 1, 200};
	brakedistance = 19;
	buildcrash0[] = {"Ca\sounds\Vehicles\Crash\crash_building_01", 0.707946, 1, 200};
	buildcrash1[] = {"Ca\sounds\Vehicles\Crash\crash_building_02", 0.707946, 1, 200};
	buildcrash2[] = {"Ca\sounds\Vehicles\Crash\crash_building_03", 0.707946, 1, 200};
	buildcrash3[] = {"Ca\sounds\Vehicles\Crash\crash_building_04", 0.707946, 1, 200};
	cargoaction[] = {"SUV_Cargo_EP1", "SUV_Cargo02_EP1", "SUV_Cargo01_EP1", "SUV_Cargo02_EP1", "SUV_Cargo01_EP1"};
	damageresistance = 0.00635;
	displayname = "SUV_DZ";
	driveraction = "SUV_Driver_EP1";
	enablegps = 1;
	expansion = 1;
	fuelcapacity = 130;
	hiddenselections[] = {"camo"};
	hiddenselectionstextures[] = {"ca\wheeled_e\suv\data\suv_body_co.paa"};
	htmax = 1800;
	htmin = 60;
	icon = "\CA\wheeled_e\Data\UI\Icon_suv_CA.paa";
	insidesoundcoef = 0.8;
	magazines[] = {};
	mapsize = 7;
	maxspeed = 230;
	mfact = 0;
	mfmax = 100;
	model = "\ca\wheeled_e\SUV\SUV.p3d";
	outsidesoundfilter = 1;
	picture = "\CA\wheeled_e\Data\UI\Picture_suv_CA.paa";
	soundarmorcrash[] = {"ArmorCrash0", 0.25, "ArmorCrash1", 0.25, "ArmorCrash2", 0.25, "ArmorCrash3", 0.25};
	soundbuildingcrash[] = {"buildCrash0", 0.25, "buildCrash1", 0.25, "buildCrash2", 0.25, "buildCrash3", 0.25};
	soundengineoffext[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_stop", 0.177828, 1, 100};
	soundengineoffint[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_stop", 0.177828, 1};
	soundengineonext[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_start", 0.177828, 1, 100};
	soundengineonint[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_start", 0.177828, 1};
	soundgear[] = {"", "5.62341e-005", 1};
	soundgetin[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", 0.562341, 1};
	soundgetout[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", 0.562341, 1, 20};
	soundwoodcrash[] = {"woodCrash0", 0.166, "woodCrash1", 0.166, "woodCrash2", 0.166, "woodCrash3", 0.166, "woodCrash4", 0.166, "woodCrash5", 0.166};
	tbody = 0;
	transportsoldier = 5;
	weapons[] = {"MiniCarHorn"};
	woodcrash0[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_01", 0.707946, 1, 200};
	woodcrash1[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_02", 0.707946, 1, 200};
	woodcrash2[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_03", 0.707946, 1, 200};
	woodcrash3[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_04", 0.707946, 1, 200};
	woodcrash4[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_05", 0.707946, 1, 200};
	woodcrash5[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_06", 0.707946, 1, 200};
	class Library {
		libtextdesc = "A SUV (sport utility vehicle) is a generic marketing term for a vehicle similar to a station wagon, but built on a light-truck chassis. In this case, this SUV is, in fact, a limousine.";
	};
	class Turrets {
	};
	class SoundEvents {
		class AccelerationIn {
			expression = "(engineOn*(1-camPos))*gmeterZ";
			limit = 0.4;
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_accelerate_3_x", 0.562341, 1};
		};
		class AccelerationOut {
			expression = "(engineOn*camPos)*gmeterZ";
			limit = 0.4;
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_accelerate_3", 0.562341, 1, 200};
		};
	};
	class Sounds {
		class Engine {
			frequency = "(randomizer*0.05+0.95)*rpm";
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_low", 0.177828, 1.4, 100};
			volume = "camPos*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.5]))";
		};
		class EngineHighOut {
			frequency = "(randomizer*0.05+0.95)*rpm";
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_high", 1, 0.8, 300};
			volume = "camPos*engineOn*(rpm factor[0.5, 0.8])";
		};
		class IdleOut {
			frequency = 1;
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_idle", 0.562341, 1, 100};
			volume = "engineOn*camPos*(rpm factor[0.4, 0])";
		};
		class TiresRockOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-rock2", 0.316228, 1, 30};
			volume = "camPos*rock*(speed factor[2, 20])";
		};
		class TiresSandOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-sand2", 0.316228, 1, 30};
			volume = "camPos*sand*(speed factor[2, 20])";
		};
		class TiresGrassOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-grass2", 0.316228, 1, 30};
			volume = "camPos*grass*(speed factor[2, 20])";
		};
		class TiresMudOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-mud2", 0.316228, 1, 30};
			volume = "camPos*mud*(speed factor[2, 20])";
		};
		class TiresGravelOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-gravel2", 0.316228, 1, 30};
			volume = "camPos*gravel*(speed factor[2, 20])";
		};
		class TiresAsphaltOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-asphalt3", 0.316228, 1, 30};
			volume = "camPos*asphalt*(speed factor[2, 20])";
		};
		class NoiseOut {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\ext\noise2", 0.1, 1, 30};
			volume = "camPos*(damper0 max 0.03)*(speed factor[0, 8])";
		};
		class EngineLowIn {
			frequency = "(randomizer*0.05+0.95)*rpm";
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_low_x", 0.316228, 1.4};
			volume = "(1-camPos)*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.45]))";
		};
		class EngineHighIn {
			frequency = "(randomizer*0.05+0.95)*rpm";
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_high_x", 1, 0.8};
			volume = "(1-camPos)*engineOn*(rpm factor[0.5, 0.8])";
		};
		class IdleIn {
			frequency = 1;
			sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_idle_x", 0.316228, 1};
			volume = "engineOn*(rpm factor[0.4, 0])*(1-camPos)";
		};
		class TiresRockIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-rock2", 0.316228, 1};
			volume = "(1-camPos)*rock*(speed factor[2, 20])";
		};
		class TiresSandIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-sand2", 0.316228, 1};
			volume = "(1-camPos)*sand*(speed factor[2, 20])";
		};
		class TiresGrassIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-grass2", 0.316228, 1};
			volume = "(1-camPos)*grass*(speed factor[2, 20])";
		};
		class TiresMudIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-mud2", 0.316228, 1};
			volume = "(1-camPos)*mud*(speed factor[2, 20])";
		};
		class TiresGravelIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-gravel2", 0.316228, 1};
			volume = "(1-camPos)*gravel*(speed factor[2, 20])";
		};
		class TiresAsphaltIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-asphalt3", 0.316228, 1};
			volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
		};
		class NoiseIn {
			frequency = 1;
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\int\noise2", 0.177828, 1};
			volume = "(damper0 max 0.03)*(speed factor[0, 8])*(1-camPos)";
		};
		class Movement {
			frequency = 1;
			sound = "soundEnviron";
			volume = 0;
		};
	};
	class HitPoints {
		class HitLFWheel {
			armor = 0.15;
			material = -1;
			name = "wheel_1_1_steering";
			passthrough = 0.3;
			visual = "";
		};
		class HitLBWheel {
			armor = 0.15;
			material = -1;
			name = "wheel_1_2_steering";
			passthrough = 0.3;
			visual = "";
		};
		class HitRFWheel {
			armor = 0.15;
			material = -1;
			name = "wheel_2_1_steering";
			passthrough = 0.3;
			visual = "";
		};
		class HitRBWheel {
			armor = 0.15;
			material = -1;
			name = "wheel_2_2_steering";
			passthrough = 0.3;
			visual = "";
		};
		class HitFuel {
			armor = 0.14;
			material = -1;
			name = "palivo";
			passthrough = 1;
			visual = "";
		};
		class HitEngine {
			armor = 0.5;
			material = -1;
			name = "motor";
			passthrough = 1;
			visual = "";
		};
		class HitGlass1 {
			armor = 0.1;
			material = -1;
			name = "glass1";
			passthrough = 0;
			visual = "glass1";
		};
		class HitGlass2 {
			armor = 0.1;
			material = -1;
			name = "glass2";
			passthrough = 0;
			visual = "glass2";
		};
		class HitGlass3 {
			armor = 0.1;
			material = -1;
			name = "glass3";
			passthrough = 0;
			visual = "glass3";
		};
		class HitGlass4 {
			armor = 0.1;
			material = -1;
			name = "glass4";
			passthrough = 0;
			visual = "glass4";
		};
	};
	class Damage {
		mat[] = {"Ca\wheeled_E\SUV\data\SUV_body.rvmat", "Ca\wheeled_E\SUV\data\SUV_body_damage.rvmat", "Ca\wheeled_E\SUV\data\SUV_body_destruct.rvmat", "Ca\wheeled_E\SUV\data\SUV_chrom.rvmat", "Ca\wheeled_E\SUV\data\SUV_chrom_damage.rvmat", "Ca\wheeled_E\SUV\data\SUV_chrom_destruct.rvmat", "Ca\wheeled_E\SUV\data\SUV_glass.rvmat", "Ca\wheeled_E\SUV\data\SUV_glass_damage.rvmat", "Ca\wheeled_E\SUV\data\SUV_glass_destruct.rvmat", "Ca\Ca_E\data\default.rvmat", "Ca\Ca_E\data\default.rvmat", "Ca\Ca_E\data\default_destruct.rvmat"};
		tex[] = {};
	};
};