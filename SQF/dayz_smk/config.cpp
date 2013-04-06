class CfgPatches 
{
	class smk_anims_lite
	{
		units[] = { };
		weapons[] = { };
		requiredVersion = 0.100000;
		requiredAddons[] = {
				"CA_Anims", "CA_Anims_E", "CA_Anims_Sdr", "CA_Anims_E_Sdr", "CAWeapons", "CAWeapons_E", "CAWeapons_BAF"
		};
	};
};

class CfgMovesBasic 
{
	access = 1;
	skeletonName = "";
	collisionVertexPattern[] = {
			"1a", "2a", "3a", "4a", "5a", "6a", "7a", "8a", "9a", "10a", "11a", "12a", "13a", "14a", "15a", "16a", "17a", "18a", "19a", "20a", "21a", "22a", "23a", "24a", "25a", "26a", "27a", "28a", "29a", "30a", "31a", "32a", "33a", "34a", "1c", "2c", "3c", "4c", "5c", "6c", "7c", "8c"
	};
	collisionGeomCompPattern[] = {
			1, 3
	};

	class Default ;

	class StandBase : Default
	{
	};

	class DefaultDie : Default
	{
	};

	class ManActions ;

	class Actions 
	{

		class NoActions : ManActions
		{
			gestureHiB[] = {
					"WeaponGLMagazineReloadStand", "Gesture"
			};
			gestureHiC[] = {
					"WeaponMGMagazineReloadStand", "Gesture"
			};
		};

		class DeadActions : NoActions
		{
		};

		class CargoActions : NoActions
		{
		};

		class RifleBaseLowStandActions : NoActions
		{
			gestureHiB[] = {
					"WeaponGLMagazineReloadStand", "Gesture"
			};
			handGunOn = "AmovPercMstpSrasWpstDnon";
			leanRRot = 0.500000;
			leanRShift = 0.010000;
			leanLRot = 0.500000;
			leanLShift = 0.010000;
		};

		class RifleBaseStandActions : RifleBaseLowStandActions
		{
			handGunOn = "AmovPercMstpSrasWpstDnon";
			fastL = "smk_SpecStandLeft";
			fastR = "smk_SpecStandRight";
			fastB = "smk_SpecStandUp";
			fastLB = "smk_SpecStandTaunt";
			fastRB = "smk_SpecStandDown";
		};

		class RifleStandActions : RifleBaseStandActions
		{
		};

		class RifleStandActionsWlkF : RifleStandActions
		{
		};

		class RifleStandActionsRunF : RifleStandActions
		{
			getOver = "smk_JumpOver";
		};

		class RifleStandEvasiveActions : RifleStandActions
		{
			getOver = "smk_JumpOver";
			PlayerCrouch = "smk_SprintSlide_End";
		};

		class RifleKneelActions : RifleBaseStandActions
		{
			fastL = "smk_SpecCrouchLeft";
			fastR = "smk_SpecCrouchRight";
			fastRB = "smk_SpecCrouchDown";
			fastLB = "smk_SpecCrouchTaunt";
			fastB = "smk_SpecCrouchUp";
			getOver = "AmovPknlMstpSrasWrflDnon_Sit";
		};

		class RifleKneelEvasiveActions : RifleStandEvasiveActions
		{
			getOver = "smk_JumpOver";
			PlayerCrouch = "smk_SprintSlide";
		};

		class RifleSprintSlideActions : RifleKneelActions
		{
			stop = "smk_SprintSlide_End";
			default = "smk_SprintSlide_End";
		};

		class RifleSitKneelActions : CargoActions
		{
			stop = "AmovPknlMstpSrasWrflDnon_Sit";
			default = "AmovPknlMstpSrasWrflDnon_Sit";
			PlayerCrouch = "AmovPknlMstpSrasWrflDnon";
			PlayerStand = "AmovPercMstpSrasWrflDnon";
			PlayerProne = "AmovPpneMstpSrasWrflDnon";
			slowF = "AmovPknlMstpSrasWrflDnon";
			walkF = "AmovPknlMstpSrasWrflDnon";
			reloadMagazine[] = {
					"WeaponMagazineReloadStand", "Gesture"
			};
			gestureHiB[] = {
					"WeaponGLMagazineReloadStand", "Gesture"
			};
		};

		class RifleProneActions : RifleBaseStandActions
		{
			fastL = "smk_UrbanProneLeft";
			fastR = "smk_UrbanProneRight";
			gestureHiB = "WeaponMagazineReloadProne";
			gestureHiC = "WeaponMGMagazineReloadProne";
		};

		class RifleActions_Panic : CargoActions
		{
			default = "smk_PanicTakeCoverStat";
			reloadMagazine[] = {
					"WeaponMagazineReloadStand", "Gesture"
			};
			gestureHiB[] = {
					"WeaponGLMagazineReloadStand", "Gesture"
			};
			die = "AdthPpneMstpSrasWrflDnon_1";
			PlayerProne = "smk_UrbanProne_Left_to_Prone";
			PlayerCrouch = "smk_PanicTakeCoverUP";
		};

		class RifleActions_PanicComeback : RifleProneActions
		{
			stop = "";
			default = "";
			PlayerProne = "AmovPpneSrasWrflDnon";
		};

		class RifleActions_UPL : CargoActions
		{
			stop = "smk_UrbanProneLeft";
			default = "smk_UrbanProneLeft";
			reloadMagazine[] = {
					"WeaponMagazineReloadStand", "Gesture"
			};
			gestureHiB[] = {
					"WeaponGLMagazineReloadStand", "Gesture"
			};
			die = "AdthPpneMstpSrasWrflDnon_1";
			PlayerProne = "smk_UrbanProne_Left_to_Prone";
			PlayerCrouch = "AmovPknlMstpSrasWrflDnon";
			PlayerStand = "AmovPercMstpSrasWrflDnon";
			walkF = "smk_UrbanProneLeftUp";
			slowF = "smk_UrbanProneLeftUp";
			fastL = "smk_UrbanProneLeftBlind";
			slowL = "smk_UrbanProneLeftL";
			walkL = "smk_UrbanProneLeftL";
			slowR = "smk_UrbanProneLeftR";
			walkR = "smk_UrbanProneLeftR";
			fastR = "smk_UrbanProneRight";
		};

		class RifleActions_UPR : CargoActions
		{
			stop = "smk_UrbanProneRight";
			default = "smk_UrbanProneRight";
			reloadMagazine[] = {
					"WeaponMagazineReloadStand", "Gesture"
			};
			gestureHiB[] = {
					"WeaponGLMagazineReloadStand", "Gesture"
			};
			die = "AdthPpneMstpSrasWrflDnon_1";
			PlayerProne = "smk_UrbanProne_Right_to_Prone";
			PlayerCrouch = "AmovPknlMstpSrasWrflDnon";
			PlayerStand = "AmovPercMstpSrasWrflDnon";
			slowL = "smk_UrbanProneRightL";
			walkF = "smk_UrbanProneRightUp";
			slowF = "smk_UrbanProneRightUp";
			fastF = "smk_UrbanProneRightTop";
			walkL = "smk_UrbanProneRightL";
			slowR = "smk_UrbanProneRightR";
			walkR = "smk_UrbanProneRightR";
			fastL = "smk_UrbanProneLeft";
			fastR = "smk_UrbanProneRightBlind";
		};

		class RifleProneActions_Slide : CargoActions
		{
			stop = "";
			default = "";
			PlayerCrouch = "AmovPknlSrasWrflDnon";
		};
	};
};

