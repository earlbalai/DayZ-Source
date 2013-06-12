private ["_onLadder","_itemorignal","_hasfooditem","_rawfood","_cookedfood","_hasoutput","_config","_text","_regen","_dis","_sfx","_skilllevel","_itemtodrop","_nearByPile","_item","_display"];

disableserialization;
call gear_ui_init;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not eat while in a vehicle", "PLAIN DOWN"]};

//Force players to wait 3 mins to eat again
//if (dayz_lastMeal < 15) exitWith {cutText ["You may not eat, you're already full", "PLAIN DOWN"]};

_itemorignal = _this;
_hasfooditem = _itemorignal in magazines player;

_rawfood = _itemorignal in meatraw;
_cookedfood = _itemorignal in meatcooked;
_hasoutput = _itemorignal in food_with_output;

_config = configFile >> "CfgMagazines" >> _itemorignal;
_text = getText (_config >> "displayName");
_regen = getNumber (_config >> "bloodRegen");

if (!_hasfooditem) exitWith {cutText [format[(localize "str_player_31"),_text,(localize "str_player_31_consume")] , "PLAIN DOWN"]};

player playActionNow "PutDown";
player removeMagazine _itemorignal;
sleep 1;

_dis=6;
_sfx = getText (_config >> "sfx");

//set _sfx to eat if nothing is defined
if (_sfx == "") then {_sfx = "eat"};

[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

if (r_player_foodstack >= 10) then {
	_regen = 0;
};

if ((r_player_bloodregen > 5) and (r_player_foodstack > 1) and (r_player_foodstack < 10)) then {
	_regen = _regen / r_player_foodstack;
};

//diag_log format ["Regen: %1, Stack: %2", _regen, r_player_foodstack];

//disminishing returns. while regen is active
r_player_foodstack = r_player_foodstack + 1;

if (_hasoutput) then{
    // Selecting output
    _itemtodrop = food_output select (food_with_output find _itemorignal);

    sleep 3;
    _nearByPile= nearestObjects [getPosATL player, ["WeaponHolder"], 2];
    _item = if (count _nearByPile > 0) then {_nearByPile select 0} else {nil};
    if ((isNil "_item") OR {(player distance _item > 2)}) then {
    	_pos = player modeltoWorld [0,1,0];
    	//diag_log format [ "%1 itempos:%2 _nearByPile:%3", __FILE__, _pos, _nearByPile];
        _item = createVehicle ["WeaponHolder", _pos, [], 0.0, "CAN_COLLIDE"];
        _item setPosATL _pos;
	};
    _item addMagazineCargoGlobal [_itemtodrop,1];
};

if ( _rawfood and (random 15 < 1)) then {
    r_player_infected = true;
    player setVariable["USEC_infected",true,true];
};

//r_player_blood = r_player_blood + _regen;
r_player_bloodregen = r_player_bloodregen + _regen;

if (r_player_blood > r_player_bloodTotal) then {
    r_player_blood = r_player_bloodTotal;
};

player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
player setVariable["USEC_BloodQty",r_player_blood,true];
player setVariable["medForceUpdate",true];

//["PVDZ_plr_Save",[player,[],true]] call callRpcProcedure;
PVDZ_plr_Save = [player,[],true];
publicVariableServer "PVDZ_plr_Save";

dayz_lastMeal = time;
dayz_hunger = 0;

//Ensure Control is visible
_display = uiNamespace getVariable 'DAYZ_GUI_display';
(_display displayCtrl 1301) ctrlShow true;

if (r_player_blood / r_player_bloodTotal >= 0.2) then {
    (_display displayCtrl 1300) ctrlShow true;
};

if ((r_player_foodstack >= 0) and (r_player_foodstack < 7)) then {
	cutText [format[(localize "str_player_consumed_food"),_text], "PLAIN DOWN"];
};
if ((r_player_foodstack >= 7) and (r_player_foodstack < 10)) then {
	cutText [format[(localize "str_player_consumed_food_1"),_text], "PLAIN DOWN"];
};
if ((r_player_foodstack >= 10)) then {
	cutText [format[(localize "str_player_consumed_food_2"),_text], "PLAIN DOWN"];
};