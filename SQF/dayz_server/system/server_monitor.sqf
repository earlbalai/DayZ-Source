[]execVM "\z\addons\dayz_server\system\s_fps.sqf"; //server monitor FPS (writes each ~181s diag_fps+181s diag_fpsmin*)

dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");
_script = getText(missionConfigFile >> "onPauseScript");

if ((count playableUnits == 0) and !isDedicated) then {
	isSinglePlayer = true;
};

waitUntil{initialized}; //means all the functions are now defined

diag_log "HIVE: Starting";

//Set the Time
	//Send request
	_key = "CHILD:307:";
	_result = _key call server_hiveReadWrite;
	_outcome = _result select 0;
	if(_outcome == "PASS") then {
		_date = _result select 1;
		
		//date setup
		_year = _date select 0;
		_month = _date select 1;
		_day = _date select 2;
		_hour = _date select 3;
		_minute = _date select 4;
		
		//Force full moon nights
		_date = [2012,6,6,_hour,_minute];
		
		if(isDedicated) then {
			//["dayzSetDate",_date] call broadcastRpcCallAll;
			setDate _date;
			dayzSetDate = _date;
			publicVariable "dayzSetDate";
		};
		diag_log ("HIVE: Local Time set to " + str(_date));
	};

	if (_script != "") then
	{
		diag_log "MISSION: File Updated";
	} else {
		diag_log "MISSION: File Needs Updating";
	};

	//Stream in objects
	/* STREAM OBJECTS
		//Send the key
		_key = format["CHILD:302:%1:",dayZ_instance];
		_result = _key call server_hiveReadWrite;

		diag_log "HIVE: Request sent";
		
		//Process result
		_status = _result select 0;
		
		_myArray = [];
		if (_status == "ObjectStreamStart") then {
			_val = _result select 1;
			//Stream Objects
			diag_log ("HIVE: Commence Object Streaming...");
			for "_i" from 1 to _val do {
				_result = _key call server_hiveReadWrite;

				_status = _result select 0;
				_myArray set [count _myArray,_result];
				//diag_log ("HIVE: Loop ");
			};
			//diag_log ("HIVE: Streamed " + str(_val) + " objects");
		};
	
		_countr = 0;		
		{
				
			//Parse Array
			_countr = _countr + 1;
		
			_idKey = 	_x select 1;
			_type =		_x select 2;
			_ownerID = 	_x select 3;
			_worldspace = _x select 4;
			_intentory=	_x select 5;
			_hitPoints=	_x select 6;
			_fuel =		_x select 7;
			_damage = 	_x select 8;

			_dir = 0;
			_pos = [0,0,0];
			_wsDone = false;			
			if (count _worldspace >= 2) then
			{
				_dir = _worldspace select 0;
				if (count (_worldspace select 1) == 3) then {
					_pos = _worldspace select 1;
					_wsDone = true;
				}
			};
			
			if (!_wsDone) then {
				if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
				_objectPos = [_worldspace select 1 select 0,_worldspace select 1 select 1,0];		
				_pos = [(_objectPos),0,15,1,0,2000,0,[],[_objectPos,[]]] call BIS_fnc_findSafePos;
				if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
				diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
			};
			
			if (_damage < 1) then {
				diag_log format["OBJ: %1 - %2", _idKey,_type];
				
				//Create it
				_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
				_object setVariable ["lastUpdate",time];
				_object setVariable ["ObjectID", _idKey, true];
				_object setVariable ["CharacterID", _ownerID, true];
				
				clearWeaponCargoGlobal  _object;
				clearMagazineCargoGlobal  _object;
				
				if (_object isKindOf "TentStorage") then {
					_pos set [2,0];
					_object setpos _pos;
					_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
				};
				_object setdir _dir;
				_object setDamage _damage;
				
				if (count _intentory > 0) then {
					//Add weapons
					_objWpnTypes = (_intentory select 0) select 0;
					_objWpnQty = (_intentory select 0) select 1;
					_countr = 0;					
					{
						if (_x == "Crossbow") then { _x = "Crossbow_DZ" }; // Convert Crossbow to Crossbow_DZ
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes; 
					
					//Add Magazines
					_objWpnTypes = (_intentory select 1) select 0;
					_objWpnQty = (_intentory select 1) select 1;
					_countr = 0;
					{
						if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgMagazines" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;

					//Add Backpacks
					_objWpnTypes = (_intentory select 2) select 0;
					_objWpnQty = (_intentory select 2) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgVehicles" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;
				};	
				
				if (_object isKindOf "AllVehicles") then {
					{
						_selection = _x select 0;
						_dam = _x select 1;
						if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
						[_object,_selection,_dam] call object_setFixServer;
					} forEach _hitpoints;
					_object setvelocity [0,0,1];
					_object setFuel _fuel;
					_object call fnc_vehicleEventHandler;
					//Updated object position if moved
					if (!_wsDone) then {
						[_object, "position"] call server_updateObject;
					};
				};

				//Monitor the object
				//_object enableSimulation false;
				dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];
			};
		} forEach _myArray;
		
	// # END OF STREAMING #
*/
waituntil{isNil "sm_done"}; // prevent server_monitor be called twice (bug during login of the first player)

