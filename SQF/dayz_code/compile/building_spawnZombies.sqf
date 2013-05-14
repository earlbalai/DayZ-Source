
// _this select 0: building object where zombies should spawn
// (optional) _this select 1: array of recyclable agents
// (optional) _this select 2: max quantity of agents to newly create
// returns: quantity of zombies spawned
// "building" should be a building lootable OR big enough to hide a zombie
// zombies will spawn inside (1/3 chance roughly) or outside the building (in a piesize area behind the building)

private ["_this","_obj","_recyAgt","_maxtoCreate","_type","_config","_default","_unitTypes","_min","_max","_num0","_num","_zombieChance","_halfBuildingSize","_rnd","_clean","_x","_posList","_bsz_pos","_cantSee","_tmp","__FILE__","_wholeAreaSize","_minSector","_spawnSize","_minRadius","_rangeRadius","_rangeAngle","_minAngle","_i","_deg","_radius"];

_cantSee = {
	private ["_zPos","_fov","_safeDistance","_farDistance","_isok","_eye","_deg"];

	_zPos = ATLtoASL +(_this select 0); 
	_fov = _this select 1; // players half field of view
	_safeDistance = _this select 2; // minimum distance. closer is wrong
	_farDistance = _this select 3; // distance further we won't check
	_zPos set [2, (_zPos select 2) + 1.80]; // Z head is 1.80 meters from his feet (even hunchbacked ones)
	_isok = true;
	{
		if (_x distance _zPos < _farDistance) then {
			if (_x distance _zPos < _safeDistance) then {
				_isok = false
			}
			else {
				_eye = eyePos _x; // ASL
				_deg = [_x,_zPos] call BIS_fnc_relativeDirTo;
				if (_deg > 180) then { _deg = _deg - 360; };
				if ((abs(_deg) < _fov) AND {( // in right angle sector?
						(!(terrainIntersectASL [_zPos, _eye])  // no terrain between?
						AND {(!(lineIntersects [_zPos, _eye]))}) // and no object between?
					)})  then {
					_isok = false
				};
			};
		};
		if (!_isok) exitWith {false};
	} forEach playableUnits;

	_isok
};

//diag_log(str(_this));
_obj = _this select 0;
_recyAgt = []; if (count _this > 1) then { _recyAgt = _this select 1; };
_maxtoCreate = 99; if (count _this > 2) then { _maxtoCreate = _this select 2; };

_type = typeOf _obj;
_config = configFile >> "CfgBuildingLoot" >> _type;
if (!isClass (_config)) then {
	_config = configFile >> "CfgBuildingLoot" >> _default; // spawn even on non lootable building
};

//Get zombie class
_unitTypes = getArray (_config >> "zombieClass");
_min = getNumber (_config >> "minRoaming");
_max = getNumber (_config >> "maxRoaming");

_num0 = _min + floor(random(_max - _min + 1));
// we control the overall density, in order to prevent to many spawns on the same small area
// since player_spawnCheck  checks the quantity of models in dayz_spawnArea radius, let's take a part of it:
// we control the same Z density on a 16x smaller disk.
_num0 = _num0 min (0 max ceil((dayz_maxMaxModels / 16) - (count ((getPosATL _obj) nearEntities ["CAManBase", dayz_spawnArea / 4]))));
_num = _num0;
_zombieChance = getNumber (_config >> "zombieChance");

