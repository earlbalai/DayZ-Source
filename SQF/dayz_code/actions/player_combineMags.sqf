private["_create","_config","_create_magsize","_type","_slotstart","_slotend","_dialog","_qty_total_ammo","_control","_i","_mag","_qtynew_create_mags_full","_qtynew_create_ammo_rest"];

disableSerialization;
call gear_ui_init;

if (r_action_count != 1) exitWith { cutText ["Wait for the previous action to complete to perform another!", "PLAIN DOWN"]; };

_create = _this;

if (!(_create in magazines player)) exitWith {r_action_count = 0;};

_config = configFile >> "CfgMagazines" >> _create;

player playActionNow "PutDown";

_create_magsize = getNumber(configFile >> "CfgMagazines" >> _create >> "count");
_type = getNumber(configFile >> "CfgMagazines" >> _create >> "type");

//primary/secondary mags?
_slotstart = 0;
_slotend = 0;
if ((_type == 256) or (_type == 256*2)) then {
	_slotstart = 109;
	_slotend = 120;
};
if (_type == 16) then {
	_slotstart = 122;
	_slotend = 129;
};

_dialog = findDisplay 106;

_qty_total_ammo = 0;
for "_i" from _slotstart to _slotend do {
	_control = _dialog displayCtrl _i;
	_mag = gearSlotData _control;
	if (_mag == _create) then {
		_qty_total_ammo = _qty_total_ammo + gearSlotAmmoCount _control;
	};
};

_qtynew_create_mags_full = 0;
_qtynew_create_ammo_rest = 0;
_qtynew_create_mags_full = floor(_qty_total_ammo/_create_magsize);
_qtynew_create_ammo_rest = _qty_total_ammo - (_qtynew_create_mags_full*_create_magsize);

player removeMagazines _create;
for "_i" from 1 to _qtynew_create_mags_full do {
	player addMagazine _create;
};
if (_qtynew_create_ammo_rest != 0) then {
	player addMagazine [_create,_qtynew_create_ammo_rest];
};
sleep 1;
r_action_count = 0;