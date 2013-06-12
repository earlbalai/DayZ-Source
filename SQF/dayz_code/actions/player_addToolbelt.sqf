private["_item","_config","_onLadder","_hastoolweapon","_text","_create","_config2","_melee2tb","_isOk"];

_item = _this;
_config = configFile >> "cfgWeapons" >> _item;

_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hastoolweapon = _item in weapons player;
_text = getText (_config >> "displayName");
if (!_hastoolweapon) exitWith {cutText [format[(localize "str_player_30"),_text] , "PLAIN DOWN"]};

call gear_ui_init;

//Add new item
_create = getArray (_config >> "ItemActions" >> "Toolbelt" >> "output") select 0;
_config2 = configFile >> "cfgWeapons" >> _create;

//removing current melee weapon if new melee selected
_melee2tb = "";
if (_item in ["ItemHatchet","ItemCrowbar","ItemMachete"]) then {
	//free primary slot for new melee (remember item to add after)
	switch (primaryWeapon player) do {
		case "MeleeHatchet": {player removeWeapon "MeleeHatchet"; _melee2tb = "ItemHatchet";};
		case "MeleeCrowbar": {player removeWeapon "MeleeCrowbar"; _melee2tb = "ItemCrowbar";};
		case "MeleeMachete": {player removeWeapon "MeleeMachete"; _melee2tb = "ItemMachete";};
	};
};

//Remove melee magazines (BIS_fnc_invAdd fix) (add new melee ammo to array if needed)
{player removeMagazines _x} forEach ["hatchet_swing","crowbar_swing","Machete_swing"];

_isOk = [player,_config2] call BIS_fnc_invAdd;
if (_isOk) then {
	player removeWeapon _item;
	//adding old melee converted to Item on place of removed _item
	if (_melee2tb != "") then {
		//we know there is place to add item but to prevent BE spam using _config2
		_config2 = _melee2tb;
		_isOk = [player,_config2] call BIS_fnc_invAdd;
		};
} else {
	cutText [localize "str_player_24", "PLAIN DOWN"];
};

//adding melee mags back if needed
switch (primaryWeapon player) do {
	case "MeleeHatchet": {player addMagazine 'hatchet_swing';};
	case "MeleeCrowbar": {player addMagazine 'crowbar_swing';};
	case "MeleeMachete": {player addMagazine 'Machete_swing';};
};