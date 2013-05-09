private["_obj","_type","_config","_canLoot","_unitTypes","_min","_max","_num","_zombieChance","_rnd","_noPlayerNear","_position","_clean","_positions","_iPos","_nearBy","_nearByPlayer","_i"];

_obj = _this select 0;
_type = 		typeOf _obj;
_config = 		configFile >> "CfgBuildingLoot" >> _type;
_canLoot = 		isClass (_config);

if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 

if (_canLoot) then {
//Get zombie class
	_unitTypes = 	getArray (_config >> "zombieClass");
	_min = 			getNumber (_config >> "minRoaming");
	_max = 			getNumber (_config >> "maxRoaming");
//Walking Zombies
	//_num = round(random _max) max _min;
	_num = round(random _max) max _max;
	_config = 		configFile >> "CfgBuildingLoot" >> _type;
//Get zombie class
	_zombieChance =	getNumber (_config >> "zombieChance");
	_rnd = random 1;

	if (_rnd > _zombieChance) then {
<<<<<<< HEAD
		
		_noPlayerNear = (count ((getPosATL _obj) nearEntities ["CAManBase",30])) == 0;
		
		if (_noPlayerNear) then {
		
			//_position = _obj buildingExit 0;
			//if ((_position select 0) == 0) then {
				_position = getPosATL _obj;
			//};
		
		//diag_log ("Class: " + _type + " / Zombies: " + str(_unitTypes) + " / Walking: " + str(_num));
			for "_i" from 1 to _num do {
				[_position,true,_unitTypes] call zombie_generate;
=======
		// Add Walking Zombies
		_wholeAreaSize = 40; // for external walking zombies, area size around building where zombies can spawn
		_minSector = 5; // in degree. Only the opposite sector of the building, according to Player PoV, will be used as spawn. put 360 if you want they spawn all around the building
		_spawnSize = (sizeOf "zZombie_Base") max (_halfBuildingSize / 2);
		_minRadius = _halfBuildingSize + _spawnSize + (player distance _obj);
		_rangeRadius = _spawnSize max (_wholeAreaSize - _spawnSize - _minRadius);
		_rangeAngle = _minSector max (2 * ((_halfBuildingSize - _spawnSize) atan2 (player distance _obj)));
		_minAngle = ([_obj, player] call BIS_fnc_dirTo) + 180 - _rangeAngle / 2;
		//diag_log(format["%1 _wholeAreaSize:%2 _minRadius:%3 _rangeRadius:%4 _rangeAngle:%5, _halfBuildingSize:%6", __FILE__, _wholeAreaSize, _minRadius, _rangeRadius, _rangeAngle, _halfBuildingSize]);
		for [{_num = _num0}, {_num > _num0 / 2}, {}] do { // random to add some fuzzy logic since _num is always few units
			_deg = _minAngle + random _rangeAngle;
			_radius = _minRadius + random _rangeRadius;
			_bsz_pos = getPosATL player;
			_bsz_pos = [(_bsz_pos select 0) + _radius * sin(_deg), (_bsz_pos select 1) + _radius * cos(_deg), 0];
			_bsz_pos = (_bsz_pos) findEmptyPosition [0, _spawnSize, "zZombie_Base"];
			if (((count _bsz_pos >= 2)  // check that findEmptyPosition found something for us
				AND {(({isPlayer _x} count (_bsz_pos nearEntities ["CAManBase",30])) == 0)}) // check position is far enough from any player
				AND {(!([_bsz_pos, true] call fnc_isInsideBuilding))}) then { // check position is outside any buildings
				diag_log(format["%1 zombie spawned at %2 near %3",__FILE__, _bsz_pos, typeOf _obj]);
				_num = _num - 1;
				[_bsz_pos,true,_unitTypes] call zombie_generate;
>>>>>>> 01b17cc71a7d0837d3a9807b6a990fb05914d36d
			};
			
		};
	};

	
	//Add Internal Zombies
	_clean = {alive _x} count ((getPosATL _obj) nearEntities ["zZombie_Base",(sizeOf _type)]) == 0;
	if (_clean) then {
		_positions =	getArray (_config >> "lootPos");
		_zombieChance =	getNumber (_config >> "zombieChance");
		//diag_log format["Building: %1 / Positions: %2 / Chance: %3",_type,_positions,_zombieChance];
		{
			if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
			if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 
			_rnd = random 1;
			if (_rnd < _zombieChance) then {
				_iPos = _obj modelToWorld _x;
				_nearBy = {alive _x} count nearestObjects [_iPos, ["zZombie_Base"],5] > 0;
				_nearByPlayer = ({isPlayer _x} count (_iPos nearEntities ["CAManBase",30])) > 0;
				//diag_log ("BUILDING: " + _type + " / " + str(_nearBy) + " / " + str(_nearByPlayer));
				if (!_nearByPlayer and !_nearBy) then {
					[_iPos,false,_unitTypes] call zombie_generate;
				};
			};
		} forEach _positions;
	};
	dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
};
