
_holder = _this select 0;
_type = _this select 1;
_classname = _this select 2;

_name = getText (configFile >> _type >> _classname >> "displayName");

_PlayerNear = {isPlayer _x} count ((position player) nearEntities ["CAManBase", 5]) > 1;

if (_PlayerNear) exitWith {cutText [format["Another Player Near by, Only one player must be within 5 meters of a bag to pickup"] , "PLAIN DOWN"]};

s_player_holderPickup = _holder addAction [format[(localize "str_init_take"),_name], "\z\addons\dayz_code\actions\object_pickup.sqf",[_type,_classname,_holder], 20, true, true];
player reveal _holder;