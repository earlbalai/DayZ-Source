private["_world","_nearestCity","_town","_townname","_first","_days","_config","_name","_position","_radiusA","_radiusB","_markerstr"];

_world = toUpper(worldName); 
//_locationtype = ["Wild"];
_locationtype = ["NameCityCapital","NameCity","NameVillage"];
_nearestCity = [_locationtype, [getMarkerPos "center",8000]] call BIS_fnc_locations;

{
_class = _x getVariable "class";
_townname = _x getVariable "name";
_type = _x getVariable "type";

	//_config = 		configFile >> "CfgWorlds" >> worldName >> "Names";
	
	_name = 		getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> _class >> "name");
	_position = 	getArray (configFile >> "CfgWorlds" >> worldName >> "Names" >> _class >> "position");
	_radiusA = 		getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> _class >> "radiusA");
	_radiusB = 		getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> _class >> "radiusB");
	
	_markerstr = createMarker["markername_" +str (_name), _position];
	_markerstr setMarkerText _name;
	_markerstr setMarkerColor "ColorGreen";
	_markerstr setMarkerShape "ELLIPSE";
	_markerstr setMarkerBrush "Grid";
	_markerstr setMarkerSize [_radiusA, _radiusB];

/*	
	_trigger = createTrigger["EmptyDetector",_position];
	_trigger setTriggerArea[_radiusA,_radiusB,0,false];
	_trigger setTriggerActivation["WEST","PRESENT",true];
	_trigger setTriggerStatements["this", "['Wild'] call player_spawnCheck", ""];
	_trigger setTitleEffect ["TEXT", "PLAIN DOWN", "NP: Testing"];
*/
	
} foreach _nearestCity

