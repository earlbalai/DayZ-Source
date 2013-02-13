private ["_objects"];

_objects = nearestObjects [getPosATL player, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage"], 10];
{
	//["dayzUpdateVehicle",[_x,"gear"]] call callRpcProcedure;
	dayzUpdateVehicle = [_x,"gear"];
	publicVariable "dayzUpdateVehicle";
	
} foreach _objects;

private ["_backpackWpnQtys","_backpackWpnTypes","_backpackWpn","_backpackMag","_countr","_wasLoaded"];
dayz_myBackpack = unitBackpack player;
_backpackWpn = getWeaponCargo unitBackpack player;
_backpackMag = getMagazineCargo unitBackpack player;

clearWeaponCargoGlobal unitBackpack player;
clearMagazineCargoGlobal unitBackpack player;

//Fill backpack contents
//Weapons
_backpackWpnTypes = [];
_backpackWpnQtys = [];
if (count _backpackWpn > 0) then {
	_backpackWpnTypes = _backpackWpn select 0;
	_backpackWpnQtys = 	_backpackWpn select 1;
};
_countr = 0;
{
	dayz_myBackpack addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
	_countr = _countr + 1;
} forEach _backpackWpnTypes;
//magazines
_backpackmagTypes = [];
_backpackmagQtys = [];
if (count _backpackmag > 0) then {
	_backpackmagTypes = _backpackMag select 0;
	_backpackmagQtys = 	_backpackMag select 1;
};
_countr = 0;
{
	if ((_x == "BoltSteel") || (_x == "Quiver")) then {
		_curWeapon = currentWeapon player;
		if ("Quiver" in magazines player) then {
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
				cutText [localize "str_full_quiver", "PLAIN DOWN"];
			};
		} else {
			if (_x == "BoltSteel") then {
				player addMagazine ["Quiver", 1];
			} else {
				dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
			};
		};
		if (_wasLoaded) then {
			player removeWeapon "Crossbow_DZ";
			player addWeapon "Crossbow_DZ";
		};
		player selectWeapon _curWeapon;
	} else {
		dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
	};
	_countr = _countr + 1;
} forEach _backpackmagTypes;
private["_dialog","_magazineArray","_control","_item","_val","_max"];

disableSerialization;
_dialog = 			_this select 0;
_magazineArray = 	[];

//Primary Mags
for "_i" from 109 to 120 do 
{
	_control = 	_dialog displayCtrl _i;
	_item = 	gearSlotData _control;
	_val =		gearSlotAmmoCount _control;
	_max = 		getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if ((_item == "BoltSteel") || (_item == "Quiver")) then {
			_curWeapon = currentWeapon player;
			_count = {_x == "BoltSteel"} count magazines player;
			_ammo = player ammo "Crossbow_DZ";
			if (_ammo == 0) then {
					player removeWeapon "Crossbow_DZ";
					player addWeapon "Crossbow_DZ";
					_ammo = player ammo "Crossbow_DZ";
			} else {
				_wasLoaded = true;
			};
			player removeMagazines "BoltSteel";
			player removeMagazines "Quiver";
			if (_count > (getNumber (configFile >> "CfgMagazines" >> "Quiver" >> "count") - _ammo)) then {
				player addMagazine "Quiver";
				_magazineArray set [count _magazineArray,"Quiver"];
				cutText [localize "str_full_quiver", "PLAIN DOWN"];
			} else {
				player addMagazine ["Quiver", _ammo + _count];
				_magazineArray set [count _magazineArray,["Quiver", _ammo + _count]];
			};
			if (_wasLoaded) then {
				player removeWeapon "Crossbow_DZ";
				player addWeapon "Crossbow_DZ";
			};
			player selectWeapon _curWeapon;
		} else {
			if (_val != _max) then {
				_magazineArray set [count _magazineArray,[_item,_val]];
			} else {
				_magazineArray set [count _magazineArray,_item];
			};
		};
	};
};

//Secondary Mags
for "_i" from 122 to 129 do 
{
	_control = 	_dialog displayCtrl _i;
	_item = 	gearSlotData _control;
	_val =		gearSlotAmmoCount _control;
	_max = 		getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,_item];
		};
	};
};
dayz_unsaved = true;
dayz_Magazines = _magazineArray;
