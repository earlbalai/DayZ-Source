class CfgAmmo {	
	class Bolt;
	class WoodenArrow : Bolt {
		model = "\dayz_weapons\models\bolt";
		hit = 8;
		caliber = 0.33;
	};
	class Melee;
	class Machete_Swing_Ammo : Melee {
		hit = 9;
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
};