class CfgMovesMaleSdr : CfgMovesBasic
{
	skeletonName = "OFP2_ManSkeleton";
	gestures = "CfgGesturesMale";

	class States 
	{

		class DeadState : Default
		{
		};

		class AmovPercMstpSlowWrflDnon : StandBase
		{
		};

		class AmovPercMstpSrasWrflDnon : AmovPercMstpSlowWrflDnon
		{
			visibleSize = 0.700121;
			actions = "RifleStandActions";
			duty = -0.700000;
			showWeaponAim = 1;
			disableWeapons = 0;
			disableWeaponsLong = 0;
			aiming = "aimingDefault";
			aimingBody = "aimingUpDefault";
			aimPrecision = 1;
			weaponIK = 1;
			canPullTrigger = 1;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			ConnectTo[] = {
					"AidlPercMstpSrasWrflDnon_aiming0S", 0.020000, "AovrPercMstpSrasWrflDf", 0.010000, "AmovPercMwlkSrasWrflDnon_transition", 0.020000, "AmovPercMstpSrasWrflDnon_turnL", 0.020000, "AmovPercMstpSrasWrflDnon_turnR", 0.020000, "WeaponMagazineReloadStand", 0.100000, "amovpercmstpsraswrfldnon_amovpercmstpsraswlnrdnon", 0.010000, "AmovPercMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon", 0.010000, "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon", 0.020000, "AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon", 0.020000, "AwopPercMstpSgthWrflDnon_Start2", 0.100000, "AswmPercMstpSnonWnonDnon", 0.300000, "AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon", 0.020000, "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1", 0.010000, "ActsPercMstpSnonWpstDnon_sceneBardakRifle01", 0.100000, "adthpercmstpsraswrfldnon_NikitinDead", 0.010000, "ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_zevl1", 0.010000, "ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_zevl2", 0.010000, "ActsPercMstpSrasWunaDnon_sceneLopotevBandCaptured_Bardak", 10.000000, "ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_Lopotev", 0.010000, "ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_Miles", 0.010000, "ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_Nameless", 0.010000, "ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_Nikitin", 0.010000, "smk_PanicTakeCoverH", 0.020000, 
			};
			InterpolateTo[] = {
					"smk_SprintSlide", 0.020000, "AmovPercMstpSrasWrflDnon_turnL", 0.020000, "AmovPercMstpSrasWrflDnon_turnR", 0.020000, "AmovPercMwlkSrasWrflDf", 0.020000, "AmovPercMwlkSrasWrflDfl", 0.020000, "AmovPercMwlkSrasWrflDl", 0.020000, "AmovPercMwlkSrasWrflDbl", 0.020000, "AmovPercMwlkSrasWrflDb", 0.020000, "AmovPercMwlkSrasWrflDbr", 0.020000, "AmovPercMwlkSrasWrflDr", 0.020000, "AmovPercMwlkSrasWrflDfr", 0.020000, "AmovPercMrunSrasWrflDf", 0.020000, "AmovPercMrunSrasWrflDfl", 0.020000, "AmovPercMrunSrasWrflDl", 0.020000, "AmovPercMrunSrasWrflDbl", 0.020000, "AmovPercMrunSrasWrflDb", 0.020000, "AmovPercMrunSrasWrflDbr", 0.020000, "AmovPercMrunSrasWrflDr", 0.020000, "AmovPercMrunSrasWrflDfr", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon", 0.020000, "AmovPercMevaSrasWrflDf", 0.020000, "AmovPercMevaSrasWrflDfl", 0.020000, "AmovPercMevaSrasWrflDfr", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPercMevaSrasWrflDl", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPercMevaSrasWrflDr", 0.020000, "AmovPercMstpSrasWrflDnon_AmovPercMevaSrasWrflDb", 0.020000, "AdthPercMstpSrasWrflDnon_1", 0.010000, "AdthPercMstpSrasWrflDnon_2", 0.010000, "AdthPercMstpSrasWrflDnon_4", 0.010000, "AdthPercMstpSrasWrflDnon_8", 0.010000, "AdthPercMstpSrasWrflDnon_rS0", 0.010000, "AidlPercMstpSrasWrflDnon0S", 0.020000, "AidlPercMstpSrasWrflDnon", 0.010000, "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1", 0.010000, "AdthPercMstpSrasWrflDnon_16", 0.010000, "AdthPercMstpSrasWrflDnon_32", 0.010000, "adthpercmstpsraswrfldnon_NikitinDead", 0.010000, "smk_SpecStandRight", 0.020000, "smk_SpecStandLeft", 0.020000, "smk_SpecStandUP", 0.020000, "smk_SpecStandDown", 0.020000, "smk_SpecStandTaunt", 0.020000
			};
		};

		class smk_SpecStandRight : AmovPercMstpSlowWrflDnon
		{
			visibleSize = 0.700121;
			actions = "RifleStandActions";
			duty = 0;
			file = "\z\addons\dayz_smk\anims\special\smk_StandRight.rtm";
			collisionShape = "ca\Anims\Characters\data\Geom\Sdr\Perc_Wrfl.p3d";
			showWeaponAim = 0;
			disableWeapons = 0;
			disableWeaponsLong = 0;
			aiming = "aimingDefault";
			aimingBody = "aimingUpDefault";
			relSpeedMax = 1.100000;
			relSpeedMin = 0.700001;
			aimPrecision = 3.500000;
			weaponIK = 1;
			headBobMode = 5;
			headBobStrength = -1;
			enableOptics = 0;
			canPullTrigger = 1;
			interpolationSpeed = 1.300000;
			ConnectTo[] = { };
			InterpolateTo[] = {
					"AmovPercMstpSrasWrflDnon", 0.010000
			};
		};

		class smk_SpecStandLeft : smk_SpecStandRight
		{
			file = "z\addons\dayz_smk\anims\special\smk_StandLeft.rtm";
			weaponIK = 1;
			aimPrecision = 5.200000;
			leftHandIKCurve[] = {
					0
			};
			leftHandIKBeg = 0;
			leftHandIKEnd = 0;
			interpolationSpeed = 0.700000;
			duty = 0.100000;
		};

		class smk_SpecStandUp : smk_SpecStandRight
		{
			duty = 0;
			file = "\z\addons\dayz_smk\anims\special\smk_StandUp.rtm";
			aimPrecision = 4.700000;
			interpolationSpeed = 1.200000;
			weaponIK = 1;
		};

		class smk_SpecStandDown : smk_SpecStandRight
		{
			duty = 0.150000;
			leftHandIKBeg = 0;
			leftHandIKCurve[] = {
					0
			};
			leftHandIKEnd = 0;
			file = "\z\addons\dayz_smk\anims\special\smk_StandDown.rtm";
			aimPrecision = 4.700000;
			disableWeapons = 1;
			interpolationSpeed = 0.900000;
			weaponIK = 1;
		};

		class smk_SpecStandTaunt : smk_SpecStandDown
		{
			duty = 0;
			file = "\z\addons\dayz_smk\anims\special\smk_StandTaunt.rtm";
			interpolationSpeed = 2;
		};

		class smk_HandsBase : AmovPercMstpSrasWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\smk_HandsBase.rtm";
		};

