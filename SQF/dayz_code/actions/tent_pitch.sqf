private ["_item", "_config", "_text", "_booleans", "_worldspace", "_dir", "_location", "_dis", "_sfx", "_tent"];

call gear_ui_init;

_item = _this;

_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");
_model = getText (_config >> "model");

if (r_action_count != 1) exitWith { cutText ["Wait for the previous action to complete to perform another!", "PLAIN DOWN"]; };

// item is missing or tools are missing
if ((!(_item IN magazines player)) OR {(_item != "ItemTent")}) exitWith {
	r_action_count = 0;
	cutText [format[(localize "str_player_31"),_text,(localize "str_player_31_pitch")] , "PLAIN DOWN"];
};

_booleans = []; //testonLadder, testSea, testPond, testBuilding, testSlope, testDistance
_worldspace = ["TentStorage", player, _booleans] call fn_niceSpot;

// player on ladder or in a vehicle
if (_booleans select 0) exitWith { cutText [localize "str_player_21", "PLAIN DOWN"]; r_action_count = 0; };

// object would be in the water (pool or sea)
if ((_booleans select 1) OR (_booleans select 2)) exitWith { cutText [localize "str_player_26", "PLAIN DOWN"]; r_action_count = 0; };

if ((count _worldspace) == 2) then {
	//remove tentbag
	player removeMagazine _item;
	_dir = _worldspace select 0;
	_location = _worldspace select 1;

	//wait a bit
	player playActionNow "Medic";
	sleep 1;
	// tent location may not be in front of player
	player setDir _dir;
	player setPosATL (getPosATL player);

	_dis=20;
	_sfx = "tentunpack";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	sleep 5;

	_tent = createVehicle ["TentStorage", getMarkerpos "respawn_west", [], 0, "CAN_COLLIDE"];
	_tent setDir _dir;
	_tent setPos _location; // follow terrain slope (works above sea level)
	player reveal _tent;
	_location = getPosATL _tent;

	_tent setVariable ["characterID",dayz_characterID,true];
	PVDZ_obj_Publish = [dayz_characterID,_tent,[_dir,_location],"TentStorage"];
	publicVariableServer "PVDZ_obj_Publish";

	cutText [localize "str_success_tent_pitch", "PLAIN DOWN"];
	sleep 1;
	r_action_count = 0;
} else {
	r_action_count = 0;
	cutText [localize "str_fail_tent_pitch", "PLAIN DOWN"];
};