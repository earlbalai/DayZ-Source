

private ["_type",   "_fairSize", "_boundingBox", "_cornerLow", "_cornerHi", "_burried", "_isAir",
"_inVehicle", "_dateNow", "_age", "_force", "_nearbyBuildings", "_position", "_maxControlledZombies",
"_controlledZombies", "_maxManModels", "_radius", "_currentManModels", "_locationstypes", "_nearestCity", 
"_townname", "_nearbytype", "_markerstr", "_markerstr1", "_markerstr2", "_markerstr3",
"_nearby", "_nearbyCount", "_maxWildZombies", "_config", "_canLoot", "_dis", "_checkLoot", "_looted", "_zombied",
"_qty", "_zombieSpawnCtr", "_suitableBld", "_spwndoneBld","_negstampBld"];

_type = _this select 0;
 
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
_inVehicle = ((vehicle player != player) AND (speed player > 10));
_dateNow = (DateToNumber date);
_age = -1;
_force = false;
_nearbyBuildings = [];
_position = getPosATL player;

_maxControlledZombies = dayz_maxLocalZombies min (10 + (0 max round(diag_fps * 2 - 50)));
if (_inVehicle) then {
	_maxControlledZombies = 5;
};
if (_isAir) then {
	_maxControlledZombies = 0;
};
_controlledZombies = {local (_x getVariable ["agentObject",objNull])} count agents;
_maxManModels = dayz_maxMaxModels;
_radius = dayz_spawnArea;
_currentManModels = count (_position nearEntities ["CAManBase",_radius]);


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
		_maxControlledZombies = 30;
	};
	case "NameCity": {
		//_radius = 300; 
		_maxControlledZombies = 40;
	};
	case "NameCityCapital": {
		//_radius = 400; 
		_maxControlledZombies = 40;
	};
};
*/


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

//diag_log ("SpawnWait: " +str(time - dayz_spawnWait));
//diag_log ("Controled: " +str(_controlledZombies) + "/" +str(_maxControlledZombies));
//diag_log ("Models: " +str(_currentManModels) + "/" +str(_maxManModels));

diag_log ("Audial Noise: " +str(DAYZ_disAudial));
diag_log ("Visual Sight: " +str(DAYZ_disVisual /2));
};
diag_log (format["%1 Controlled: %2/%3. Models: %5/%6 (radius:%7m %8fps).", __FILE__,
	_controlledZombies, _maxControlledZombies, time - dayz_spawnWait, _currentManModels, _maxManModels, _radius, round diag_fps]);
// little hack so that only 1/5 of the max local spawnable zombies will be spawned in this round
// make the spawn smoother along player's journey
_controlledZombies = _controlledZombies max floor(_maxControlledZombies*.8);

// we start by the closest buildings. building too close from player are ditched.	
_nearby = (nearestObjects [_position, ["building"],_radius]) - (_position nearObjects ["building", dayz_safeDistPlr]);

_nearbyCount = count _nearby;
if (_nearbyCount < 1) exitwith 
{
//	if ((_controlledZombies < _maxWildZombies) and !_inVehicle) then {
//		[_position] call wild_spawnZombies;
//	};
};

_zombieSpawnCtr = 0;
_suitableBld = 0;
_spwndoneBld = 0;
_negstampBld = 0;
{
	_type = typeOf _x;
	_config = configFile >> "CfgBuildingLoot" >> _type;
	_canLoot = isClass (_config);
	_dis = _x distance player;
	_checkLoot = ((count (getArray (_config >> "lootPos"))) > 0);
	_x setVariable ["cleared",false,true];
	
	//Loot
	if ((_dis < 120) and (_dis > dayz_safeDistPlr) and _canLoot and !_inVehicle and _checkLoot) then {
		_looted = (_x getVariable ["looted",-0.1]);
		_dateNow = (DateToNumber date);
		_age = (_dateNow - _looted) * 525948;
		//diag_log ("SPAWN LOOT: " + _type + " Building is " + str(_age) + " old" );
		if (_age < -0.1) then {
				_x setVariable ["looted",(DateToNumber date),true];
		} else {
			if (_age > 30) then {
				_x setVariable ["looted",_dateNow,true];
				_x call building_spawnLoot;
			};
		};
	};
	//Zeds
	if ((_currentManModels < _maxManModels) and {(_controlledZombies < _maxControlledZombies)}) then {
		if (_canLoot OR {(_x call _fairSize)}) then {
			//[_radius, _position, _inVehicle, _dateNow, _age, _locationstypes, _nearestCity, _maxControlledZombies] call player_spawnzedCheck;
			_suitableBld = _suitableBld +1;
			_zombied = (_x getVariable ["zombieSpawn",-0.1]);
			_dateNow = (DateToNumber date);
			_age = (_dateNow - _zombied) * 525948; // in minutes
			if (_age < -0.1) then {
				_x setVariable ["zombieSpawn",(DateToNumber date),true]; // a SV for all objects on the map was a bit insane
				_negstampBld = _negstampBld +1;
			} else {
				if (_age > 10) then {
					_qty = _x call building_spawnZombies;
					if (_qty > 0) then {
						_controlledZombies = _controlledZombies + _qty;
						_currentManModels = _currentManModels + _qty;
						_x setVariable ["zombieSpawn",_dateNow,true];
					};
					_spwndoneBld = _spwndoneBld +1;
				}
				else {
					_zombieSpawnCtr = _zombieSpawnCtr +1;
				};
//					diag_log (format["%1 building. %2", __FILE__, _x]);
			};	
		};
	};
} forEach _nearby;
diag_log (format["%1 End. Buildings checked:%2, newly zombied:%3, already zombied:%4, negative timestamp:%5.", __FILE__,
	_suitableBld, _spwndoneBld, _zombieSpawnCtr, _negstampBld ]);
