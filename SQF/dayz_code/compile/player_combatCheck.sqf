/*
Inital Idea by Daimyo
*/

private["_dialog","_dangerNear","_inCombat","_inVehicle"];

	_inCombat = player getVariable["startcombattimer",0];
	_inVehicle = (vehicle player != player);
	_dangerNear = (getPosATL player) nearEntities [["zZombie_Base","CAManBase"],30];

/*
if (player in _dangerNear) then {
	_dangerNear set [0, player]; 
	_dangerNear = _dangerNear - [player];
};
*/

if (_inVehicle && (speed player != 0)) exitwith {};

if (count _dangerNear > 1) then {
	player setVariable["startcombattimer", 1, true];
};