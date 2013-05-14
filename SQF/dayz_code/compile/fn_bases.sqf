private ["_centerPos","_placePrecision","_placeMaxGradient","_placeMinDistance","_placeSearchRadius","_placeSearchExpr","_baseClass","_basePos","_basePosCheck","_nextBasePos"];

_centerPos = getMarkerPos "center";
_placePrecision = 20;
_placeMaxGradient = 0.3;
_placeMinDistance = 300;
_placeSearchRadius = 4500;
_placeSearchExpr = "(5 * forest) + (4 * trees) + (3 * meadow) - (9 * houses) - (10 * sea)";
_baseClass = ["Camp2_Small","Camp3_Small","Camp1_Small"];

_baseClass = _baseClass call BIS_fnc_selectRandom;

_small = ["Camp1_Small","Camp2_Small","Camp3_Small"];
_medium = ["Camp2_Medium","Camp3_Medium","Camp4_Medium","Camp5_Medium"];
_large = [];

//declaration of local vars
_amount = 0;
_radius = 0;
_lootMinRadius = 0; 
_lootMaxRadius = 0; 
_objectMinRadius = 0; 
_objectMaxRadius = 0; 
_randomObjects = 0; 
_guaranteedObjects = 0; 
_randomLoot = 0; 
_guaranteedLoot = 0;

if (_baseClass in _small) then { _amount = 10; _radius = 100; _lootMinRadius = 5; _lootMaxRadius = 10; _objectMinRadius = 10; _objectMaxRadius = 20; _randomObjects = 8; _guaranteedObjects = 2; _randomLoot = 5; _guaranteedLoot = 1; };
if (_baseClass in _medium) then { _amount = 25; _radius = 150; _lootMinRadius = 5; _lootMaxRadius = 10; _objectMinRadius = 10; _objectMaxRadius = 20; _randomObjects = 8; _guaranteedObjects = 2; _randomLoot = 5; _guaranteedLoot = 1; };
if (_baseClass in _large) then { _amount = 40; _radius = 200; _lootMinRadius = 5; _lootMaxRadius = 10; _objectMinRadius = 10; _objectMaxRadius = 20; _randomObjects = 8; _guaranteedObjects = 2; _randomLoot = 5; _guaranteedLoot = 1; };

_lootradius = _radius /3;

_basePos = selectBestPlaces [_centerPos, _placeSearchRadius, _placeSearchExpr, _placePrecision, 1];
_basePos = (_basePos select 0) select 0;
_nextBasePos = _basePos findEmptyPosition [10, (_placeSearchRadius / 20)];
_basePos = _nextBasePos;
_basePosCheck = _basePos isFlatEmpty [10, 0, _placeMaxGradient, (_placePrecision / 2), 0, false, objNull];


/*
while { (count _basePosCheck) == 0 } do {
	_nextBasePos = _basePos findEmptyPosition [10, (_placeSearchRadius / 20)];
	_basePos = _nextBasePos;
	_basePosCheck = _basePos isFlatEmpty [10, 0, _placeMaxGradient, (_placePrecision / 2), 0, false, objNull];
};
*/

if (count(_basePosCheck) > 0) then {
	_basePos = _basePosCheck;
};

_basePos = [_basePos select 0,_basePos select 1,0];

[_basePos, (floor(random 360)), _baseClass] call spawnComposition;


//_systemmarker = createVehicle ["Sign_sphere10cm_EP1", _basePos, [], 0, "none"];

_lootTable = ["InfectedCamps"] call BIS_fnc_selectRandom;
_itemTypes =	[] + getArray (configFile >> "CfgBuildingLoot" >> _lootTable >> "lootType");
_index = dayz_CBLBase  find _lootTable;
_weights =		dayz_CBLChances select _index;
_cntWeights = count _weights;

for "_x" from 1 to (round(random _randomLoot) + _guaranteedLoot) do {
	//create loot
	_index = floor(random _cntWeights);
	_index = _weights select _index;
	_itemType = _itemTypes select _index;
	
	_position = [_basePos,_lootMinRadius,_lootMaxRadius,0,0,0,0] call BIS_fnc_findSafePos;
	_position = [_position select 0,_position select 1,0];
	
	_clutter = createVehicle ["ClutterCutter_small_2_EP1", _position, [], 0, "CAN_COLLIDE"];
	_clutter setPos _position;
	
	[_itemType select 0, _itemType select 1, _position, _lootMaxRadius] call spawn_loot;

	diag_log(format["Infected Camps: Loot spawn at '%1:%3' with loot table '%2'", _baseClass, str(_itemType),_position]); 

	// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
	_nearby = _basePos nearObjects ["ReammoBox", _lootMaxRadius + 5];
	{
		_x setVariable ["permaLoot",true];
	} forEach _nearBy;
};

for "_x" from 1 to (round(random _randomObjects) + _guaranteedObjects) do {
	_position = [_basePos,_objectMinRadius,_objectMaxRadius,0,0,0,0] call BIS_fnc_findSafePos;
	_position = [_position select 0,_position select 1,0];
	_Bodys = ["Body1","Body2"] call BIS_fnc_selectRandom;
	_randomvehicle = ["LADAWreck","BMP2Wreck","UralWreck","HMMWVWreck","T72Wreck"] call BIS_fnc_selectRandom;
	_chance = random 1;
	if (_chance < 0.9) then {
		_DeadBody = _Bodys createVehicle _position;
	} else {
		_wreck = _randomvehicle createVehicle _position;
	};
};

//_basePos,_radius

Server_InfectedCamps set [count Server_InfectedCamps, [_basePos,_amount,_radius]];

dayzInfectedCamps = Server_InfectedCamps;
publicVariable "dayzInfectedCamps";

diag_log format ["File:%3, BaseCamp: %1, Location: %2", _basePos, _baseClass,__FILE__];

_basePos
