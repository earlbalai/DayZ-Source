private["_vehicle","_canSize","_configVeh","_capacity","_nameType","_curFuel","_newFuel","_dis","_sfx"];

_vehicle = 		cursorTarget;
_array = _this select 3;
_cantype = _array select 0;
_canSize = 		getNumber(configFile >> "cfgMagazines" >> _cantype >> "fuelQuantity");
_emptycan = 	getText(configFile >> "cfgMagazines" >> _cantype >> "emptycan");
_configVeh = 	configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_capacity = 	getNumber(_configVeh >> "fuelCapacity");
_nameType = 	getText(_configVeh >> "displayName");
_curFuel = 		((fuel _vehicle) * _capacity);
_newFuel = 		(_curFuel + _canSize);

if (_newFuel > _capacity) then {_newFuel = _capacity};
_newFuel = (_newFuel / _capacity);

player removeMagazine _cantype;
player addMagazine _emptycan;

player playActionNow "Medic";
_dis=10;
_sfx = "refuel";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

sleep 6;

dayzSetFuel = [_vehicle,_newFuel];
dayzSetFuel spawn local_setFuel;
publicVariable "dayzSetFuel";

cutText [format[localize "str_player_05",_nameType,_canSize], "PLAIN DOWN"];
sleep 1;

call fnc_usec_medic_removeActions;
r_action = false;