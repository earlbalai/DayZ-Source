private ["_centerPos","_placePrecision","_placeMaxGradient","_placeMinDistance","_placeSearchRadius","_placeSearchExpr","_baseClass","_basePos","_basePosCheck","_nextBasePos"];

_centerPos = getMarkerPos "center";
_placePrecision = 20;
_placeMaxGradient = 0.3;
_placeMinDistance = 1000;
_placeSearchRadius = 7500;
_placeSearchExpr = "(5 * forest) + (4 * trees) + (3 * meadow) - (9 * houses) - (10 * sea)";
_baseClass = "Camp1_INS";

_basePos = selectBestPlaces [_centerPos, _placeSearchRadius, _placeSearchExpr, _placePrecision, 1];
_basePos = (_basePos select 0) select 0;


_basePosCheck = _basePos isFlatEmpty [10, 0, _placeMaxGradient, (_placePrecision / 2), 0, false, objNull];
while { (count _basePosCheck) == 0 } do {
	_nextBasePos = _basePos findEmptyPosition [10, (_placeSearchRadius / 20)];
	if (count(_nextBasePos) == 0 || (_basePos distance _nextBasePos) == 0)
		exitWith { diag_log("Could not find ideal base location"); };

	_basePos = _nextBasePos;
	_basePosCheck = _basePos isFlatEmpty [10, 0, _placeMaxGradient, (_placePrecision / 2), 0, false, objNull];
};

if (count(_basePosCheck) > 0) then {
	_basePos = _basePosCheck;
};

[_basePos, (floor(random 360)), _baseClass] call spawnComposition;

diag_log format ["BaseCamp: %1, Location: %2", _basePos, _baseClass];

_basePos
