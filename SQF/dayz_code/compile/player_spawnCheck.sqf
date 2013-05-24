
private ["_isAir", "_inVehicle", "_dateNow", "_age", "_force", "_nearbyBuildings", "_position", "_fpsbias", "_maxControlledZombies", "_maxManModels", "_maxWeaponHolders", "_controlledZombies", "_currentManModels", "_currentWeaponHolders", "_type", "_locationstypes", "_nearestCity", "_townname", "_nearbytype", "_markerstr", "_markerstr1", "_markerstr2", "_markerstr3", "_nearby", "_zombieSpawnCtr", "_suitableBld", "_spwndoneBld", "_negstampBld", "_recyAgt", "_findAgt", "_maxtoCreate", "_config", "_canLoot", "_dis", "_checkLoot", "_looted", "_qty", "_fairSize", "_zombied", "_tmp", "_radius", "_point"];

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

// find agents to recycle  
_findAgt = { 
	private ["_plr","_types","_y", "_point", "_ahead"];

	_plr = player;
	_ahead = 0 max (dayz_canDelete - dayz_spawnArea);
	_point = _plr modelToWorld [0, _ahead, 0]; // we will recycle more zombies located behind the player
	recyclableAgt=[];
	
	{ 
		_y = _x getVariable ["agentObject",objNull];
		if (!isNil "_y") then {
			if (((alive _y) AND {(local _y)}) AND {((damage _y == 0) AND {(_y distance _point > dayz_spawnArea+_ahead)})}) then {
				if (0 == {(_x != _plr) AND (_x distance _y < dayz_cantseeDist)} count playableUnits) then { 
					recyclableAgt set [count recyclableAgt, _y];
				};
			};
		};
	} forEach agents;
	
	recyclableAgt
};

_isAir = vehicle player iskindof "Air";
_inVehicle = ((vehicle player != player) AND (speed player > 10));
_dateNow = (DateToNumber date);
_age = -1;
_force = false;
_nearbyBuildings = [];
_position = getPosATL player;
_sp4wnAroundObjects = ["building", "SpawnableWreck"];

_fpsbias = (60-(60-(diag_fps min 60))/1.5)/60;
_maxControlledZombies = round(dayz_maxLocalZombies * _fpsbias);
_maxManModels = round(dayz_maxMaxModels * _fpsbias);
_maxWeaponHolders = round(dayz_maxMaxWeaponHolders * _fpsbias);

if (_inVehicle) then {
	_maxManModels = 10; // Z + players in vehicle
};
if (_isAir) then {
	_maxManModels = 0; // won't even try to move recycled Z
};
_controlledZombies = {local (_x getVariable ["agentObject",objNull])} count agents;

_currentManModels = count (_position nearEntities ["CAManBase",dayz_spawnArea]);
_currentWeaponHolders = count (_position nearObjects ["ReammoBox",dayz_spawnArea]); // ReammoBox = parent of all kinds of item holders
/*
//diag_log ("Type: " +str(_type));


//diag_log("SPAWN CHECKING: Starting");
       //_locationstypes = ["NameCityCapital","NameCity","NameVillage"];
       //_nearestCity = nearestLocations [getPos player, _locationstypes, dayz_spawnArea/2];
       //_townname = text (_nearestCity select 0);     
       //_nearbytype = type (_nearestCity select 0);

switch (_nearbytype) do {
       case "NameVillage": {
               //dayz_spawnArea = 250; 
               _maxControlledZombies = 30;
       };
       case "NameCity": {
               //dayz_spawnArea = 300; 
               _maxControlledZombies = 40;
       };
       case "NameCityCapital": {
               //dayz_spawnArea = 400; 
               _maxControlledZombies = 40;
       };
};



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
       _markerstr setMarkerSizeLocal [dayz_spawnArea, dayz_spawnArea];

       _markerstr1 = createMarkerLocal ["Counter", _position];
       _markerstr1 setMarkerColorLocal "ColorRed";
       _markerstr1 setMarkerShapeLocal "ELLIPSE";
       _markerstr1 setMarkerBrushLocal "Border";
       _markerstr1 setMarkerSizeLocal [dayz_spawnArea+100, dayz_spawnArea+100];
       
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
*/
diag_log (format["%1 Loc.Agents: %2/%3. Models: %5/%6 W.holders: %9/%10 (radius:%7m %8fps).", __FILE__,
	_controlledZombies, _maxControlledZombies, time - dayz_spawnWait, _currentManModels, _maxManModels, 
	dayz_spawnArea, round diag_fps, _currentWeaponHolders, _maxWeaponHolders]);