		class AwopPercMstpSgthWrflDnon_Start1 : Default
		{
			actions = "RifleLowStandActions";
			file = "\z\addons\dayz_smk\anims\smk_CombatStand_GrenadeThrowStart.rtm";
			rightHandIKCurve[] = {
					0.100000, 1, 0.200000, 0
			};
			leftHandIKCurve[] = {
					0
			};
			speed = 1.500000;
			looped = 0;
			soundEnabled = 0;
			duty = 0.600000;
			canPullTrigger = 0;
			headBobMode = 2;
			ConnectTo[] = {
					"AwopPercMstpSgthWrflDnon_Throw1", 0.100000
			};
			InterpolateTo[] = {
					"AdthPercMstpSlowWrflDnon_1", 0.010000
			};
			leaningFactorBeg = 0.750000;
			leaningFactorEnd = 0.750000;
		};

		class AwopPercMstpSgthWrflDnon_Throw1 : AwopPercMstpSgthWrflDnon_Start1
		{
			file = "\z\addons\dayz_smk\anims\smk_CombatStand_GrenadeThrowThrow.rtm";
			rightHandIKCurve[] = {
					0
			};
			leftHandIKCurve[] = {
					0
			};
			speed = 3.510000;
			canPullTrigger = 0;
			ConnectTo[] = {
					"AwopPercMstpSgthWrflDnon_End1", 0.100000
			};
			InterpolateTo[] = {
					"AdthPercMstpSlowWrflDnon_1", 0.010000
			};
		};

		class AwopPercMstpSgthWrflDnon_End1 : AwopPercMstpSgthWrflDnon_Start1
		{
			file = "\z\addons\dayz_smk\anims\smk_CombatStand_GrenadeThrowEnd.rtm";
			speed = 1.110000;
			rightHandIKCurve[] = {
					0.200000, 0, 0.300000, 1
			};
			leftHandIKCurve[] = {
					0.300000, 0, 0.400000, 1
			};
			showItemInRightHand = 0;
			canPullTrigger = 0;
			ConnectTo[] = {
					"AmovPercMstpSlowWrflDnon", 0.100000
			};
			InterpolateTo[] = {
					"AdthPercMstpSlowWrflDnon_1", 0.010000
			};
		};

		class AwopPknlMstpSgthWrflDnon_Start : Default
		{
			actions = "RifleKneelActions";
			file = "\z\addons\dayz_smk\anims\smk_CombatCrouch_GrenadeThrowStart.rtm";
			speed = 0.870000;
			looped = 0;
			soundEnabled = 0;
			leaningFactorBeg = 0.750000;
			leaningFactorEnd = 0.750000;
			duty = 0.600000;
			collisionShape = "ca\Anims\Characters\Data\Geom\Sdr\Pknl_Wrfl.p3d";
			headBobMode = 2;
			ConnectTo[] = {
					"AwopPknlMstpSgthWrflDnon_Throw", 0.100000
			};
			InterpolateTo[] = {
					"AdthPknlMstpSrasWrflDnon_1", 0.010000
			};
		};

		class AwopPknlMstpSgthWrflDnon_Throw : AwopPknlMstpSgthWrflDnon_Start
		{
			file = "\z\addons\dayz_smk\anims\smk_CombatCrouch_GrenadeThrowThrow.rtm";
			speed = 4.330000;
			ConnectTo[] = {
					"AwopPknlMstpSgthWrflDnon_End", 0.100000
			};
			InterpolateTo[] = {
					"AdthPknlMstpSrasWrflDnon_1", 0.010000
			};
		};

		class AwopPknlMstpSgthWrflDnon_End : AwopPknlMstpSgthWrflDnon_Start
		{
			file = "\z\addons\dayz_smk\anims\smk_CombatCrouch_GrenadeThrowEnd.rtm";
			speed = 0.800000;
			ConnectTo[] = {
					"AmovPknlMstpSrasWrflDnon", 0.100000
			};
			InterpolateTo[] = {
					"AdthPknlMstpSrasWrflDnon_1", 0.010000
			};
		};

		class AovrPercMstpSrasWrflDf : AmovPercMstpSrasWrflDnon
		{
			duty = 0.750000;
			speed = 0.600000;
		};

