class CfgAmmo {	
	class Bolt;
	class WoodenArrow : Bolt {
		model = "\dayz_weapons\models\bolt";
		hit = 8;
		caliber = 0.33;
	};

	class Machete_Swing_Ammo : Melee {
		hit = 5;
		simulation = "shotBullet";
	};
};