// little hack so that only 1/5 of the max local spawnable zombies will be spawned in this round
// make the spawn smoother along player's journey. Same for loot
_controlledZombies = _controlledZombies max floor(_maxControlledZombies*.8);
_currentWeaponHolders = _currentWeaponHolders max floor(_maxWeaponHolders*.8);

// we start by the closest buildings. buildings too close from player are ditched.	
_nearby = (nearestObjects [_position, _sp4wnAroundObjects,dayz_spawnArea]) - (nearestObjects [_position, _sp4wnAroundObjects, dayz_safeDistPlr]);

_zombieSpawnCtr = 0;
_suitableBld = 0;
_spwndoneBld = 0;
_negstampBld = 0;
_recyAgt = call _findAgt;
_maxtoCreate = _maxControlledZombies - _controlledZombies;
{
	_type = typeOf _x;
	_config = configFile >> "CfgBuildingLoot" >> _type;
	_canLoot = isClass (_config);
	_dis = _x distance player;
	_checkLoot = ((count (getArray (_config >> "lootPos"))) > 0);
	_x setVariable ["cleared",false,true];
	
	//Loot
	if (_currentWeaponHolders < _maxWeaponHolders) then {
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
					_qty = _x call building_spawnLoot;
					_currentWeaponHolders = _currentWeaponHolders + _qty;
				};
			};
		};
	};
	
	//Zeds
	if ((_currentManModels < _maxManModels) AND {(_canLoot OR {(_x call _fairSize)})}) then {
		if ((count _recyAgt > 0) OR {(_maxtoCreate > 0)}) then {
			//[dayz_spawnArea, _position, _inVehicle, _dateNow, _age, _locationstypes, _nearestCity, _maxControlledZombies] call player_spawnzedCheck;
			_suitableBld = _suitableBld +1;
			_zombied = (_x getVariable ["zombieSpawn",-0.1]);
			_dateNow = (DateToNumber date);
			_age = (_dateNow - _zombied) * 525948; // in minutes
			if (_age < -0.1) then {
				_x setVariable ["zombieSpawn",(DateToNumber date),true]; // a SV for all objects on the map was a bit insane
				_negstampBld = _negstampBld +1;
			} else {
				if (_age > 10) then {
					_tmp = [_x, _recyAgt, _maxtoCreate];
					_qty = _tmp call building_spawnZombies;
					_recyAgt = _tmp select 1;
					_maxtoCreate = _tmp select 2;
					if (_qty  > 0) then {
						_currentManModels = _currentManModels + _qty;
						_x setVariable ["zombieSpawn",_dateNow,true];
					};
					_spwndoneBld = _spwndoneBld +1;
				}
				else {
					_zombieSpawnCtr = _zombieSpawnCtr +1;
				};
				//diag_log (format["%1 building. %2", __FILE__, _x]);
			};
		};
	};
} forEach _nearby;

