//class CfgWeapons

//Completed
#include "Blueprints\Weapons\NailedBaseballBat.hpp"
#include "Blueprints\Weapons\BaseBallBatBarbed.hpp"

//No Stringtables
#include "Blueprints\Attachments\ACG.hpp"
#include "Blueprints\Attachments\AIM.hpp"
#include "Blueprints\Attachments\CAMO.hpp"
#include "Blueprints\Attachments\GL.hpp"
#include "Blueprints\Attachments\Kobra.hpp"
#include "Blueprints\Attachments\PSO.hpp"
#include "Blueprints\Attachments\SILENCER.hpp"


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