		class smk_JumpOver : AovrPercMstpSrasWrflDf
		{
			variantsAI[] = { };
			looped = 0;
			speed = 0.930000;
			file = "\z\addons\dayz_smk\anims\smk_JumpOver.rtm";
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.050000, 0, 0.900000, 0, 1, 1
			};
			collisionShape = "ca\Anims\Characters\data\Geom\Sdr\Perc_Wovr.p3d";
			relSpeedMin = 0.996672;
			relSpeedMax = 0.996672;
			duty = 0.650000;
			disableWeapons = 1;
			disableWeaponsLong = 1;
			enableOptics = 0;
			limitGunMovement = 0.300000;
			headBobStrength = 0.512438;
			forceAim = 1;
			ConnectTo[] = {
					"AmovPercMstpSrasWrflDnon", 0.500000
			};
			InterpolateTo[] = { };
			interpolationSpeed = 1;
			interpolationRestart = 1;
		};

		class AmovPknlMstpSlowWrflDnon : AmovPercMstpSlowWrflDnon
		{
		};

		class AmovPknlMstpSrasWrflDnon : AmovPknlMstpSlowWrflDnon
		{
			ConnectTo[] = {
					"AidlPknlMstpSlowWrflDnon0S", 0.100000, "AidlPknlMstpSrasWrflDnon_player_0S", 0.100000, "AmovPknlMwlkSrasWrflDnon_transition", 0.020000, "AmovPknlMstpSrasWrflDnon_turnL", 0.020000, "AmovPknlMstpSrasWrflDnon_turnR", 0.020000, "WeaponMagazineReloadKneel", 0.100000, "amovpknlmstpsraswrfldnon_amovpknlmstpslowwrfldnon", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWpstDnon", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWlnrDnon", 0.020000, "AmovPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon", 0.020000, "AwopPknlMstpSgthWrflDnon_Start", 0.100000, "AwopPknlMstpSgthWrflDnon_End", 0.100000, "AidlPknlMstpSrasWrflDnon0S", 0.100000, "AidlPknlMstpSrasWrflDnon01", 0.100000, "AidlPknlMstpSrasWrflDnon02", 0.100000, "AidlPknlMstpSrasWrflDnon03", 0.100000, "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon", 0.020000, "smk_PanicTakeCoverH", 0.020000, "smk_Crouch_To_Sit", 0.020000
			};
			InterpolateTo[] = {
					"AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic", 0.020000, "aidlpknlmstpslowwrfldnon01", 0.100000, "aidlpknlmstpslowwrfldnon03", 0.100000, "aidlpknlmstpslowwrfldnon02", 0.100000, "AidlPknlMstpSlowWrflDnon_i01", 0.010000, "AidlPknlMstpSlowWrflDnon_i02", 0.100000, "AidlPknlMstpSlowWrflDnon_i03", 0.100000, "AidlPknlMstpSlowWrflDnon_i04", 0.100000, "AidlPknlMstpSlowWrflDnon_i05", 0.100000, "AidlPknlMstpSlowWrflDnon_i06", 0.100000, "AidlPknlMstpSlowWrflDnon_i07", 0.100000, "AidlPknlMstpSlowWrflDnon_i08", 0.100000, "AidlPknlMstpSlowWrflDnon_i09", 0.100000, "AidlPknlMstpSlowWrflDnon_i10", 0.100000, "AidlPknlMstpSlowWrflDnon_i11", 0.100000, "AidlPknlMstpSlowWrflDnon_i12", 0.010000, "AidlPknlMstpSlowWrflDnon_i13", 0.100000, "AidlPknlMstpSlowWrflDnon_i14", 0.100000, "AidlPknlMstpSlowWrflDnon_idleSteady01", 0.100000, "AidlPknlMstpSlowWrflDnon_idleSteady02", 0.100000, "AidlPknlMstpSlowWrflDnon_idleSteady03", 0.100000, "AidlPknlMstpSlowWrflDnon_idleSteady04", 0.100000, "AidlPknlMstpSlowWrflDnon_i15", 0.100000, "AmovPknlMstpSrasWrflDnon_AmovPknlMrunSlowWrflDf", 0.010000, "AmovPknlMstpSrasWrflDnon_turnL", 0.020000, "AmovPknlMstpSrasWrflDnon_turnR", 0.020000, "AmovPknlMwlkSrasWrflDf", 0.020000, "AmovPknlMwlkSrasWrflDfl", 0.020000, "AmovPknlMwlkSrasWrflDl", 0.020000, "AmovPknlMwlkSrasWrflDbl", 0.020000, "AmovPknlMwlkSrasWrflDb", 0.020000, "AmovPknlMwlkSrasWrflDbr", 0.020000, "AmovPknlMwlkSrasWrflDr", 0.020000, "AmovPknlMwlkSrasWrflDfr", 0.020000, "AmovPknlMrunSrasWrflDfl", 0.020000, "AmovPknlMrunSrasWrflDl", 0.020000, "AmovPknlMrunSrasWrflDbl", 0.020000, "AmovPknlMrunSrasWrflDb", 0.020000, "AmovPknlMrunSrasWrflDbr", 0.020000, "AmovPknlMrunSrasWrflDr", 0.020000, "AmovPknlMrunSrasWrflDfr", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDl", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr", 0.020000, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDb", 0.020000, "AdthPknlMstpSrasWrflDnon_1", 0.010000, "AdthPknlMstpSrasWrflDnon_2", 0.010000, "AidlPknlMstpSrasWrflDnon0S", 0.020000, "AidlPknlMstpSrasWrflDnon01", 0.020000, "AidlPknlMstpSrasWrflDnon02", 0.020000, "AidlPknlMstpSrasWrflDnon03", 0.020000, "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2", 0.200000, "smk_SpecCrouchRight", 1.500000, "smk_SpecCrouchLeft", 1.500000, "smk_SpecCrouchUp", 1.500000, "smk_SpecCrouchDown", 0.500000
			};
		};

		class smk_SpecCrouchRight : AmovPknlMstpSlowWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\special\smk_CrouchRight.rtm";
			duty = 0.030000;
			collisionShape = "ca\Anims\Characters\data\Geom\Sdr\Pknl_Wrfl.p3d";
			showWeaponAim = 0;
			visibleSize = 0.300122;
			aiming = "aimingDefault";
			aimingBody = "aimingUpDefault";
			actions = "RifleKneelActions";
			disableWeapons = 0;
			weaponIK = 1;
			aimPrecision = 3;
			headBobMode = 5;
			headBobStrength = -1;
			disableWeaponsLong = 0;
			canPullTrigger = 1;
			enableOptics = 0;
			ConnectTo[] = { };
			InterpolateTo[] = {
					"AmovPknlMstpSrasWrflDnon", 0.010000
			};
		};

		class smk_SpecCrouchDown : smk_SpecCrouchRight
		{
			file = "\z\addons\dayz_smk\anims\special\smk_CrouchDown.rtm";
			aimPrecision = 3.200000;
			aiming = "empty";
			aimingBody = "empty";
			turnSpeed = 0.050000;
			disableWeapons = 1;
			disableWeaponsLong = 1;
			headBobMode = 5;
			headBobStrength = -1;
			canPullTrigger = 0;
			leftHandIKBeg = 0;
			leftHandIKCurve[] = {
					0
			};
			leftHandIKEnd = 0;
			InterpolationSpeed = 0.900000;
			duty = 0.010000;
		};

		class smk_SpecCrouchUp : smk_SpecCrouchRight
		{
			file = "\z\addons\dayz_smk\anims\special\smk_CrouchUp.rtm";
			aimPrecision = 3.200000;
			InterpolationSpeed = 0.900000;
		};

		class smk_SpecCrouch : smk_SpecCrouchUp
		{
			file = "\z\addons\dayz_smk\anims\special\smk_CrouchTaunt.rtm";
			disableWeapons = 1;
			interpolationRestart = 1;
			InterpolationSpeed = 2;
			leftHandIKCurve[] = {
					0
			};
			leftHandIKBeg = 0;
			leftHandIKEnd = 0;
			speed = 1.090000;
		};

		class smk_SpecCrouchLeft : smk_SpecCrouchRight
		{
			file = "\z\addons\dayz_smk\anims\special\smk_CrouchLeft.rtm";
			aimPrecision = 4.200000;
			leftHandIKCurve[] = {
					0
			};
			leftHandIKBeg = 0;
			leftHandIKEnd = 0;
			InterpolationSpeed = 0.500000;
			duty = 0.100000;
		};

		class AmovPknlMstpSrasWrflDnon_Sit : AmovPknlMstpSlowWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\smk_CombatSit_st.rtm";
			duty = -0.700000;
			collisionShape = "ca\Anims\Characters\data\Geom\Sdr\Pknl_Wrfl.p3d";
			showWeaponAim = 1;
			enableOptics = 1;
			visibleSize = 0.350122;
			aiming = "aimingDefault";
			aimingBody = "aimingUpDefault";
			actions = "RifleSitKneelActions";
			disableWeapons = 0;
			weaponIK = 1;
			onLandBeg = 1;
			onLandEnd = 1;
			aimPrecision = 0.350000;
			disableWeaponsLong = 0;
			canPullTrigger = 1;
			ConnectTo[] = {
					"smk_Sit_To_Crouch", 0.020000
			};
		};

		class AmovPknlMwlkSrasWrflDnon_transition : AmovPknlMstpSrasWrflDnon
		{
			file = "\ca\Anims\Characters\data\Anim\Sdr\mov\knl\wlk\ras\rfl\AmovPknlMwlkSrasWrflDnon_transition";
			soundOverride = "walk";
			soundEnabled = 1;
			ConnectTo[] = {
					"AmovPknlMstpSrasWrflDnon", 0.020000
			};
			InterpolateTo[] = {
					"AmovPknlMwlkSrasWrflDf", 0.015000, "AmovPknlMwlkSrasWrflDl", 0.015000, "AmovPknlMwlkSrasWrflDb", 0.015000, "AmovPknlMwlkSrasWrflDr", 0.015000
			};
		};

		class AmovPknlMstpSrasWrflDnon_turnL : AmovPknlMstpSrasWrflDnon
		{
			speed = 0.920000;
		};

		class AmovPknlMstpSrasWrflDnon_turnR : AmovPknlMstpSrasWrflDnon
		{
			speed = 0.920000;
		};

		class AmovPpneMstpSrasWrflDnon : AmovPercMstpSrasWrflDnon
		{
			ConnectTo[] = {
					"AmovPpneMstpSrasWrflDnon_injured", 0.100000, "AmovPpneMstpSrasWrflDnon_turnL", 0.020000, "AmovPpneMstpSrasWrflDnon_turnR", 0.020000, "WeaponMagazineReloadProne", 0.100000, "WeaponMGMagazineReloadProne", 0.100000, "AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMstpSnonWnonDnon", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr", 0.020000, "AwopPpneMstpSgthWrflDnon_Start", 0.100000, "AwopPpneMstpSgthWrflDnon_End", 0.100000, "AidlPpneMstpSrasWrflDnon0S", 0.100000, "AidlPpneMstpSrasWrflDnon01", 0.100000, "AidlPpneMstpSrasWrflDnon02", 0.100000, "AidlPpneMstpSrasWrflDnon03", 0.100000, "AmovPpneMstpSrasWrflDnon_healed", 0.020000, "smk_Prone_to_UrbanProne_Left", 0.010000, "smk_Prone_to_UrbanProne_Right", 0.010000
			};
			InterpolateTo[] = {
					"AmovPpneMstpSrasWrflDnon_turnL", 0.020000, "AmovPpneMstpSrasWrflDnon_turnR", 0.020000, "AmovPpneMrunSlowWrflDf", 0.020000, "AmovPpneMrunSlowWrflDfl", 0.020000, "AmovPpneMrunSlowWrflDl", 0.020000, "AmovPpneMrunSlowWrflDbl", 0.020000, "AmovPpneMrunSlowWrflDb", 0.020000, "AmovPpneMrunSlowWrflDbr", 0.020000, "AmovPpneMrunSlowWrflDr", 0.020000, "AmovPpneMrunSlowWrflDfr", 0.020000, "AmovPpneMsprSlowWrflDf", 0.020000, "AmovPpneMsprSlowWrflDbl", 0.020000, "AmovPpneMsprSlowWrflDl", 0.020000, "AmovPpneMsprSlowWrflDr", 0.020000, "AmovPpneMsprSlowWrflDbr", 0.020000, "AmovPpneMsprSlowWrflDb", 0.020000, "AmovPpneMsprSlowWrflDfl", 0.020000, "AmovPpneMsprSlowWrflDfr", 0.020000, "AmovPpneMstpSrasWrflDnon_AmovPercMsprSlowWrflDf", 0.050000, "AdthPpneMstpSrasWrflDnon_1", 0.010000, "AdthPpneMstpSrasWrflDnon_2", 0.010000, "AidlPpneMstpSrasWrflDnon0S", 0.020000, "AidlPpneMstpSrasWrflDnon01", 0.020000, "AidlPpneMstpSrasWrflDnon02", 0.020000, "AidlPpneMstpSrasWrflDnon03", 0.020000
			};
		};

		class SprintBaseDf : StandBase
		{
			duty = 0.150000;
		};

		class SprintBaseDfl : SprintBaseDf
		{
		};

		class SprintBaseDfr : SprintBaseDf
		{
		};

		class AmovPercMevaSrasWrflDf : SprintBaseDf
		{
			duty = 0.150000;
			ConnectTo[] = {
					"smk_PanicTakeCoverH", 0.010000, "smk_SprintSlide", 0.010000
			};
			InterpolateTo[] = {
					"AmovPercMstpSrasWrflDnon", 0.020000, "AmovPercMrunSlowWrflDf", 0.025000, "AmovPercMwlkSrasWrflDf", 0.025000, "AmovPercMrunSrasWrflDf", 0.025000, "AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon", 0.020000, "AmovPknlMevaSrasWrflDf", 0.025000, "AmovPercMevaSlowWrflDf", 0.025000, "AmovPercMevaSrasWrflDfl", 0.025000, "AmovPercMevaSrasWrflDfr", 0.025000, "AdthPercMrunSlowWrflDf_6", 0.010000, "AdthPercMrunSlowWrflDf_A1short", 0.020000, "AdthPercMrunSlowWrflDf_A2short", 0.020000, "AdthPercMrunSlowWrflDf_A3short", 0.020000, "AdthPercMrunSlowWrflDf_A4short", 0.020000, "smk_JumpOver", 0.020000, "smk_SprintSlide", 0.010000, "smk_CombatRoll", 0.500000
			};
		};

		class AmovPercMevaSrasWrflDfl : SprintBaseDfl
		{
			InterpolateTo[] = {
					"AmovPercMevaSrasWrflDf", 0.025000, "AmovPercMevaSrasWrflDfr", 0.025000, "AdthPercMrunSlowWrflDf_A1short", 0.010000, "AdthPercMrunSlowWrflDf_A2short", 0.010000, "AdthPercMrunSlowWrflDf_A3short", 0.010000, "AdthPercMrunSlowWrflDf_A4short", 0.010000
			};
		};

		class AmovPercMevaSrasWrflDfr : SprintBaseDfr
		{
			InterpolateTo[] = {
					"AmovPercMevaSrasWrflDf", 0.025000, "AmovPercMevaSrasWrflDfl", 0.025000, "AdthPercMrunSlowWrflDf_A1short", 0.010000, "AdthPercMrunSlowWrflDf_A2short", 0.010000, "AdthPercMrunSlowWrflDf_A3short", 0.010000, "AdthPercMrunSlowWrflDf_A4short", 0.010000
			};
		};

		class AmovPercMwlkSrasWrflDf : AmovPercMstpSrasWrflDnon
		{
			InterpolateTo[] = {
					"AmovPercMstpSrasWrflDnon", 0.020000, "AmovPercMwlkSrasWrflDnon_transition", 0.015000, "AmovPercMwlkSrasWrflDfl", 0.025000, "AmovPercMwlkSrasWrflDfr", 0.025000, "AmovPercMrunSrasWrflDf", 0.025000, "AmovPknlMwlkSrasWrflDf", 0.030000, "AmovPercMevaSrasWrflDf", 0.025000, "AmovPercMrunSrasWrflDf_AmovPercMevaSrasWrflDl", 0.020000, "AmovPercMrunSrasWrflDf_AmovPercMevaSrasWrflDr", 0.020000, "AmovPercMrunSrasWrflDf_AmovPercMevaSrasWrflDb", 0.020000, "AdthPercMstpSrasWrflDf_1", 0.010000, "AdthPercMstpSrasWrflDf_2", 0.010000, "AdthPercMstpSrasWrflDf_4", 0.010000, "AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthStart", 0.100000, "AdthPercMstpSrasWrflDf_8", 0.010000
			};
		};

		class AmovPercMwlkSrasWrflDfl : AmovPercMwlkSrasWrflDf
		{
		};

		class AmovPercMwlkSrasWrflDl : AmovPercMwlkSrasWrflDf
		{
		};

		class AmovPercMwlkSrasWrflDbl : AmovPercMwlkSrasWrflDf
		{
		};

		class AmovPercMwlkSrasWrflDb : AmovPercMwlkSrasWrflDf
		{
		};

		class AmovPercMwlkSrasWrflDbr : AmovPercMwlkSrasWrflDf
		{
		};

		class AmovPercMwlkSrasWrflDr : AmovPercMwlkSrasWrflDf
		{
		};

		class AmovPercMwlkSrasWrflDfr : AmovPercMwlkSrasWrflDf
		{
		};

		class smk_PanicTakeCoverH : AmovPercMstpSlowWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverHalfed.rtm";
			collisionShape = "z\addons\dayz_smk\geom\ubl.p3d";
			visibleSize = 0.250121;
			looped = 0;
			speed = 0.830000;
			duty = 6.150000;
			headBobStrength = 3.200000;
			disableWeapons = 1;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			onLandEnd = 1;
			soundOverride = "laydown";
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.075000, 0, 0.890000, 0, 0.950000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			enableDirectControl = 0;
			weaponIK = 1;
			actions = "RifleActions_Panic";
			ConnectTo[] = {
					"smk_PanicTakeCoverStat", 0.500000
			};
			InterpolateTo[] = {
					"smk_PanicTakeCoverStat", 0.100000
			};
			interpolationSpeed = 1;
			interpolationRestart = 2;
		};

		class smk_PanicTakeCoverStat : AmovPercMstpSlowWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCover.rtm";
			collisionShape = "z\addons\dayz_smk\geom\pg.p3d";
			visibleSize = 0.250121;
			looped = 1;
			speed = 13213123.000000;
			duty = 0;
			headBobStrength = 3.200000;
			disableWeapons = 1;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			onLandEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.075000, 0, 0.890000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			enableDirectControl = 0;
			weaponIK = 1;
			actions = "RifleActions_Panic";
			ConnectTo[] = {
					"smk_UrbanProne_Left_to_Prone", 0.100000
			};
			InterpolateTo[] = {
					"smk_PanicTakeCoverUP", 0.100000
			};
			interpolationSpeed = 1;
			interpolationRestart = 1;
		};

		class smk_PanicTakeCoverUP : smk_PanicTakeCoverStat
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProne.rtm";
			visibleSize = 0.250121;
			looped = 0;
			speed = 2.810000;
			duty = 1;
			onLandBeg = 1;
			onLandEnd = 1;
			headBobStrength = 3.200000;
			disableWeapons = 0;
			headBobMode = 2;
			turnSpeed = 2;
			enableDirectControl = 0;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {
					1
			};
			rightHandIKCurve[] = {
					1
			};
			aimprecision = 0.250000;
			weaponIK = 1;
			actions = "RifleActions_UPL";
			ConnectTo[] = {
					"smk_UrbanProneLeft", 0.100000
			};
			InterpolateTo[] = {
					"smk_UrbanProneLeft", 0.500000
			};
			interpolationSpeed = 1;
			interpolationRestart = 1;
		};

		class smk_UrbanProneLeft : AmovPpneMstpSrasWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProne_st.rtm";
			collisionShape = "z\addons\dayz_smk\geom\ubl.p3d";
			visibleSize = 0.250121;
			looped = 1;
			speed = 123123.507812;
			duty = -1;
			onLandBeg = 1;
			onLandEnd = 1;
			disableWeapons = 0;
			turnSpeed = 0.200000;
			enableDirectControl = 1;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {
					1
			};
			rightHandIKCurve[] = {
					1
			};
			aimprecision = 0.250000;
			weaponIK = 1;
			actions = "RifleActions_UPL";
			ConnectTo[] = {
					"smk_UrbanProne_Left_to_Prone", 0.500000
			};
			InterpolateTo[] = {
					"smk_UrbanProneLeftL", 0.500000, "smk_UrbanProneLeftR", 0.500000, "smk_UrbanProneLeftUp", 0.500000, "smk_UrbanProneLeftBlind", 0.500000
			};
		};

		class smk_UrbanProneRight : smk_UrbanProneLeft
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRight_st.rtm";
			collisionShape = "z\addons\dayz_smk\geom\ubr.p3d";
			visibleSize = 0.090121;
			looped = 1;
			speed = 123123.507812;
			duty = -0.340000;
			turnSpeed = 0.200000;
			aimprecision = 0.250000;
			actions = "RifleActions_UPR";
			ConnectTo[] = {
					"smk_UrbanProne_Right_to_Prone", 0.500000
			};
			InterpolateTo[] = {
					"smk_UrbanProneRightL", 0.500000, "smk_UrbanProneRightR", 0.500000, "smk_UrbanProneRightUp", 1, "smk_UrbanProneRightTop", 1, "smk_UrbanProneRightBlind", 1
			};
		};

		class smk_UrbanProneRightUp : smk_UrbanProneRight
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRightUp_st.rtm";
			visibleSize = 0.290121;
			looped = 1;
			speed = 123123.507812;
			duty = 0.010000;
			aimprecision = 0.850000;
			actions = "RifleActions_UPR";
			ConnectTo[] = { };
			interpolationSpeed = 0.900000;
			InterpolateTo[] = {
					"smk_UrbanProneLeftL", 0.500000, "smk_UrbanProneLeftR", 0.500000, "smk_UrbanProneRight", 0.500000, "smk_UrbanProneRightUp", 0.100000, "smk_UrbanProneRightTop", 0.100000, "smk_UrbanProneRightBlind", 1
			};
		};

		class smk_UrbanProneLeftUp : smk_UrbanProneLeft
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneUp_st.rtm";
			visibleSize = 0.290121;
			looped = 1;
			speed = 123123.507812;
			duty = 0.010000;
			aimprecision = 0.350000;
			ConnectTo[] = { };
			interpolationSpeed = 1.250000;
			InterpolateTo[] = {
					"smk_UrbanProneLeftL", 0.500000, "smk_UrbanProneLeftR", 0.500000, "smk_UrbanProneLeft", 0.500000, "smk_UrbanProneLeftUp", 0.100000, "smk_UrbanProneLeftBlind", 0.100000
			};
		};

		class smk_UrbanProneLeftBlind : smk_UrbanProneLeftUp
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneBlind_st.rtm";
			visibleSize = 0.120121;
			duty = 0.300000;
			enableOptics = 0;
			headBobMode = 5;
			headBobStrength = -1;
			showWeaponAim = 0;
			InterpolationSpeed = 1.150000;
			aimprecision = 8.750000;
		};

		class smk_UrbanProneRightBlind : smk_UrbanProneRightUp
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRightBlind_st.rtm";
			visibleSize = 0.120121;
			duty = 0.150000;
			enableOptics = 0;
			headBobMode = 5;
			headBobStrength = -1;
			showWeaponAim = 0;
			InterpolationSpeed = 1.450000;
			aimprecision = 6.750000;
		};

		class smk_UrbanProneRightTop : smk_UrbanProneRightUp
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRightTop_st.rtm";
			visibleSize = 0.290121;
			duty = 0.005000;
			InterpolationSpeed = 0.850000;
			aimprecision = 0.750000;
		};

		class smk_UrbanProneLeftL : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverGoLeft.rtm";
			collisionShape = "z\addons\dayz_smk\geom\ubl.p3d";
			visibleSize = 0.250121;
			looped = 1;
			speed = 0.920000;
			duty = 1;
			onLandBeg = 1;
			soundOverride = "laydown";
			onLandEnd = 1;
			disableWeapons = 0;
			headBobMode = 5;
			headBobStrength = -1;
			turnSpeed = 2;
			enableDirectControl = 0;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKBeg = 0;
			leftHandIKEnd = 0;
			leftHandIKCurve[] = {
					0
			};
			rightHandIKCurve[] = {
					1
			};
			aimprecision = 3.250000;
			weaponIK = 1;
			actions = "RifleActions_UPL";
			ConnectTo[] = {
					"smk_UrbanProneLeft", 0.500000
			};
			InterpolateTo[] = {
					"smk_UrbanProneLeft", 0.500000
			};
			interpolationSpeed = 1;
			interpolationRestart = 1;
		};

		class smk_UrbanProneRightL : smk_UrbanProneLeftL
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRight_L.rtm";
			collisionShape = "z\addons\dayz_smk\geom\ubr.p3d";
			speed = 0.920000;
			duty = 1;
			aimprecision = 3.250000;
			actions = "RifleActions_UPR";
			ConnectTo[] = {
					"smk_UrbanProneRight", 0.500000
			};
			InterpolateTo[] = {
					"smk_UrbanProneRight", 0.500000
			};
		};

		class smk_UrbanProneLeftR : smk_UrbanProneLeftL
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverGoRight.rtm";
			visibleSize = 0.250121;
			looped = 1;
			speed = 0.920000;
			aimprecision = 3.250000;
		};

		class smk_UrbanProneRightR : smk_UrbanProneRightL
		{
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRight_R.rtm";
			speed = 0.920000;
			duty = 1;
			aimprecision = 3.250000;
		};

		class smk_SprintSlide : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_Slide.rtm";
			visibleSize = 0.250121;
			looped = 0;
			soundEnabled = 1;
			speed = 0.790000;
			duty = 0.920000;
			headBobMode = 5;
			headBobStrength = -1;
			disableWeapons = 1;
			enableDirectControl = 0;
			rightHandIKBeg = 1;
			soundOverride = "laydown";
			rightHandIKEnd = 1;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.320000, 1, 0.400000, 0, 0.850000, 0, 0.950000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			weaponIK = 1;
			actions = "RifleKneelActions";
			ConnectTo[] = {
					"smk_SprintSlide_End", 0.020000
			};
			InterpolateTo[] = { };
			interpolationSpeed = 1;
			interpolationRestart = 1;
		};

		class smk_SprintSlide_End : AmovPknlMstpSrasWrflDnon
		{
			file = "\z\addons\dayz_smk\anims\smk_Slide_end.rtm";
			collisionShape = "ca\Anims\Characters\data\Geom\Sdr\Pknl_Wrfl.p3d";
			showWeaponAim = 1;
			enableOptics = 1;
			visibleSize = 0.350122;
			headBobMode = 5;
			headBobStrength = -1;
			aiming = "aimingDefault";
			aimingBody = "aimingUpDefault";
			actions = "RifleKneelActions";
			disableWeapons = 0;
			weaponIK = 1;
			aimPrecision = 0.950000;
			disableWeaponsLong = 0;
			canPullTrigger = 1;
			ConnectTo[] = { };
			InterpolationSpeed = 4.200000;
			InterpolateTo[] = {
					"AmovPknlMstpSrasWrflDnon", 0.500000
			};
		};

		class AmovPercMrunSrasWrflDf : AmovPercMstpSrasWrflDnon
		{
			ConnectTo[] = {
					"AmovPercMrunSrasWrflDf", 0.830000, "AmovPercMstpSrasWrflDnon", 0.130000, "smk_PanicTakeCoverH", 0.130000
			};
			InterpolateTo[] = {
					"AmovPercMstpSrasWrflDnon", 0.020000, "AmovPercMrunSlowWrflDf", 0.025000, "AmovPercMwlkSrasWrflDf", 0.025000, "AmovPercMrunSrasWrflDfl", 0.025000, "AmovPercMrunSrasWrflDfr", 0.025000, "AmovPknlMrunSrasWrflDf", 0.030000, "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon", 0.020000, "AmovPercMevaSrasWrflDf", 0.025000, "AmovPercMrunSlowWrflDf_AmovPercMevaSrasWrflDl", 0.020000, "AmovPercMrunSlowWrflDf_AmovPercMevaSrasWrflDr", 0.020000, "AmovPercMrunSlowWrflDf_AmovPercMevaSrasWrflDb", 0.020000, "AdthPercMstpSlowWrflDf_1", 0.010000, "AdthPercMstpSlowWrflDf_2", 0.010000, "AdthPercMstpSlowWrflDf_4", 0.010000, "smk_JumpOver", 0.020000
			};
		};

		class smk_CombatRoll : AmovPercMrunSrasWrflDf
		{
			file = "\ca\Anims\Characters\data\anim\sdr\cts\evasive\actspercmrunslowwrfldf_flipfloppara.rtm";
			speed = 0.350000;
			looped = 0;
			headBobMode = 4;
			headBobStrength = -1;
			interpolationRestart = 1;
			actions = "RifleStandActions";
			ConnectTo[] = {
					"AmovPercMrunSlowWrflDf", 0.010000
			};
			InterpolateTo[] = {
					"AdthPercMrunSlowWrflDf_6", 0.010000
			};
		};

		class TransAnimBase : Default
		{
		};

		class TransAnimBase_noIK : TransAnimBase
		{
		};

		class amovpercmstpsraswlnrdnon_amovpknlmstpsraswlnrdnon : TransAnimBase
		{
		};

		class AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon : TransAnimBase
		{
			interpolationRestart = 0;
			InterpolateTo[] = {
					"AmovPercMstpSrasWrflDnon", 0.010000, "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon", 0.010000, "AdthPercMstpSrasWrflDnon_1", 0.010000, "AdthPercMstpSrasWrflDnon_2", 0.010000, "AdthPercMstpSrasWrflDnon_4", 0.010000, "AdthPercMstpSrasWrflDnon_8", 0.010000, "AdthPercMstpSrasWrflDnon_16", 0.010000, "AdthPercMstpSrasWrflDnon_32", 0.010000
			};
		};

		class amovpknlmstpsraswlnrdnon_amovpercmstpsraswlnrdnon : TransAnimBase
		{
		};

		class smk_Crouch_to_Sit : TransAnimBase
		{
			visibleSize = 0.100125;
			actions = "RifleSitKneelActions";
			file = "\z\addons\dayz_smk\anims\smk_CombatCrouch_to_Sit.rtm";
			speed = 1.100000;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			interpolationRestart = 1;
			enableOptics = 1;
			soundOverride = "laydown";
			soundEnabled = 1;
			weaponIK = 1;
			headBobStrength = 0.512438;
			duty = 0.250000;
			ConnectTo[] = {
					"AmovPknlMstpSrasWrflDnon_Sit", 0.020000
			};
			InterpolateTo[] = {
					"smk_Sit_to_Crouch", 0.010000, "AdthPknlMstpSrasWrflDnon_1", 0.010000
			};
		};

		class smk_Sit_to_Crouch : TransAnimBase
		{
			visibleSize = 0.100125;
			actions = "RifleSitKneelActions";
			file = "\z\addons\dayz_smk\anims\smk_CombatSit_to_Crouch.rtm";
			speed = 1.100000;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			interpolationRestart = 2;
			enableOptics = 1;
			soundOverride = "laydown";
			soundEnabled = 1;
			weaponIK = 1;
			headBobStrength = 0.512438;
			duty = 0.250000;
			ConnectTo[] = {
					"AmovPknlMstpSrasWrflDnon", 0.020000
			};
			InterpolateTo[] = {
					"smk_Crouch_to_Sit", 0.010000, "AdthPknlMstpSrasWrflDnon_1", 0.010000
			};
		};

		class smk_Prone_to_UrbanProne_Left : TransAnimBase
		{
			visibleSize = 0.600125;
			actions = "RifleActions_UPL";
			collisionShape = "z\addons\dayz_smk\geom\ubl.p3d";
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneLeft.rtm";
			speed = 1.000000;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			interpolationRestart = 2;
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
			leftHandIKCurve[] = {
					0.050000, 1, 0.125000, 0, 0.900000, 0, 0.950000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			enableOptics = 1;
			soundOverride = "standup";
			soundEnabled = 1;
			weaponIK = 1;
			headBobStrength = 0.512438;
			duty = 0.500000;
			ConnectTo[] = {
					"smk_UrbanProneLeft", 0.020000
			};
			InterpolateTo[] = {
					"smk_UrbanProne_Left_to_Prone", 0.010000
			};
		};

		class smk_UrbanProne_Left_to_Prone : TransAnimBase
		{
			visibleSize = 0.600125;
			actions = "RifleProneActions";
			collisionShape = "z\addons\dayz_smk\geom\ubl.p3d";
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverComeback.rtm";
			speed = 0.900000;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			interpolationRestart = 2;
			leftHandIKBeg = 1;
			leftHandIKCurve[] = {
					0.050000, 1, 0.060000, 0, 0.970000, 0, 0.980000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			leftHandIKEnd = 1;
			enableOptics = 1;
			soundOverride = "standup";
			soundEnabled = 1;
			weaponIK = 1;
			headBobStrength = 0.512438;
			duty = 0.500000;
			ConnectTo[] = {
					"AmovPpneMstpSrasWrflDnon", 0.020000
			};
			InterpolateTo[] = {
					"smk_Prone_to_UrbanProne_Left", 0.010000
			};
		};

		class smk_Prone_to_UrbanProne_Right : TransAnimBase
		{
			visibleSize = 0.600125;
			collisionShape = "z\addons\dayz_smk\geom\ubr.p3d";
			actions = "RifleActions_UPR";
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRight.rtm";
			speed = 0.850000;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			interpolationRestart = 2;
			leftHandIKBeg = 1;
			leftHandIKCurve[] = {
					0.050000, 1, 0.060000, 0, 0.900000, 0, 0.950000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			leftHandIKEnd = 1;
			enableOptics = 1;
			soundOverride = "standup";
			soundEnabled = 1;
			weaponIK = 1;
			headBobStrength = 0.512438;
			duty = 0.500000;
			ConnectTo[] = {
					"smk_UrbanProneRight", 0.020000
			};
			InterpolateTo[] = {
					"smk_UrbanProne_Right_to_Prone", 0.010000
			};
		};

		class smk_UrbanProne_Right_to_Prone : TransAnimBase
		{
			visibleSize = 0.600125;
			actions = "RifleProneActions";
			collisionShape = "z\addons\dayz_smk\geom\ubr.p3d";
			file = "\z\addons\dayz_smk\anims\smk_TakeCoverUrbanProneRightComeback.rtm";
			speed = 0.750000;
			leaningFactorBeg = 1;
			leaningFactorEnd = 1;
			interpolationRestart = 2;
			leftHandIKBeg = 1;
			leftHandIKCurve[] = {
					0.050000, 1, 0.060000, 0, 0.970000, 0, 0.980000, 1
			};
			rightHandIKCurve[] = {
					1
			};
			leftHandIKEnd = 1;
			enableOptics = 1;
			soundOverride = "standup";
			soundEnabled = 1;
			weaponIK = 1;
			headBobStrength = 0.512438;
			duty = 0.500000;
			ConnectTo[] = {
					"AmovPpneMstpSrasWrflDnon", 0.020000
			};
			InterpolateTo[] = {
					"smk_Prone_to_UrbanProne_Right", 0.010000
			};
		};

		class WeaponMagazineReloadStand : Default
		{
		};

		class WeaponMagazineReloadProne : WeaponMagazineReloadStand
		{
		};

		class WeaponMGMagazineReloadProne : WeaponMagazineReloadProne
		{
			speed = 0.190000;
		};
	};
};

class CfgGesturesMale 
{
	skeletonName = "OFP2_ManSkeleton";

	class ManActions 
	{
	};

	class Actions 
	{

		class NoActions 
		{
		};
	};

	class Default 
	{
	};

	class States 
	{

		class WeaponMagazineReloadStand : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_HandsReload.rtm";
			looped = 0;
			speed = 0.460000;
			mask = "handsWeapon";
			headBobStrength = 0.200000;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.050000, 0, 0.950000, 0, 1, 1
			};
		};

		class WeaponGLMagazineReloadStand : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_HandsGLReload.rtm";
			looped = 0;
			speed = 0.610000;
			mask = "handsWeapon";
			headBobStrength = 0.200000;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.050000, 0, 0.950000, 0, 1, 1
			};
		};

		class WeaponMGMagazineReloadStand : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_HandsMGReload.rtm";
			looped = 0;
			speed = 0.250000;
			mask = "handsWeapon";
			headBobStrength = 0.200000;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKCurve[] = {
					0, 1, 0.050000, 0, 0.950000, 0, 1, 1
			};
		};

		class GestureHiB : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_HandsGLReload.rtm";
			looped = 0;
			speed = 0.610000;
			mask = "handsWeapon";
			headBobStrength = 0.200000;
			headBobMode = 5;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			rightHandIKCurve[] = {
					1
			};
			leftHandIKCurve[] = {
					0, 1, 0.050000, 0, 0.950000, 0, 1, 1
			};
		};

		class GestureHiC : Default
		{
			file = "\z\addons\dayz_smk\anims\smk_HandsMGReload.rtm";
			looped = 0;
			speed = 0.250000;
			mask = "handsWeapon";
			headBobStrength = 0.200000;
			headBobMode = 5;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			rightHandIKCurve[] = {
					1
			};
			leftHandIKCurve[] = {
					0, 1, 0.050000, 0, 0.950000, 0, 1, 1
			};
		};
	};
};