// spawn some a wild zombie if we can afford
if ((_currentManModels < _maxManModels) AND {_maxtoCreate > 0}) then {
	// we limit the surface because finding a typeless object is a CPU hog.
	_radius = (0 max (dayz_canDelete - dayz_spawnArea))/2;
	// search area is somewhere quite far, quite in the same direction as the player is facing
	// Z will be spawned quite far, beyond the radius used for buildings
	_tmp = (random 180) - 90;
	_dis = dayz_spawnArea + _radius;
	_point = player modelToWorld[sin(_tmp) * _dis, cos(_tmp) * _dis, 0];
	_nearby = nil;
	{
		_tmp = str(_x);
		// How not being seen? hide behind a bush! Great value = t_picea1s, t_picea2s, t_betula2w, b_craet2
		if ((typeOf _x == "") AND {(
			(((["t_picea1s", _tmp, false] call fnc_inString) OR 
			{(["t_picea2s", _tmp, false] call fnc_inString)})) OR 
			{((["t_betula2w", _tmp, false] call fnc_inString) OR 
			{(["b_craet2", _tmp, false] call fnc_inString)})})
		}) then { 
			_tmp = [_x, _recyAgt, _maxtoCreate, 10];
			_qty = _tmp call building_spawnZombies;
			_recyAgt = _tmp select 1;
			_maxtoCreate = _tmp select 2;
/*			if (_qty  > 0) then {
				_currentManModels = _currentManModels + _qty;
				_x setVariable ["zombieSpawn",_dateNow,true];
			};
*/
	} forEach (nearestObjects [_point, [], _radius]);	
/*	if (!isNil "_nearby") then {
		[_nearby, _recyAgt, _maxtoCreate, 10] call building_spawnZombies;
	};*/
};

diag_log (format["%1 End. Buildings checked:%2, newly zombied:%3, already zombied:%4, negative timestamp:%5.", __FILE__,
	_suitableBld, _spwndoneBld, _zombieSpawnCtr, _negstampBld ]);

};
//building_spawnZombies = {0};
//building_spawnLoot = {0}; 
fnc_usec_damageHandler = {};
player_zombieAttack = {""};
swarm_generate = {};
camp_spawnZombies = {};
player_zombieCheck= {};
//player setdamage 1; 
  
// SKODAWreck hiluxWreck datsun01Wreck  LADAWreck (house)_314 Land_Misc_GContainer_Big Land_Toilet V_2L V_2T2
// kontejner.p3d popelnice.p3d
//building_spawnZombies = {0};
//building_spawnLoot = {0}; 
//fnc_usec_damageHandler = {};
//player_zombieAttack = {};
//player_spawnCheck = {};

//player setdamage 1; 
 
//cat CfgBuildingPos.hpp | tr -d '\n'| sed 's/class/\nclass/g'|grep 'lootPos.. *= *.{{'| sed -r 's/^class ([^ ]*) *:.*$/"\1",/'


mystep=0.01;
if (isNil "curType") then {
curType = 0;
/// Hedgehog    // Land_CncBlock_D
types = ["WeaponHolder_PartGlass","Fort_RazorWire","Land_CncBlock_D","Sign_sphere25cm_EP1","Hedgehog"];
};

