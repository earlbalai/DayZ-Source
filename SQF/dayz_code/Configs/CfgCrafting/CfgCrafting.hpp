//class CfgWeapons

//Completed
//Weapons
#include "Blueprints\Weapons\NailedBaseballBat.hpp"
#include "Blueprints\Weapons\BaseBallBatBarbed.hpp"
#include "Blueprints\Weapons\M9SD.hpp"
#include "Blueprints\Weapons\M4A1_AIM.hpp"
#include "Blueprints\Weapons\MAKAROVSD.hpp"
#include "Blueprints\Weapons\bizonSD.hpp"
#include "Blueprints\Weapons\SVD_CAMO.hpp"
#include "Blueprints\Weapons\M4A1_Aim_CAMO.hpp"
#include "Blueprints\Weapons\M4A1_HWS_GL_CAMO.hpp"
#include "Blueprints\Weapons\G36C_camo.hpp"
#include "Blueprints\Weapons\G36A_camo.hpp"
#include "Blueprints\Weapons\G36K_camo.hpp"
#include "Blueprints\Weapons\DMR2.hpp"
//Medical
#include "Blueprints\Medical\Bandage.hpp"
//Tools
#include "Blueprints\Tools\Compass.hpp"


//Removed Attachment building
/*
#include "Blueprints\Attachments\ACG.hpp"
#include "Blueprints\Attachments\AIM.hpp"
#include "Blueprints\Attachments\CAMO.hpp"
#include "Blueprints\Attachments\GL.hpp"
#include "Blueprints\Attachments\Kobra.hpp"
#include "Blueprints\Attachments\PSO.hpp"
#include "Blueprints\Attachments\SILENCER.hpp"
#include "Blueprints\Attachments\SNIPER_SCOPE.hpp"
*/

class CraftingItem : ItemCore {
	scope = private;
	displayName = $STR_CRAFT_NAME_0;
	descriptionShort = $STR_CRAFT_DESC_0;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\CA\misc\data\icons\picture_moscow_docs_CA.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = {}; //Items consumed during crafting
			output[] = {}; //Items created from crafting
			required[] = {}; //Items needed for but not consumed during crafting
		};
	};
};