#include "\z\addons\dayz_server\compile\fa_hiveMaintenance.hpp"

if (isServer and isNil "sm_done") then {
	private["_i","_sm_hiveResponse","_key","_sm_objectArray","_sm_objectCount"];
	sm_done = false;
	
	for "_i" from 1 to 5 do {
		diag_log "HIVE: trying to get objects";
		_key = format["CHILD:302:%1:", dayZ_instance];
		_sm_hiveResponse = _key call server_hiveReadWrite;  
		if ((((isnil "_sm_hiveResponse") || {(typeName _sm_hiveResponse != "ARRAY")}) || {((typeName (_sm_hiveResponse select 1)) != "SCALAR")}) || {(_sm_hiveResponse select 1 > 2000)}) then {
			diag_log ("HIVE: connection problem... HiveExt response:"+str(_sm_hiveResponse));
			_sm_hiveResponse = ["",0];
		} 
		else {
			diag_log ("HIVE: found "+str(_sm_hiveResponse select 1)+" objects" );
			_i = 99; // break
		};
	};
	
	_sm_objectArray = [];
	if ((_sm_hiveResponse select 0) == "ObjectStreamStart") then {
		_sm_objectCount = _sm_hiveResponse select 1;
		diag_log ("HIVE: Commence Object Streaming...");
		for "_i" from 1 to _sm_objectCount do { 
			_sm_hiveResponse = _key call server_hiveReadWrite;
			_sm_objectArray set [_i - 1, _sm_hiveResponse];
			//diag_log (format["HIVE dbg %1 %2", typeName _sm_hiveResponse, _sm_hiveResponse]);
		};
		diag_log ("HIVE: got " + str(count _sm_objectArray) + " objects");
#ifdef EMPTY_TENTS_CHECK
		// check empty tents, remove some of them
		[_sm_objectArray, EMPTY_TENTS_GLOBAL_LIMIT, EMPTY_TENTS_USER_LIMIT] call fa_removeExtraTents;
#endif
		// check vehicles count
		[_sm_objectArray] call fa_checkVehicles;
	};

	{
		private["_action","_sm_ObjectID","_sm_class","_sm_CharacterID","_sm_worldspace","_sm_inventory", "_sm_hitpoints","_sm_fuel","_sm_damage","_entity","_sm_dir","_sm_pos","_res",  "_sm_rawData","_class","_worldspace","_uid", "_selection", "_dam"];

		_action = _x select 0; // values : "OBJ"=object got from hive  "CREATED"=vehicle just created ...
		_sm_ObjectID = _x select 1;
		_sm_class =	if ((typeName (_x select 2)) == "STRING") then { _x select 2 } else { "Old_bike_TK_CIV_EP1" };
		_sm_CharacterID = _x select 3;			
		_sm_worldspace = if ((typeName (_x select 4)) == "ARRAY") then { _x select 4 } else { [] };
		_sm_inventory=	if ((typeName (_x select 5)) == "ARRAY") then { _x select 5 } else { [] };
		_sm_hitpoints=	if ((typeName (_x select 6)) == "ARRAY") then { _x select 6 } else { [] };
		_sm_fuel =	if ((typeName (_x select 7)) == "SCALAR") then { _x select 7 } else { 0 };
		_sm_damage = if ((typeName (_x select 8)) == "SCALAR") then { _x select 8 } else { 0.9 };  
		_entity = nil;
	
		_sm_dir = floor(random(360));
		_sm_pos = getMarkerpos "respawn_west";	
		if (count _sm_worldspace >= 1 && {(typeName (_sm_worldspace select 0)) == "SCALAR"}) then { 
			_sm_dir = _sm_worldspace select 0;
		};
		if (count _sm_worldspace == 2 && {(typeName (_sm_worldspace select 1)) == "ARRAY"}) then { 
			_i = _sm_worldspace select 1;
			if (count _i == 3 &&
				{(typeName (_i select 0)) == "SCALAR"} && 
				{(typeName (_i select 1)) == "SCALAR"} &&
				{(typeName (_i select 2)) == "SCALAR"}) then {
				_sm_pos = _i;	
			};
		};
 	
		// if legit vehicle      
		if ((_sm_class isKindOf "AllVehicles") && ((_sm_CharacterID == "0") OR (_sm_CharacterID == "1")) && (_sm_damage < 1)) then {
			//_sm_damage=0.86;//_action="CREATED";
			_sm_pos set [2, 0]; // here _sm_pos is in ATL format	
#ifdef VEH_MAINTENANCE_ROTTEN_AT_STARTUP
			// rotten randomly the vehicle. Successive damages will lead to a respawn.
			if ((random(VEH_MAINTENANCE_ROTTEN_AT_STARTUP) < 1) AND {(_action == "OBJ")}) then {
				 _sm_damage = VEH_MAINTENANCE_ROTTEN_LOGIC; _action = "DAMAGED"; 
			};
#endif
			// ask to create a new vehicle if damage is too high
			if (_sm_damage > 0.85 AND (_action != "CREATED")) then { _action = "SPAWNED"; };  
			// check for no collision with world. Find a suitable place:
			_sm_worldspace = [_sm_class, _sm_dir, _sm_pos, _action] call fa_smartlocation;
			if ((([_sm_worldspace select 1, _sm_pos] call BIS_fnc_distance2D) > 1) 
				AND (_action == "OBJ")) then { _action = "MOVED"; };
			_sm_dir = _sm_worldspace select 0;
			_sm_pos = _sm_worldspace select 1;
			_entity = createVehicle [_sm_class, _sm_pos, [], 0, "CAN_COLLIDE"]; 
			_entity setVariable ["ObjectID", _sm_ObjectID, true]; // this variable must be set very early
			_entity setVariable ["CharacterID", _sm_CharacterID, true];	
			_entity setVariable ["lastUpdate",time]; // prevent immediate hive write when vehicle parts are set up
			// setPos will be done again just after setDir, see below....
#ifdef VEH_MAINTENANCE_ADD_MISSING		
			if (_sm_damage > 0.85) then { 
				_sm_fuel = VEH_MAINTENANCE_SPAWN_FUEL_LOGIC;
				_sm_hitpoints = [];
				_sm_damage = _sm_hitpoints call fa_setDamagedParts;
	
				_sm_inventory = []; // TODO: rewrite this inventory setup.
				if (!(_sm_class isKindOf "Motorcycle" OR _sm_class isKindOf "Ship" OR _sm_class isKindOf "Bicycle")) then { //// TODO: rewrite spawn inventory
					if (_sm_class isKindOf "Helicopter") then {  // helicopter
						//_sm_inventory = [["PartVRotor","PartEngine","PartGeneric","PartGlass"], [1,1,4,4]] call fa_spawninventory;
					}
					else {  
						//_sm_inventory = [["PartWheel","PartFueltank","PartGeneric","PartGlass","PartEngine"], [4,1,1,4,1]] call fa_spawninventory; 
				};};
				//diag_log (format["VEH MAINTENANCE Creating vehicle Inventory:%1  and  Damaged parts:%2", _sm_inventory, _sm_hitpoints]);
			};
#endif
			{
				_selection = _x select 0;
				_dam = _x select 1;
				if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
				[_entity,_selection,_dam] call object_setFixServer;
			} forEach _sm_hitpoints;
			_entity setVectorDirAndUp [[.5,0.0001,.87],[.5,0.0001,.87]]; // I don't like these magical in equilibrium bikes
			_sm_pos set [2, 1]; // setPos will be done below.
			_entity setvelocity [0,0,1];
			_entity setFuel _sm_fuel;
			_entity call fnc_vehicleEventHandler;
			diag_log (format["VEH MAINTENANCE %1 %2 at %3, damage=%4, fuel=%5",
				 _action, _entity call fa_veh2str, (getPosASL _entity) call fa_coor2str, _sm_damage, _sm_fuel ]); // , hitpoints:%6, inventory=%7"  , _sm_hitpoints, _sm_inventory 
		}
		else { // else for object or non legit vehicle
			if (!(_sm_class in SafeObjects )) then {  
				_sm_damage = 4; 
			};

			if (_sm_damage < 1) then { // create object
#ifdef OBJECTS_FIX_OUTOFMAP
				_sm_worldspace = [_sm_dir, _sm_pos] call fa_staywithus;
				_sm_dir =  _sm_worldspace select 0;
				_sm_pos =  _sm_worldspace select 1;
#endif
				_entity = createVehicle [_sm_class, _sm_pos, [], 0, "CAN_COLLIDE"];	
				_entity setVariable ["ObjectID", _sm_ObjectID, true];
				_entity setVariable ["CharacterID", _sm_CharacterID, true];	
				_entity setVariable ["lastUpdate",time];
	
				if (_sm_class == "TentStorage") then { 
					_entity addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}]; 
				};
			//	diag_log ("DW_DEBUG " + _sm_class + " #" + str(_sm_ObjectID) + " pos=" +  	(_sm_pos call fa_coor2str) + ", damage=" + str(_sm_damage)  );	
			}
			else { // delete object -- this has been comented out: object are never really deleted from hive
			/*	_key = format["CHILD:306:%1:%2:%3:", _sm_ObjectID, [], 1];
				_sm_rawData = "HiveEXT" callExtension _key;
				_key = format["CHILD:304:%1:",_sm_ObjectID]; // delete by ID (not UID which is handler 310)
				_sm_rawData = "HiveEXT" callExtension _key;*/
				diag_log (format["VEH MAINTENANCE IGNORED %1 oid#%2 cid:%3 ",
					_sm_class, _sm_ObjectID, _sm_CharacterID ]);
			};
		};
