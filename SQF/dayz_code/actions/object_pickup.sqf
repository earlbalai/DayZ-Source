private["_array","_type","_classname","_holder","_playerID","_text","_broken","_claimedBy","_config","_isOk","_muzzles"];

_array = _this select 3;
_type = _array select 0;
_classname = _array select 1;
_holder = _array select 2;

_playerID = getPlayerUID player;
_text = getText (configFile >> _type >> _classname >> "displayName");

_holder setVariable["claimed",_playerID,true];

if(_classname isKindOf "TrapBear") exitwith {deleteVehicle _holder;};

player playActionNow "PutDown";

//Adding random chance of arrow is re-usable on pickup
_broken = false;
if(_classname == "WoodenArrow") then {
	if (20 > random 100) then {
		_broken = true;
	};
};
if (_broken) exitWith { deleteVehicle _holder; cutText [localize "str_broken_arrow", "PLAIN DOWN"] };

sleep 0.25;

_claimedBy = _holder getVariable["claimed",0];

if (_claimedBy != _playerID) exitWith {cutText [format[(localize "str_player_beinglooted"),_text] , "PLAIN DOWN"]};

if(_classname isKindOf "Bag_Base_EP1") then {
	diag_log("Picked up a bag: " + _classname);
};

//Remove melee magazines (BIS_fnc_invAdd fix) (add new melee ammo to array if needed)
{player removeMagazines _x} forEach ["hatchet_swing","crowbar_swing","Machete_swing"];

_config = (configFile >> _type >> _classname);
_isOk = [player,_config] call BIS_fnc_invAdd;
if (_isOk) then {
	deleteVehicle _holder;
} else {
	_holder setVariable["claimed",0,true];
	cutText [localize "str_player_24", "PLAIN DOWN"];
};

//adding melee mags back if needed
switch (primaryWeapon player) do {
	case "MeleeHatchet": {player addMagazine 'hatchet_swing';};
	case "MeleeCrowbar": {player addMagazine 'crowbar_swing';};
	case "MeleeMachete": {player addMagazine 'Machete_swing';};
};