_init = {
	// 65 lootable buildings
	_bld = ["Camp", "CampEast", "CampEast_EP1", "Land_A_BuildingWIP", "Land_A_Castle_Bergfrit", "Land_A_Castle_Gate", "Land_A_Castle_Stairs_A", "Land_A_FuelStation_Build", "Land_A_GeneralStore_01", "Land_A_GeneralStore_01a", "Land_A_Hospital", "Land_A_MunicipalOffice", "Land_A_Office01", "Land_A_Office02", "Land_A_Pub_01", "Land_a_stationhouse", "Land_A_TVTower_Base", "Land_Barn_W_01", "Land_Barn_W_02", "Land_Church_01", "Land_Church_03", "Land_Farm_Cowshed_a", "Land_Hangar_2", "Land_Hlidac_budka", "Land_HouseBlock_A1_1", "Land_HouseB_Tenement", "Land_HouseV_1I1", "Land_HouseV_1I4", "Land_HouseV2_01A", "Land_HouseV2_02_Interier", "Land_HouseV2_04_interier", "Land_hut06", "Land_Ind_Garage01", "Land_Ind_Vysypka", "Land_Ind_Workshop01_01", "Land_Ind_Workshop01_02", "Land_Ind_Workshop01_04", "Land_Ind_Workshop01_L", "Land_KBud", "Land_kulna", "Land_Mil_Barracks_i", "Land_Mil_ControlTower", "Land_Mil_House", "Land_Misc_Cargo1Ao", "Land_Misc_Cargo1Bo", "Land_Misc_deerstand", "Land_Misc_PowerStation", "Land_Nav_Boathouse", "Land_Panelak", "Land_Panelak2", "Land_psi_bouda", "Land_Rail_House_01", "Land_rail_station_big", "Land_ruin_01", "Land_sara_domek_zluty", "Land_Shed_Ind02", "Land_Shed_W01", "Land_Shed_wooden", "Land_SS_hangar", "Land_stodola_old_open", "Land_stodola_open", "Land_Tovarna2", "Land_wagon_box", "MASH", "USMC_WarfareBFieldhHospital"
	]; 
// other buildings : 
_bld = ["FarmRoaming", "Grave", "GraveCross1", "GraveCross2", "GraveCrossHelmet", "HouseRoaming", "Land_A_statue01", "Land_Church_02", "Land_Church_02a", "Land_Church_05R", "Land_HouseBlock_A1", "Land_HouseBlock_A1_2", "Land_HouseBlock_A2", "Land_HouseBlock_A2_1", "Land_HouseBlock_A3", "Land_HouseBlock_B1", "Land_HouseBlock_B2", "Land_HouseBlock_B3", "Land_HouseBlock_B4", "Land_HouseBlock_B5", "Land_HouseBlock_B6", "Land_HouseBlock_C1", "Land_HouseBlock_C2", "Land_HouseBlock_C3", "Land_HouseBlock_C4", "Land_HouseBlock_C5", "Land_HouseV_1I2", "Land_HouseV_1I3", "Land_HouseV_1L1", "Land_HouseV_1L2", "Land_HouseV_1T", "Land_HouseV2_01B", "Land_HouseV2_03", "Land_HouseV_2I", "Land_HouseV_2T1", "Land_houseV_2T2", "Land_HouseV_3I1", "Land_HouseV_3I2", "Land_HouseV_3I3", "Land_HouseV_3I4", "Land_Ind_Shed_01_end", "Land_Ind_Shed_02_main", "Land_Mil_Barracks", "Land_Mil_Barracks_L", "Land_Misc_Cargo1D", "Land_Shed_W02", "Land_Shed_W03", "Land_Shed_W4", "Land_telek1", "MASH_EP1", "Mi8Wreck_DZ", "UH1Wreck_DZ", "UH60Wreck_DZ" ];

_bld = [ "Land_HouseV_2L", "Land_A_Crane_02b", "Land_A_CraneCon", "Land_Ind_Expedice_1", "Land_Barn_Metal", "Land_Farm_Cowshed_b", "Land_Farm_Cowshed_c", "Land_BoatSmall_2b","UralWreck", "Land_Misc_Rubble_EP1", "Rubbish5", "Fort_Barricade", "Land_Shed_M02", "Land_Misc_Garb_Heap_EP1", "Land_Ind_SiloVelke_01", "Land_Ind_TankBig", "Land_Ind_Pec_01", "Land_komin", "Land_Mil_Guardhouse", "Land_Ind_Mlyn_03"];


_bld = [ "SKODAWreck", "hiluxWreck", "datsun01Wreck", "LADAWreck", "Land_HouseV_3I4","Land_Misc_GContainer_Big", "Land_Toilet" , "Land_HouseV_2L", "Land_houseV_2T2"];
//_bld =[ "Land_A_Hospital", "Land_A_Office02", "Land_A_Office01" ];
	curhouse = 0;
	myhouses = [];
	{
		_loot=[] + getArray(configFile >> "CfgBuildingLoot" >> _x >> "lootPos");
		//if (count _loot > 0) then {
			_o = _x createVehicleLocal [0,0,100];sleep 0.01;
			_o setVectorDirAndUp [[0,0,1],[0,0,1]];
			myhouses set [count myhouses, _o ];
			_o setVariable [ "loot", _loot ];
		//};
	} forEach _bld;
	diag_log(format["init done %1", count myhouses]);
};

