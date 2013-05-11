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

if (_baseClass in _small) then { _amount = 10; _radius = 20; };
if (_baseClass in _medium) then { _amount = 25; _radius = 40; };
if (_baseClass in _large) then { _amount = 40; _radius = 80; };

_basePos = selectBestPlaces [_centerPos, _placeSearchRadius, _placeSearchExpr, _placePrecision, 1];
_basePos = (_basePos select 0) select 0;


_basePosCheck = _basePos isFlatEmpty [10, 0, _placeMaxGradient, (_placePrecision / 2), 0, false, objNull];
while { (count _basePosCheck) == 0 } do {
	_nextBasePos = _basePos findEmptyPosition [10, (_placeSearchRadius / 20)];
	_basePos = _nextBasePos;
	_basePosCheck = _basePos isFlatEmpty [10, 0, _placeMaxGradient, (_placePrecision / 2), 0, false, objNull];
};

if (count(_basePosCheck) > 0) then {
	_basePos = _basePosCheck;
};

//_basePos = [3798.28,13271.7,0];

[_basePos, (floor(random 360)), _baseClass] call spawnComposition;

_trigger = createTrigger["EmptyDetector",_basePos];
_trigger setTriggerArea[_radius,_radius,0,false];
_trigger setTriggerActivation["ANY","NOT PRESENT",false];
_trgcode = format["[%1,%2] spawn camp_spawnZombies;",_basePos,_amount];
_trigger setTriggerStatements["player in thislist", _trgcode, ""];


if ("ItemMap_Debug" in items player) then {
	_markerstr = createMarker [format["BaseCamp_%1", random 50], _basePos];
	_markerstr setMarkerColor "ColorYellow";
	_markerstr setMarkerShape "ELLIPSE";
	_markerstr setMarkerBrush "Border";
	_markerstr setMarkerSizeLocal [_radius, _radius];
};

diag_log format ["BaseCamp: %1, Location: %2", _basePos, _baseClass];

_basePos