_halfBuildingSize = (sizeOf _type) / 3; // I put 3 because sizeOf is very loose
_rnd = random 1;
if ((_rnd > _zombieChance) AND {(_num0 > 0)}) then {
	//Add Internal Zombies
	_clean = {alive _x} count (getPosATL _obj nearEntities ["zZombie_Base", _halfBuildingSize]) == 0;
	if (_clean) then {
		_posList = getArray (_config >> "lootPos");
		for [{_num = _num0}, {(count _posList > 0) AND (_num >= 2 * _num0 / 3) AND (_num > 0)}, {}] do {
			_bsz_pos = _posList call BIS_fnc_selectRandom;
			_posList = _posList - [_bsz_pos];
			if (count _bsz_pos >= 2) then { // sometime pos from config is empty :(
				_bsz_pos = _obj modelToWorld _bsz_pos;
				if ([_bsz_pos, dayz_cantseefov, dayz_safeDistPlr, dayz_cantseeDist] call _cantSee) then { // check that player won't see the spawning zombie
					_tmp = [_bsz_pos, false, _unitTypes, _recyAgt, _maxtoCreate];
					if (_tmp call zombie_generate) then {
						diag_log(format["%1 Zombie spawned at %2 inside %3  (%4/%5)",__FILE__, 
										_bsz_pos, typeOf _obj, 1+_num0-_num, _num0]);
						_num = _num - 1;
						_recyAgt = _tmp select 3;
						_maxtoCreate = _tmp select 4;
					};
				};
			};
		};
	};

	// Add remaining Z as walking Zombies (outside the building)
	_wholeAreaSize = 40; // for external walking zombies, area size around building where zombies can spawn
	_minSector = 5; // in degree. Only the opposite sector of the building, according to Player PoV, will be used as spawn. put 360 if you want they spawn all around the building
	_spawnSize = (sizeOf "zZombie_Base") max (_halfBuildingSize / 2); // smaller area size inside the sector where findEmptyPosition is asked to find a spot
	_minRadius = _halfBuildingSize + _spawnSize + (player distance _obj);
	_rangeRadius = _spawnSize max (_wholeAreaSize - _spawnSize);
	_rangeAngle = _minSector max (2 * ((_halfBuildingSize - _spawnSize) atan2 (player distance _obj)));
	_minAngle = ([_obj, player] call BIS_fnc_dirTo) + 180 - _rangeAngle / 2;
	//diag_log(format["%1 _wholeAreaSize:%2 _minRadius:%3 _rangeRadius:%4 _rangeAngle:%5, _halfBuildingSize:%6", __FILE__, _wholeAreaSize, _minRadius, _rangeRadius, _rangeAngle, _halfBuildingSize]);
	for [{_i = _num * 3}, {(_num > 0) AND (_i > 0)}, {_i = _i - 1}] do { 
		_deg = _minAngle + random _rangeAngle;
		_radius = _minRadius + random _rangeRadius;
		_bsz_pos = getPosATL player;
		_bsz_pos = [(_bsz_pos select 0) + _radius * sin(_deg), (_bsz_pos select 1) + _radius * cos(_deg), 0];
		_bsz_pos = (_bsz_pos) findEmptyPosition [0, _spawnSize, "zZombie_Base"];
		if (((count _bsz_pos >= 2) // check that findEmptyPosition found something for us
			AND {(!([_bsz_pos, true] call fnc_isInsideBuilding))}) // check position is outside any buildings
			AND {([_bsz_pos, dayz_cantseefov, dayz_safeDistPlr, dayz_cantseeDist] call _cantSee)}) then {  // check that player won't see the spawning zombie
			_tmp = [_bsz_pos, true, _unitTypes, _recyAgt, _maxtoCreate];
			if (_tmp call zombie_generate) then {
				diag_log(format["%1 Zombie spawned at %2 near %3  (%4/%5)",__FILE__, 
								_bsz_pos, typeOf _obj, 1+_num0-_num, _num0]);
				_num = _num - 1;
				_recyAgt = _tmp select 3;
				_maxtoCreate = _tmp select 4;
			};	
		};
	};
};
if (_num < _num0) then { 
	dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
};
/*
if (_num > 0) then {
	diag_log(format["%1 Failed to find a nice spot for %2 Zombies at %3 %4",__FILE__, 
					_num, typeOf _obj, getPosATL _obj]);
};
*/
_this set [1, _recyAgt];
_this set [2, _maxtoCreate];

(_num0 - _num)