settle = {
	private ["_o", "_a", "_p"];
	_o = myhouses select curhouse;
	_o setPos [4194, 10864,0.01];
	if (typeOf _o == "Land_A_Castle_Bergfrit") then { _o setPos [4194, 10864, -10]; };
	if (typeOf _o == "Land_A_Crane_02b") then { _o setPos [4194, 10864, -10.4]; };
//	if (typeOf _o == "Land_HouseB_Tenement") then { _o setPos [4194, 10864, -39.5]; };
//	if (typeOf _o == "Land_A_Hospital") then { _o setPos [4194, 10864, -10.5]; };
	
	
	_a = [];
	_o setVariable [ "edited", false ];
	{
		_dot = if (count _x > 3) then { (_x select 3) createVehicleLocal [0,0,0] } else { (types select curType) createVehicleLocal [0,0,0] };
		_dot setPos [4214, 10875,0];
		if (count _x > 4) then { _dot setDir ((getDir _o)+(_x select 4)); };
		//diag_log(format["settle %1 %2 %3", getDir _o, _x select 4, getDir _dot]);
		_x resize 3;
		_dot setPosATL (_o modelToWorld _x);
		_p = getPosATL _dot;
		if (_p select 2 < 0.01) then {
			_p set [2, 0.01];
			_dot setPosATL _p;
			_o setVariable [ "edited", true ];
		};
		_a set [count _a, _dot];
	} forEach (_o getVariable ["loot", []]);
	_o setVariable [ "dots", _a];
	diag_log("settle done");
};

