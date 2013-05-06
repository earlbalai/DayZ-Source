// _this #0: building object where zombies spawn

private ["_obj", "_type", "_config", "_canLoot", "_unitTypes", "_min", "_max", "_num", "_num0", "_zombieChance", "_i", "_halfBuildingSize", "_rnd", "_wholeAreaSize", "_minSector", "_spawnSize", "_minRadius", "_rangeRadius", "_rangeAngle", "_minAngle", "_deg", "_radius", "_bsz_pos", "_clean", "_posList"];

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


	_num0 = _min + floor(random(_max - _min + 1));
	_zombieChance =	getNumber (_config >> "zombieChance");

	_halfBuildingSize = (sizeOf _type) / 3; // I put 3 because sizeOf is very loose
	_rnd = random 1;
	if (_rnd > _zombieChance) then {
		// Add Walking Zombies
		_wholeAreaSize = 40; // for external walking zombies, area size around building where zombies can spawn
		_minSector = 5; // in degree. Only the opposite sector of the building, according to Player PoV, will be used as spawn. put 360 if you want they spawn all around the building
		_spawnSize = (sizeOf "zZombie_Base") max (_halfBuildingSize / 2);
		_minRadius = _halfBuildingSize + _spawnSize + (player distance _obj);
		_rangeRadius = _spawnSize max (_wholeAreaSize - _spawnSize - _minRadius);
		_rangeAngle = _minSector max (2 * ((_halfBuildingSize - _spawnSize) atan2 (player distance _obj)));
		_minAngle = ([_obj, player] call BIS_fnc_dirTo) + 180 - _rangeAngle / 2;
		//diag_log(format["%1 _wholeAreaSize:%2 _minRadius:%3 _rangeRadius:%4 _rangeAngle:%5, _halfBuildingSize:%6", __FILE__, _wholeAreaSize, _minRadius, _rangeRadius, _rangeAngle, _halfBuildingSize]);
		for [{_num = _num0}, {_num > _num0 / 2)}, {}] do { // random to add some fuzzy logic since _num is always few units
			_deg = _minAngle + random _rangeAngle;
			_radius = _minRadius + random _rangeRadius;
			_bsz_pos = getPos player;
			_bsz_pos = [(_bsz_pos select 0) + _radius * sin(_deg), (_bsz_pos select 1) + _radius * cos(_deg), 0];
			_bsz_pos = (_bsz_pos) findEmptyPosition [0, _spawnSize, "zZombie_Base"];
			if (((count _bsz_pos >= 2)  // check that findEmptyPosition found something for us
				AND {(({isPlayer _x} count (_bsz_pos nearEntities ["CAManBase",30])) == 0)}) // check position is far enough from any player
				AND {(!([_bsz_pos, true] call fnc_isInsideBuilding))}) then { // check position is outside any buildings
				diag_log(format["%1 zombie spawned at %2 near %3",__FILE__, _bsz_pos, typeOf _obj]);
				_num = _num - 1;
				[_bsz_pos,true,_unitTypes] call zombie_generate;
			};
		};

		//Add Internal Zombies according to what remains in _num
		_clean = {alive _x} count (getPosATL _obj nearEntities ["zZombie_Base", _halfBuildingSize]) == 0;
		if (_clean) then {
			_posList =	getArray (_config >> "lootPos");
			while {(_num > 0) AND ((count _posList) > 0)} do {
				_bsz_pos = _posList call BIS_fnc_selectRandom;
				_posList = _posList - [_bsz_pos];
				_bsz_pos = _obj modelToWorld _bsz_pos;
				if (({isPlayer _x} count (_bsz_pos nearEntities ["CAManBase",30])) == 0) then { // check position is far enough from any player
					diag_log(format["%1 zombie spawned at %2 inside %3",__FILE__, _bsz_pos, typeOf _obj]);
					//diag_log format["Building: %1 / Positions: %2 / Chance: %3",_type,_bsz_pos,_zombieChance];
					[_bsz_pos,false,_unitTypes] call zombie_generate;
					_num = _num - 1;
				};
			};
		};
		if (_num > 0) then {
			diag_log(format["%1 %2 zombies wasted",__FILE__, _num]);
		};
	};
	dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
};
