private["_case"];
_case = _this select 1;


player addWeapon _case;

_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

{
player addmagazine _x;
player addmagazine _x;
player addmagazine _x;
player addmagazine _x;
}foreach _magazines;

reload player;