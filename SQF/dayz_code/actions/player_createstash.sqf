private["_playerPos","_item","_hastentitem","_location","_building","_isOk","_config","_text","_objectsPond","_isPond","_pondPos","_dir","_dis","_sfx","_tent"];

//check if can pitch here
call gear_ui_init;

//Player Pos
_playerPos = 	getPosATL player;

//Classname
_item = _this;

diag_log (str(_item));

//Config
_config =   configFile >> "CFGWeapons" >> _item;
_text =     getText (_config >> "displayName");
_stashtype =    getText (_config >> "stashtype");

if ("ItemSandbag" in magazines player) then { _stashtype = "StashMedium"; };

_location = player modeltoworld [0,2.5,0];
_location set [2,0];

//Is player in building
_building = nearestObject [(vehicle player), "HouseBase"];
_isinBuilding = [(vehicle player),_building] call fnc_isInsideBuilding;

//blocked
if (["concrete",dayz_surfaceType] call fnc_inString) exitwith { diag_log ("surface concrete"); };

//Block Objects in pounds
_objectsPond = 		nearestObjects [_playerPos, [], 10];
	{
		_isPond = ["pond",str(_x),false] call fnc_inString;
		if (_isPond) then {
			_pondPos = (_x worldToModel _playerPos) select 2;
			if (_pondPos < 0) then {
				_notinPond = true;
			};
		};
	} forEach _objectsPond;
	_isOK = true;
	
	diag_log ("BuildingCheck: " +str(_isinBuilding));

if (!_notinPond and _isOK) then {
	_dir = round(direction player);
	
	//wait a bit
	player playActionNow "Medic";
	sleep 1;

	_dis=20;
	_sfx = "tentunpack";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
	sleep 5;
	//place tent (local)
	_stash = createVehicle [_stashtype, _location, [], 0, "CAN_COLLIDE"];
	_stash setdir _dir;
	_stash setpos _location;
	player reveal _stash;
	_location = getPosATL _stash;

	_stash setVariable ["characterID",dayz_characterID,true];
	dayzPublishObj = [dayz_characterID,_stash,[_dir,_location],_stashtype];
	
diag_log (str(dayzPublishObj));	
	publicVariable "dayzPublishObj";
	
	cutText [localize "str_success_tent_pitch", "PLAIN DOWN"];
} else {
	cutText [localize "str_fail_tent_pitch", "PLAIN DOWN"];
};