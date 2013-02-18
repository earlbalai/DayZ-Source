private["_vehicle","_curFuel","_newFuel","_timeLeft"];
_vehicle = 		cursorTarget;

_canSize = 		getNumber(configFile >> "cfgMagazines" >> "ItemJerrycan" >> "fuelQuantity");
_configVeh = 	configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_capacity = 	getNumber(_configVeh >> "fuelCapacity");
_nameType = 	getText(_configVeh >> "displayName");
_curFuel = 		((fuel _vehicle) * _capacity);
_newFuel = 		(_curFuel + _canSize);

if (_newFuel > _capacity) then {_newFuel = _capacity};
_newFuel = (_newFuel / _capacity);

player removeMagazine "ItemJerrycan";
player addMagazine "ItemJerrycanEmpty";

player playActionNow "Medic";
if ({isPlayer _x} count (_pos nearEntities ["CAManBase",100]) > 1) then
{
	[player,"refuel",0,false] call dayz_zombieSpeak;
}
else
{
	[player,"refuel",0,true] call dayz_zombieSpeak;
};

_id = [player,20,true,(getPosATL player)] spawn player_alertZombies;

sleep 6;

dayzSetFuel = [_vehicle,_newFuel];
dayzSetFuel spawn local_setFuel;
publicVariable "dayzSetFuel";

cutText [format[localize "str_player_05",_nameType,_canSize], "PLAIN DOWN"];
sleep 1;

call fnc_usec_medic_removeActions;
r_action = false;