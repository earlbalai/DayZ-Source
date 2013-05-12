private ["_centerPos","_placePrecision","_placeMaxGradient","_placeMinDistance","_placeSearchRadius","_placeSearchExpr","_baseClass","_basePos","_basePosCheck","_nextBasePos"];

_centerPos = getMarkerPos "center";
_placePrecision = 20;
_placeMaxGradient = 0.3;
_placeMinDistance = 1000;
_placeSearchRadius = 7500;
_placeSearchExpr = "(5 * forest) + (4 * trees) + (3 * meadow) - (9 * houses) - (10 * sea)";
_amount = 0;
_radius = 0;
_baseClass = ["Camp1_INS","Camp2_INS","Camp1_US","Camp2_US","Camp3_US","Camp1_RU","Camp2_RU","Camp1_INS","Camp2_INS","Camp1_US"];

_baseClass = _baseClass call BIS_fnc_selectRandom;

_small = ["Camp1_INS","Camp2_INS","Camp1_US"];
_medium = ["Camp2_US","Camp3_US","Camp1_RU","Camp2_RU"];
_large = [];


if (_baseClass in _small) then { _amount = 10; _radius = 100; };
if (_baseClass in _medium) then { _amount = 25; _radius = 150; };
if (_baseClass in _large) then { _amount = 40; _radius = 200; };

_lootradius = _radius /2;

_basePos = selectBestPlaces [_centerPos, _placeSearchRadius, _placeSearchExpr, _placePrecision, 1];
_basePos = (_basePos select 0) select 0;

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

//_basePos = [3798.28,13271.7,0];

[_basePos, (floor(random 360)), _baseClass] call spawnComposition;

_basePos = [_basePos select 0,_basePos select 1,0];

_lootTable = ["Residential"] call BIS_fnc_selectRandom;
_itemTypes =	[] + getArray (configFile >> "CfgBuildingLoot" >> _lootTable >> "lootType");
_index = dayz_CBLBase  find _lootTable;
_weights =		dayz_CBLChances select _index;
_cntWeights = count _weights;

_totalcnt = round (random 5 + 1);

for "_x" from 1 to (round(random 5) + 1) do {
	//create loot
	_index = floor(random _cntWeights);
	_index = _weights select _index;
	_itemType = _itemTypes select _index;
	[_itemType select 0, _itemType select 1, _basePos, _lootradius] call spawn_loot;

	diag_log(format["Infected Camps: Loot spawn at '%1' with loot table '%2'", _baseClass, str(_itemType)]); 

	// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
	_nearby = _basePos nearObjects ["ReammoBox", _radius];
	{
		_x setVariable ["permaLoot",true];
	} forEach _nearBy;
};
//_basePos,_radius

Server_InfectedCamps set [count Server_InfectedCamps, [_basePos,_amount,_radius]];

dayzInfectedCamps = Server_InfectedCamps;
publicVariable "dayzInfectedCamps";

/*
_trigger = createTrigger["EmptyDetector",_basePos];
_trigger setTriggerArea[_radius,_radius,0,false];
_trigger setTriggerActivation["ANY","NOT PRESENT",false];
_trgcode = format["[%1,%2] spawn camp_spawnZombies;",_basePos,_amount];
_trigger setTriggerStatements["player in thislist", _trgcode, ""];

_markerstr = createMarker [format["BaseCamp_%1", random 50], _basePos];
_markerstr setMarkerColor "ColorRed";
_markerstr setMarkerShape "ELLIPSE";
_markerstr setMarkerBrush "Border";
_markerstr setMarkerSizeLocal [_radius, _radius];
*/

diag_log format ["File:%3, BaseCamp: %1, Location: %2", _basePos, _baseClass,__FILE__];

_basePos
