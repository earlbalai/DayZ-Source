
private["_type","_isAir","_inVehicle","_dateNow","_maxZombies","_maxWildZombies","_age","_nearbyBuildings","_radius","_locationstypes","_nearestCity","_position","_nearbytype", "_bldcount"];

_type = _this select 0;
_Keepspawning = _this select 1;

// compute building footprint just to check if it could hide a Zombie
_fairSize = {
	private ["_boundingBox","_cornerLow","_cornerHi", "_burried"];

	_boundingBox = boundingBox _this;
	
	_cornerLow = _this ModeltoWorld (_boundingBox select 0);
	_cornerHi = _this ModeltoWorld (_boundingBox select 1);
	_burried = _cornerLow select 2;
	_cornerLow set [2, _cornerHi select 2];
	//diag_log(format["Model:%1  Height:%2  Cross width:%3  _burried:%4", typeOf _this, _cornerHi select 2, _cornerLow distance _cornerHi, _burried]);
	((_burried < 0.1) AND {(((_cornerHi select 2) > 2.6) AND {((_cornerLow distance _cornerHi) > 7)})}) // container size as reference
};

_isAir = vehicle player iskindof "Air";
_inVehicle = (vehicle player != player);
_dateNow = (DateToNumber date);
_maxZombies = dayz_maxLocalZombies;
_maxWildZombies = DAYZ_maxWildZombies;
_age = -1;
_force = false;

_nearbyBuildings = [];
_radius = 200; 
_position = getPosATL player;

if (_inVehicle) then {
	_maxZombies = 5;
};
if (_isAir) then {
	_maxZombies = 0;
};


//diag_log ("Type: " +str(_type));


//diag_log("SPAWN CHECKING: Starting");
	//_locationstypes = ["NameCityCapital","NameCity","NameVillage"];
	//_nearestCity = nearestLocations [getPos player, _locationstypes, _radius/2];
	//_townname = text (_nearestCity select 0);	
	//_nearbytype = type (_nearestCity select 0);
/*
switch (_nearbytype) do {
	case "NameVillage": {
		//_radius = 250; 
		_maxZombies = 30;
	};
	case "NameCity": {
		//_radius = 300; 
		_maxZombies = 40;
	};
	case "NameCityCapital": {
		//_radius = 400; 
		_maxZombies = 40;
	};
};
*/

_players = _position nearEntities ["CAManBase",_radius+200];

dayz_maxGlobalZombies = 60;
/*
{
	if (isPlayer _x) then {
		dayz_maxGlobalZombies = dayz_maxGlobalZombies + 10;
	};
} foreach _players;
*/

dayz_spawnZombies = {local _x} count (_position nearEntities ["zZombie_Base",_radius+100]);
dayz_CurrentZombies = count (_position nearEntities ["zZombie_Base",_radius+200]);

if ("ItemMap_Debug" in items player) then {
	deleteMarkerLocal "MaxZeds";
	deleteMarkerLocal "Counter";
	deleteMarkerLocal "Loot30";
	deleteMarkerLocal "Loot120";
	deleteMarkerLocal "Agro80";
	
	_markerstr = createMarkerLocal ["MaxZeds", _position];
	_markerstr setMarkerColorLocal "ColorYellow";
	_markerstr setMarkerShapeLocal "ELLIPSE";
	_markerstr setMarkerBrushLocal "Border";
	_markerstr setMarkerSizeLocal [_radius, _radius];

	_markerstr1 = createMarkerLocal ["Counter", _position];
	_markerstr1 setMarkerColorLocal "ColorRed";
	_markerstr1 setMarkerShapeLocal "ELLIPSE";
	_markerstr1 setMarkerBrushLocal "Border";
	_markerstr1 setMarkerSizeLocal [_radius+100, _radius+100];
	
	_markerstr2 = createMarkerLocal ["Agro80", _position];
	_markerstr2 setMarkerColorLocal "ColorRed";
	_markerstr2 setMarkerShapeLocal "ELLIPSE";
	_markerstr2 setMarkerBrushLocal "Border";
	_markerstr2 setMarkerSizeLocal [80, 80];

	_markerstr2 = createMarkerLocal ["Loot30", _position];
	_markerstr2 setMarkerColorLocal "ColorRed";
	_markerstr2 setMarkerShapeLocal "ELLIPSE";
	_markerstr2 setMarkerBrushLocal "Border";
	_markerstr2 setMarkerSizeLocal [30, 30];

	_markerstr3 = createMarkerLocal ["Loot120", _position];
	_markerstr3 setMarkerColorLocal "ColorBlue";
	_markerstr3 setMarkerShapeLocal "ELLIPSE";
	_markerstr3 setMarkerBrushLocal "Border";
	_markerstr3 setMarkerSizeLocal [120, 120];

diag_log ("SpawnWait: " +str(time - dayz_spawnWait));
diag_log ("LocalZombies: " +str(dayz_spawnZombies) + "/" +str(_maxZombies));
diag_log ("GlobalZombies: " +str(dayz_CurrentZombies) + "/" +str(dayz_maxGlobalZombies));

diag_log ("Audial Noise: " +str(DAYZ_disAudial));
diag_log ("Visual Sight: " +str(DAYZ_disVisual /2));
};

