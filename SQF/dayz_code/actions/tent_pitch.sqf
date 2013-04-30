private ["_playerPos", "_item", "_hastentitem", "_config", "_text", "_worldspace", "_dir", "_location", "_dis", "_sfx", "_tent"];

//check if can pitch here
call gear_ui_init;
_playerPos = getPosATL player;
_item = _this;
_hastentitem = _item in magazines player;

_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");
if ((!_hastentitem) OR (_item != "ItemTent")) exitWith {
	cutText [format[(localize "str_player_31"),_text,(localize "str_player_31_pitch")] , "PLAIN DOWN"];
};

_worldspace = ["TentStorage", player] call fn_niceSpot;

if ((count _worldspace) == 2) then {
	//remove tentbag
	player removeMagazine _item;
	_dir = _worldspace select 0;
	_location = _worldspace select 1; 
	
	//wait a bit
	player playActionNow "Medic";
	sleep 1;
	
	_dis=20;
	_sfx = "tentunpack";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
	sleep 5;
	//place tent (local)
	_tent = createVehicle ["TentStorage", getMarkerpos "center", [], 0, "CAN_COLLIDE"];
	_tent setdir _dir;
	_tent setpos _location;
	player reveal _tent;
	_location = getPosATL _tent;

	_tent setVariable ["characterID",dayz_characterID,true];

	//player setVariable ["tentUpdate",["Land_A_tent",_dir,_location,[dayz_tentWeapons,dayz_tentMagazines,dayz_tentBackpacks]],true];

	//["dayzPublishObj",[dayz_characterID,_tent,[_dir,_location],"TentStorage"]] call callRpcProcedure;
	dayzPublishObj = [dayz_characterID,_tent,[_dir,_location],"TentStorage"];
	publicVariable "dayzPublishObj";
	
	cutText [localize "str_success_tent_pitch", "PLAIN DOWN"];
} else {
	cutText [localize "str_fail_tent_pitch", "PLAIN DOWN"];
};