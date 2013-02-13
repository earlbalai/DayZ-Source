private["_array","_type","_classname","_holder","_config","_isOk","_muzzles","_playerID","_claimedBy","_text","_wasLoaded","_exit"];
_array = _this select 3;
_type = _array select 0;
_classname = _array select 1;
_holder = _array select 2;

_playerID = getPlayerUID player;
_text = getText (configFile >> _type >> _classname >> "displayName");

_holder setVariable["claimed",_playerID,true];

if(_classname isKindOf "TrapBear") exitwith {deleteVehicle _holder;};

player playActionNow "PutDown";
if (_classname == "MeleeCrowbar") then {
	player addMagazine 'crowbar_swing';
} else {
	if (_classname == "MeleeHatchet") then {
		player addMagazine 'hatchet_swing';
	};
};

sleep 0.25;

_claimedBy = _holder getVariable["claimed",0];

if (_claimedBy != _playerID) exitWith {cutText [format[(localize "str_player_beinglooted"),_text] , "PLAIN DOWN"]};

if(_classname isKindOf "Bag_Base_EP1") then {
	diag_log("Picked up a bag: " + _classname);
};

if (_classname == "BoltSteel") then {
	_curWeapon = currentWeapon player;
	if ("Quiver" in magazines player) then
	{
		_ammo = player ammo "Crossbow_DZ";

		if (_ammo == 0) then {
			player removeWeapon "Crossbow_DZ";
			player addWeapon "Crossbow_DZ";
			_ammo = player ammo "Crossbow_DZ";
		} else {
			_wasLoaded = true;
		};
		if (_ammo < getNumber (configFile >> "CfgMagazines" >> "Quiver" >> "count")) then {
			player removeMagazines "Quiver";
			player addMagazine ["Quiver", _ammo + 1];
		} else {
			_exit = true;
		};
	} else {
		player addMagazine ["Quiver", 1];
	};

	if (_wasLoaded) then {
		player removeWeapon "Crossbow_DZ";
		player addWeapon "Crossbow_DZ";
	};

	player selectWeapon _curWeapon;	
	_isOk = true;
} else {
	_config = (configFile >> _type >> _classname);
	_isOk = [player,_config] call BIS_fnc_invAdd;
};

if (_exit) exitWith { cutText [localize "str_full_quiver", "PLAIN DOWN"] };

if (_isOk) then {
	deleteVehicle _holder;
	if (_classname in ["MeleeHatchet","MeleeCrowbar"]) then {

		if (_type == "cfgWeapons") then {
			_muzzles = getArray(configFile >> "cfgWeapons" >> _classname >> "muzzles");
			//_wtype = ((weapons player) select 0);
			if (count _muzzles > 1) then {
				player selectWeapon (_muzzles select 0);
			} else {
				player selectWeapon _classname;
			};
		};
	};
} else {
	_holder setVariable["claimed",0,true];
	cutText [localize "STR_DAYZ_CODE_2", "PLAIN DOWN"];
	if (_classname == "MeleeCrowbar") then {
		player removeMagazine 'crowbar_swing';
	} else {
		if (_classname == "MeleeHatchet") then {
			player removeMagazine 'hatchet_swing';
		};
	};
};