diag_log (format["%1 Local-Z@300m: %2/%3. Global-Z@400m: %5/%6 (viewdistance:%7m %8fps).", __FILE__,
	dayz_spawnZombies, _maxZombies, time - dayz_spawnWait, dayz_CurrentZombies, dayz_maxGlobalZombies, viewDistance, round diag_fps]);

	
_nearby = _position nearObjects ["building",_radius];
_nearbyCount = count _nearby;
if (_nearbyCount < 1) exitwith 
{
//	if ((dayz_spawnZombies < _maxWildZombies) and !_inVehicle) then {
//		[_position] call wild_spawnZombies;
//	};
};

// little hack so that only 1/4 of the max local spawnable zombies will be spawned in this round
// make the spawn smoother along player's journey
if (_maxZombies == dayz_maxLocalZombies) then {
	dayz_spawnZombies = dayz_spawnZombies max floor(dayz_maxLocalZombies*3/4);
};

//Make sure zeds always spawn no matter the timeout
//if (dayz_spawnZombies == 0) then {
	_force = true;
//};

_bldcount = 0;
{
	_type = typeOf _x;
	_config = configFile >> "CfgBuildingLoot" >> _type;
	_canLoot = isClass (_config);
	_dis = _x distance player;
	_checkLoot = ((count (getArray (_config >> "lootPos"))) > 0);
	_x setVariable ["cleared",false,true];
	
	//Loot
	if ((_dis < 120) and (_dis > 30) and _canLoot and !_inVehicle and _checkLoot) then {
		_looted = (_x getVariable ["looted",-0.1]);
		_dateNow = (DateToNumber date);
		_age = (_dateNow - _looted) * 525948;
		//diag_log ("SPAWN LOOT: " + _type + " Building is " + str(_age) + " old" );
		if (_age < -0.1) then {
				_x setVariable ["looted",(DateToNumber date),true];
		} else {
			if (_age > 30) then {
				_x setVariable ["looted",_dateNow,true];
				[_x] spawn building_spawnLoot;
			};
		};
	};
	//Zeds
	if (_force OR {(time - dayz_spawnWait > dayz_spawnDelay)}) then {
		if ((dayz_CurrentZombies < dayz_maxGlobalZombies) and {(_canLoot OR {(_x call _fairSize)})}) then {
			if (dayz_spawnZombies < _maxZombies) then {
				//[_radius, _position, _inVehicle, _dateNow, _age, _locationstypes, _nearestCity, _maxZombies] call player_spawnzedCheck;
				_zombied = (_x getVariable ["zombieSpawn",-0.1]);
				_dateNow = (DateToNumber date);
				_age = (_dateNow - _zombied) * 525948;
				if (_age < -0.1) then {
					_x setVariable ["zombieSpawn",(DateToNumber date),true]; // a SV for all objects on the map was a bit insane
				} else {
					if (_age > 1) then {
						//_bPos = getPosATL _x;
						//_zombiesNum = {alive _x} count (_bPos nearEntities ["zZombie_Base",(((sizeOf _type) * 2) + 10)]);
						//if (_zombiesNum == 0) then {
						_x call building_spawnZombies; // <-- returns the quantity of spawned zombies
						//};
						_x setVariable ["zombieSpawn",_dateNow,true]; // 
					};
//					diag_log (format["%1 building. %2", __FILE__, _x]);
				};	
			} else {
				dayz_spawnWait = time;
			};
		};
	};

} forEach _nearby;
