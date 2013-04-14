class CfgAmmo {	
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
		timeToLive = 0.04;
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
		timeToLive = 0.03;
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
};