dismantle = {
	private ["_o", "_a"];
	_o = myhouses select curhouse;
	_a = [];
	_b = [];
	{
		_pos = _o worldToModel (getPosATL _x);
		if (_pos distance [0,0,0] < (sizeOf(typeOf(_o)))) then {
			_pos set [ count _pos, typeOf _x ];
			//diag_log(format["dismantle %1 %2", getDir _x, getDir _o]);
			_pos set [ count _pos, (round((getDir _x)-(getDir _o)+720)%360)];
			if (typeOf _x == "WeaponHolder_PartGlass") then {
				_b set [count _b, _o worldToModel (getPosATL _x)];
			};
			_a set [count _a, _pos];
		}
		else { diag_log(format["Err:%1 %2/%3", _x, _pos distance [0,0,0],(sizeOf(typeOf(_o)))]);};
		deleteVehicle _x;
	} forEach (_o getVariable ["dots", []]);
	if (_o getVariable ["edited", false]) then {
		diag_log(format["=== %1 %2 %3" , date, typeOf _o, _b]);
		diag_log(format["::: %1 %2 %3" , date, typeOf _o, _a]);
	};
	_o setVariable [ "loot", _a ];
	_o setPosATL [0,0,0];
	diag_log("dismantle done");
};
myfunc = {
private ["_h","_o","_p", "_search", "_ret"];
_search = {
	private ["_o"];
	_o = cursorTarget;
	if ((_o != objNull) AND {((typeOf _o) IN types)}) exitWith {_o};
	_o = (nearestObjects [getPosATL player, types, 6]);
	if (count _o == 0) exitWith {nullObj};
	_o = _o select 0;
	if (_o == objNull) exitWith {_o};
	if (player distance _o < 40) exitWith{_o};
	objNull
};
_delete = {
	private ["_l"];
	_l = (myhouses select curhouse) getVariable ["dots", []];
	_l = _l - [_this];
	(myhouses select curhouse) setVariable ["dots", _l];
};
_insert = {
	private ["_l"];
	_l = (myhouses select curhouse) getVariable ["dots", []];
	_l set [count _l, _o ];
	(myhouses select curhouse) setVariable ["dots", _l];
};
_ret = false;
if (isNil "myhouses") exitWith {_ret};
_h = format["Key:%1\nCur.Model:%2",	_this select 1, types select curType];
_o = (myhouses select curhouse);
if (_o != objNull) then {
	_h = format["%1\nEditing:%2\nLoots:%3\nAngle:%4",
		_h,
		_o, 
		count (_o getVariable ["dots",[]]),
		round((getDir player)-(getDir _o)+720)%360
	];
};
_o = cursorTarget;
if (_o != objNull) then {
	_h = format["%1\nPointing:%2 (%3)",	_h, _o, typeOf _o];
};
_o = call _search;
switch (_this select 1) do {
	case 78: { // up
		if (_o == objNull) exitWith {_ret};
		_p = getPosASL _o;
		_p set [ 2, (_p select 2 )+mystep];
		_o setPosASL _p;
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2\n%3",_h, "UP",_o];
		_ret = true;
	};
	case 74: { // down
		if (_o == objNull) exitWith {_ret};
		_p = getPosATL _o;
		_p set [ 2, (_p select 2 )-mystep];
		_o setPosATL _p;
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2\n%3",_h, "DOWN",_o];
		_ret = true;
	};
	case 72: { // forward
		if (_o == objNull) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 1, (_p select 1)+mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2",_h, "LEFT"];
		_ret = true;
	};
	case 80: { // backwars
		if (_o == objNull) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 1, (_p select 1)-mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2",_h, "LEFT"];
		_ret = true;
	};
	case 75: { // left (according to player)
		if (_o == objNull) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 0, (_p select 0)-mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2",_h, "LEFT"];
		_ret = true;
	};
	case 77: { // right (according to player)
		if (_o == objNull) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 0, (_p select 0)+mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2",_h, "RIGHT"];
		_ret = true;
	};
	case 211: { // delete
		if (_o == objNull) exitWith {_ret};
		_o call _delete; // delete from objects list
		deleteVehicle _o;
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2",_h, "delete"];
		_ret = true;
	};
	case 210: { // new
		_o = (types select curType) createVehicleLocal [0,0,0];
		_o setDir (getDir player);
		_o setPos (player modelToWorld [0, 1, 0]);
		_o call _insert; // insert to objects list
		(myhouses select curhouse) setVariable [ "edited", true ];
		_h = format["%1\n%2 %3",_h, "new", _o];
		_ret = true;
	};
	case 201: { // save/next
		if (curhouse+1 < count myhouses) then {
			call dismantle;
			curhouse = curhouse +1;
			call settle;
			_h = format["%1\n%2 %3",_h, "NEXT", curhouse];
			_ret = true;
		}
		else { diag_log(format["cur:%1 tot:%2", curhouse, count myhouses]);};
	};
	case 209: { // save/prev
		if (curhouse > 0) then {
			call dismantle;
			curhouse = curhouse -1;
			call settle;
			_h = format["%1\n%2 %3",_h, "PREV", curhouse];
			_ret = true;
		}; 
	};
	case 55: { // next model
		curType = if (curType+1 >= count types) then {0} else {curType+1};
		_h = format["%1\n%2 %3",_h, "Type", types select curType];
		_ret = true;
	};
	case 181: { // prev model
		curType = if (curType == 0) then {(count types)-1} else {curType-1};
		_h = format["%1\n%2 %3",_h, "Type", types select curType];
		_ret = true;
	};
	case 30; case 31; case 32; case 17 : { if (1==1) exitWith {_ret}; };
};
hintSilent _h;

"dynamicBlur" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
"filmGrain" ppEffectEnable false; 
"radialBlur" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"chromAberration" ppEffectEnable false;

_ret
};
diag_log(format["1 %1", curhouse]);
if (isNil "myhouses") then {
call _init;
};
//diag_log("2");
if (!isNil "myhdl") then {
	(findDisplay 46) displayRemoveEventHandler [ "KeyDown", myhdl];
	myhdl = nil;
};
//diag_log("3");
if (isNil "myhdl") then {
myhdl = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call myfunc"];
};


for "_i" from 1 to 14  do {
"dynamicBlur" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
"filmGrain" ppEffectEnable false; 
"radialBlur" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"chromAberration" ppEffectEnable false;

	_playerPos = getPos player;
	_t=10;
	_z =_playerPos ; _z = [_t*sin(getDir player)+(_z select 0),  _t*cos(getDir player)+(_z select 1),  0]; 
	_a = str(_playerPos);
	{ 
		_y=typeOf(_x); 
		if (_y == "") then { 
			_y=str(_x); 
			//if (((toArray _y) select 0) in [70, 35, 72]) then {
			//	_y = "";
			//};
		}
		else {
			if (((toArray _y) select 0) in [70, 35, 72]) then {
				_y = "";
			};
		};
		if (_y != "") then { _a = _a + "\n" + _y; };
		//if (_x isKindOf "Man") then { _x setvelocity [sin(getDir player)*8, cos(getDir player)*8, 8];}; 
	} forEach (((nearestObjects [_z,  [],  _t]))-[player,  vehicle player]);
	_a = _a + "\n";
	hintSilent _a;
	
	sleep 0.5;
};

hintSilent "done";
