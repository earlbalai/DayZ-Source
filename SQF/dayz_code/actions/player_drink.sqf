private["_onLadder","_item","_hasdrinkitem","_config","_text","_sfx","_id","_display"];
disableserialization;
call gear_ui_init;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not drink while in a vehicle", "PLAIN DOWN"]};

//Force players to wait 3 mins to drink again
//if (dayz_lastDrink < 180) exitWith {cutText ["You may not drink, your not thirsty", "PLAIN DOWN"]};

_item = _this;
_hasdrinkitem = _item in magazines player;

if ("ItemMap_Debug" in items player) then {
	diag_log ("Drink: " +str(_item));
};

_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");
_sfx = 	getText (_config >> "sfx");

if (!_hasdrinkitem) exitWith {cutText [format[(localize "str_player_31"),_text,"drink"] , "PLAIN DOWN"]};

player playActionNow "PutDown";
player removeMagazine _item;
sleep 1;

_dis=6;
_sfx = "drink";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

if (_item == "ItemWaterbottle" or  _item == "ItemWaterbottleBoiled") then {
	player addMagazine "ItemWaterbottleUnfilled";
	if ((random 15 < 1) and (_item == "ItemWaterbottle")) then {
		r_player_infected = true;
		player setVariable["USEC_infected",true,true];
	};
} else {
	_nearByPile= nearestObjects [(position player), ["WeaponHolder","WeaponHolderBase"],2];
	if (count _nearByPile ==0) then { 
		_item = createVehicle ["WeaponHolder", position player, [], 0.0, "CAN_COLLIDE"];
	} else {
		_item = _nearByPile select 0;
	};
	
	switch (_item) do
	{
		case "ItemSodaMtngreen" : {_item addMagazineCargoGlobal ["ItemSodaMtngreenEmpty",1]};
		case "ItemSodaLirik" : {_item addMagazineCargoGlobal ["ItemSodaLirikEmpty",1]};
		case "ItemSodaSmasht" : {_item addMagazineCargoGlobal ["ItemSodaSmashtEmpty",1]};
		case "ItemSodaPeppsy" : {_item addMagazineCargoGlobal ["ItemSodaPeppsyEmpty",1]};
		case "ItemSodaR4z0r" : {_item addMagazineCargoGlobal ["ItemSodaR4z0rEmpty",1]};
		case "ItemSodaDrwaste" : {_item addMagazineCargoGlobal ["ItemSodaDrwasteEmpty",1]};
		case "ItemSodaClays" : {_item addMagazineCargoGlobal ["ItemSodaClaysEmpty",1]};
		case "ItemSodaLvg" : {_item addMagazineCargoGlobal ["ItemSodaLvgEmpty",1]};
		case "ItemSodaFranka" : {_item addMagazineCargoGlobal ["ItemSodaFrankaEmpty",1]};
		case "ItemSodaLemonade" : {_item addMagazineCargoGlobal ["ItemSodaLemonadeEmpty",1]};
		case "ItemSodaRabbit" : {_item addMagazineCargoGlobal ["ItemSodaRabbitEmpty",1]};
		case "ItemSodaSacrite" : {_item addMagazineCargoGlobal ["ItemSodaSacriteEmpty",1]};
		case "ItemSodaMzly" : {_item addMagazineCargoGlobal ["ItemSodaMzlyEmpty",1]};
		default {_item addMagazineCargoGlobal ["ItemSodaEmpty",1]};
	};
};
player setVariable ["messing",[dayz_hunger,dayz_thirst],true];

dayz_lastDrink = time;
dayz_thirst = 0;

//Ensure Control is visible
_display = uiNamespace getVariable 'DAYZ_GUI_display';
(_display displayCtrl 1302) ctrlShow true;

cutText [format[(localize  "str_player_consumed"),_text], "PLAIN DOWN"];