class CfgWeapons 
{

	class Default 
	{
		handAnim[] = {
				"OFP2_ManSkeleton", "\z\addons\dayz_smk\anims\smk_HandsBase.rtm"
		};

		class Library 
		{
		};
	};

	class RifleCore : Default
	{
		handAnim[] = {
				"OFP2_ManSkeleton", "\z\addons\dayz_smk\anims\smk_HandsBase.rtm"
		};
	};

	class MGunCore : Default
	{
		handAnim[] = {
				"OFP2_ManSkeleton", "\z\addons\dayz_smk\anims\smk_HandsBase.rtm"
		};
		reloadAction = "ManActGestureHiC";
	};

	class GrenadeLauncher : Default
	{
		reloadAction = "ManActGestureHiB";
	};

	class Rifle : RifleCore
	{
		handAnim[] = {
				"OFP2_ManSkeleton", "\z\addons\dayz_smk\anims\smk_HandsBase.rtm"
		};

		class M203Muzzle : GrenadeLauncher
		{
		};
	};

	class M16_base : Rifle
	{
		handAnim[] = {
				"OFP2_ManSkeleton", "\z\addons\dayz_smk\anims\smk_HandsBase.rtm"
		};

		class M203Muzzle : M203Muzzle
		{
		};
	};
};

class CfgMagazines 
{

	class CA_Magazine ;

	class 200Rnd_556x45_M249 : CA_Magazine
	{
		reloadAction = "ManActGestureHiC";
	};

	class 100Rnd_556x45_BetaCMag : CA_Magazine
	{
		reloadAction = "ManActGestureHiC";
	};

	class 100Rnd_556x45_M249 : 200Rnd_556x45_M249
	{
		reloadAction = "ManActGestureHiC";
	};

	class 200Rnd_556x45_L110A1 : 200Rnd_556x45_M249
	{
		reloadAction = "ManActGestureHiC";
	};

	class 100Rnd_762x51_M240 : CA_Magazine
	{
		reloadAction = "ManActGestureHiC";
	};

	class 100Rnd_762x54_PK : CA_Magazine
	{
		reloadAction = "ManActGestureHiC";
	};

	class 1Rnd_HE_M203 : CA_Magazine
	{
		reloadAction = "ManActGestureHiB";
	};

	class 1Rnd_HE_GP25 : CA_Magazine
	{
		reloadAction = "ManActGestureHiB";
	};
};
