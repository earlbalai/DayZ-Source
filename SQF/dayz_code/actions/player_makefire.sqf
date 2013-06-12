private ["_item", "_config", "_text", "_booleans", "_worldspace", "_dir", "_location", "_dis", "_sfx", "_fire"];

call gear_ui_init;

_item = "PartWoodPile";

_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");

// item is missing or tools are missing
if (!(_item IN magazines player)) exitWith {
	cutText [localize "str_player_22", "PLAIN DOWN"];
};

_booleans = []; //testonLadder, testSea, testPond, testBuilding, testSlope, testDistance
_worldspace = ["Land_Fire_DZ", player, _booleans] call fn_niceSpot;
diag_log(format["make_fire: booleans: %1 worldspace:%2", _booleans, _worldspace]);

// player on ladder or in a vehicle
if (_booleans select 0) exitWith { cutText [localize "str_player_21", "PLAIN DOWN"]; };

// object would be in the water (pool or sea)
if ((_booleans select 1) OR (_booleans select 2)) exitWith { cutText [localize "str_player_26", "PLAIN DOWN"]; };

if ((count _worldspace) == 2) then {
	player removeMagazine _item;
	_dir = _worldspace select 0;
	_location = _worldspace select 1;

	player playActionNow "Medic";
	sleep 1;
	// fireplace location may not be in front of player (but in 99% time it should)
	player setDir _dir;
	player setPosATL (getPosATL player);

	_dis=20;
	//_sfx = "repair";
	//[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	sleep 5;

	_fire = createVehicle ["Land_Fire_DZ", getMarkerpos "respawn_west", [], 0, "CAN_COLLIDE"];
	_fire setDir _dir;
	_fire setPos _location; // follow terrain slope
	player reveal _fire;

	_fire spawn player_fireMonitor;

	cutText [localize "str_fireplace_01", "PLAIN DOWN"];
} else {
	cutText [localize "str_fireplace_02", "PLAIN DOWN"];
};