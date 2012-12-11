_isAir = vehicle player iskindof "Air";
_inVehicle = (vehicle player != player);
_dateNow = (DateToNumber date);
_maxZombies = dayz_maxLocalZombies;

_age = -1;

// If they just got out of a vehicle, boost their per-player zombie limit by 5 in hopes of allowing insta-spawn zombies
if (dayz_inVehicle and !_inVehicle) then {
    dayz_spawnWait = -300;
    //_maxZombies = _maxZombies + 2;
};
dayz_inVehicle = _inVehicle;


//diag_log("SPAWN CHECKING: Starting");
	_radius = 300; 
	_locationstypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];
	_nearestCity = nearestLocations [getPos player, _locationstypes, _radius];
	
	_position = getPosATL player;
	if ((count _nearestCity) > 0) then {
		_position = position (_nearestCity select 0);  	
	};
	
	_nearbytype = type (_nearestCity select 0);
	
switch (_nearbytype) do {
	case "Hill": {
		_radius = 50; 
		_maxZombies = 30;
	};
	case "NameLocal": {
		_radius = 100; 
		_maxZombies = 40;
	};
	case "NameVillage": {
		_radius = 150; 
		_maxZombies = 50;
	};
	case "NameCity": {
		_radius = 200; 
		_maxZombies = 60;
	};
	case "NameCityCapital": {
		_radius = 300; 
		_maxZombies = 80;
	};
	default {
		_radius = 100; 
		_maxZombies = 40;
	};	
};

if (_inVehicle) then {
	_maxZombies = _maxZombies / 2;
};
	
	_tooManyZs = count (getPosATL player nearEntities ["zZombie_Base",_radius * 2]) > _maxZombies;
	_nearbyplayer = nearestObjects [player, ["Building"], _radius];
	{
        _type = typeOf _x;
        _config =       configFile >> "CfgBuildingLoot" >> _type;
        _canZombie = isClass (_config);
        _dis = _x distance player;	
		
		if (_canZombie) then {
			if (dayz_spawnZombies < _maxZombies) then {
				if (!_tooManyZs) then {
					private["_zombied"];
					_zombied = (_x getVariable ["zombieSpawn",-0.1]);
					_dateNow = (DateToNumber date);
					_age = (_dateNow - _zombied) * 525948;
					//diag_log(format["Date: %1 | ZombieSpawn: %2 | age: %3 | building: %4 (%5)", _dateNow, _zombied, _age, str(_x), _dis]);
					if (_age > 1) then {
						_bPos = getPosATL _x;
						_zombiesNum = count (_bPos nearEntities ["zZombie_Base",(((sizeOf _type) * 2) + 10)]);
						_withinRange = _x distance player < 100;
						//diag_log ("ZombiesNum: " +str(_zombiesNum));
						if ((_zombiesNum == 0) and _withinRange) then {
						//Randomize Zombies
							_x setVariable ["zombieSpawn",_dateNow,true];
							[_x] call building_spawnZombies;
						};
					};
				};
			};
		};
	} forEach _nearbyplayer;