private["_unit","_weapon","_ammo","_projectile","_audible","_caliber","_distance","_listTalk","_target","_targets"];

//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_unit = _this select 0;
_weapon = _this select 1;
_ammo = _this select 4;
_projectile = _this select 6;

//Alert Nearby
_audible = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
_caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
_distance = round(_audible * 10 * _caliber);

dayz_disAudial = _distance;
dayz_firedCooldown = time;
// Color in the combat icon
dayz_combat = 1;

if (_ammo isKindOf "Melee") exitWith {
	_unit playActionNow "GestureSwing";
};

if ((_ammo isKindOf "SmokeShell") or (_ammo isKindOf "GrenadeHandTimedWest") or (_ammo isKindOf "G_40mm_HE")) then {
	if (_ammo isKindOf "G_40mm_HE") then { dayz_disAudial = 30 };

	[_unit,_ammo] spawn {
		private["_unit","_ammo","_projectile","_pos","_listTalk"];
		_unit = _this select 0;
		_ammo = _this select 1;

		_projectile = nearestObject [_unit, _ammo];
		_pos = getPosATL _projectile;

		if (_ammo isKindOf "SmokeShell") then {
			while { ((getPosATL _projectile) select 2) >= 1 } do {
				_pos = getPosATL _projectile;
				sleep 0.01;
			};

			_listTalk = _pos nearEntities ["zZombie_Base",50];

			{
				private["_targets"];
				_x reveal [_projectile,4];
				_targets = _x getVariable ["targets",[]];
				if (!(_projectile in _targets)) then {
					_targets set [count _targets,_projectile];
					_x setVariable ["targets",_targets, true];
				};
			} forEach _listTalk;
		} else {
			while { alive _projectile } do {
				_pos = getPosATL _projectile;
				sleep 0.01;
			};

			_listTalk = _pos nearEntities ["zZombie_Base",50];

			{
				_x setVariable ["myDest",_pos]; // removed networked var.  targets should be enough
			} forEach _listTalk;
		};
	};
} else {
	[_unit,_distance/2,true,(getPosATL player)] spawn player_alertZombies;

	_combattimeout = player getVariable["combattimeout",0];
    if (_combattimeout > 0) then {
        _timeleft = _combattimeout - time;
        if (_timeleft > 0) then {
           // [getPosATL player] call combat_spawnZombies;
        } else {
        };
    } else {
	};

	//Check if need to place arrow
	if (_ammo isKindOf "Bolt") then {
		[_this] spawn player_crossbowBolt;
	};
	if (_ammo isKindOf "GrenadeHand") then {

		if (_ammo isKindOf "ThrownObjects") then {
			[_this] spawn player_throwObject;
		};
		if (_ammo isKindOf "RoadFlare") then {
			//hint str(_ammo);
			_projectile = nearestObject [_unit, "RoadFlare"];
			[_projectile,0] spawn object_roadFlare;
			PVDZ_obj_RoadFlare = [_projectile,0];
			publicVariable "PVDZ_obj_RoadFlare";
			[_this] spawn player_throwObject;
		};
		if (_ammo isKindOf "ChemLight") then {
			_projectile = nearestObject [_unit, "ChemLight"];
			[_projectile,1] spawn object_roadFlare;
			PVDZ_obj_RoadFlare = [_projectile,1];
			publicVariable "PVDZ_obj_RoadFlare";
			[_this] spawn player_throwObject;
		};
	};
};
