class CfgAmmo {	
class BulletBase;
//mak
	class B_9x18_Ball : BulletBase {
		airfriction = -0.002751;
		audiblefire = 15;
		caliber = 0.33;
		cartridge = "FxCartridge_9mm";
		cost = 5;
		hit = 6;
		typicalspeed = 350;
		visiblefire = 15;
	};
//macSD
	class B_9x18_SD : BulletBase {
		airfriction = -0.001893;
		audiblefire = 0.035;
		cost = 5;
		hit = 6;
		typicalspeed = 310;
		visiblefire = 0.035;
		visiblefiretime = 2;
	};
//1911
	class B_45ACP_Ball : BulletBase {
		airfriction = -0.0013522;
		audiblefire = 16;
		caliber = 0.33; //33
		cartridge = "FxCartridge_9mm";
		cost = 5;
		hit = 9;
		indirecthit = 0;
		indirecthitrange = 0;
		typicalspeed = 260;
		visiblefire = 16;
	};

	class Bolt;
	class WoodenArrow : Bolt {
		model = "\dayz_weapons\models\bolt";
		hit = 8;
		caliber = 0.33;
	};
	class Melee;
	class Machete_Swing_Ammo : Melee {
		hit = 15;
		simulation = "shotBullet";
		minRange = 1;
		minRangeProbab = 0.8;
		midRange = 2;
		midRangeProbab = 1.8;
		maxRange = 3;
		maxRangeProbab = 2.8;
		explosive = "true";
		simulationStep = 0.001;
		timeToLive = 0.05;
		soundHit[] = {"", db-90, 1};
		soundEngine[] = {"", db-80, 4};
	};
	class Hatchet_Swing_Ammo : Melee {
		hit = 12;
		simulation = "shotBullet";
		minRange = 1;
		minRangeProbab = 0.9;
		midRange = 2;
		midRangeProbab = 1.9;
		maxRange = 3;
		maxRangeProbab = 2.9;
		explosive = "true";
		simulationStep = 0.001;
		timeToLive = 0.05;
		soundHit[] = {"", db-90, 1};
		soundEngine[] = {"", db-80, 4};
	};
	class Crowbar_Swing_Ammo : Melee {
		hit = 9;
		simulation = "shotBullet";
		minRange = 1;
		minRangeProbab = 0.8;
		midRange = 2;
		midRangeProbab = 1.5;
		maxRange = 3;
		maxRangeProbab = 2.5;
		explosive = "true";
		simulationStep = 0.001;
		timeToLive = 0.05;
		soundHit[] = {"", db-90, 1};
		soundEngine[] = {"", db-80, 4};
	};
	class Bat_Swing_Ammo : Melee {
		hit = 4;
		simulation = "shotBullet";
		minRange = 1;
		minRangeProbab = 0.8;
		midRange = 2;
		midRangeProbab = 1.8;
		maxRange = 3;
		maxRangeProbab = 2.8;
		explosive = "true";
		simulationStep = 0.001;
		timeToLive = 0.05;
		soundHit[] = {"", db-90, 1};
		soundEngine[] = {"", db-80, 4};
	};
	class BatBarbed_Swing_Ammo : Melee {
		hit = 6;
		simulation = "shotBullet";
		minRange = 1;
		minRangeProbab = 0.8;
		midRange = 2;
		midRangeProbab = 1.8;
		maxRange = 3;
		maxRangeProbab = 2.8;
		explosive = "true";
		simulationStep = 0.001;
		timeToLive = 0.05;
		soundHit[] = {"", db-90, 1};
		soundEngine[] = {"", db-80, 4};
	};
};