//diag_log(format["VEH MAINTENANCE DEBUG %1 %2", __FILE__, __LINE__]);
			
		// common code (vehicle or not)				
		if (_sm_damage < 1 AND !(isNil ("_entity"))) then {
			_entity setdir _sm_dir;
			_entity setPos _sm_pos;
			_entity setDamage _sm_damage;
			[_entity, _sm_inventory] call fa_populateCargo;
			
			dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _entity];
	
			// UPDATE MODIFIED OBJECTS TO THE HIVE 
			if (_action == "CREATED") then {
				// insert className damage characterId  worldSpace inventory  hitPoints  fuel uniqueId  
				_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:", dayZ_instance, 
					_sm_class, _sm_damage , 1, 
					[_sm_dir, _sm_pos], 
					[getWeaponCargo _entity, getMagazineCargo _entity ,getBackpackCargo _entity], 
					_sm_hitpoints, _sm_fuel, _sm_ObjectID
				];
				//diag_log (_key);
				_sm_rawData = "HiveEXT" callExtension _key;
			};
			if (_action == "SPAWNED" || _action == "DAMAGED") then {
				// update hitpoint,damage   -- already done by needupdate
				/*_key = format["CHILD:306:%1:%2:%3:", _sm_ObjectID, _sm_hitpoints, _sm_damage];
				_sm_rawData = "HiveEXT" callExtension _key;*/
			};
			if (_action == "SPAWNED") then {
				// update inventory  
				_key = format["CHILD:309:%1:%2:", _sm_ObjectID, 
					[getWeaponCargo _entity, getMagazineCargo _entity, getBackpackCargo _entity]];
				_sm_rawData = "HiveEXT" callExtension _key;
			};
			if (_action == "MOVED" || _action == "SPAWNED") then {
				// update position,fuel in Hive  
				// already done by server_updateObject?
				/*_key = format["CHILD:305:%1:%2:%3:", _sm_ObjectID, [_sm_dir, _sm_pos], _sm_fuel];
				_sm_rawData = "HiveEXT" callExtension _key;*/
							//Updated object position if moved
				[_entity, "position"] call server_updateObject;
			};
		}; // not damaged
		sleep 0.01; // yield to connecting players.
	} forEach _sm_objectArray;
	
	createCenter civilian;
	if (isDedicated) then {
		endLoadingScreen;
	};	
	
if (isDedicated) then {
	_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
};

allowConnection = true;

// [_guaranteedLoot, _randomizedLoot, _frequency, _variance, _spawnChance, _spawnMarker, _spawnRadius, _spawnFire, _fadeFire]
nul = [3, 4, (40 * 60), (15 * 60), 0.75, 'center', 4000, true, false] spawn server_spawnCrashSite;
	sm_done = true;
};	

