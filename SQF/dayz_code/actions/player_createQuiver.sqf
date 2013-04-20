private["_qty_arrows","_qty_quivers","_qty_quiverarrows"];
call gear_ui_init;

_qty_arrows = {_x == "WoodenArrow"} count magazines player;
_qty_quivers = {_x == "Quiver"} count magazines player;

if (_qty_quivers > 0) exitWith { cutText ["You cannot have more quivers.", "PLAIN DOWN"];};
if (_qty_arrows < 2) exitWith { cutText ["You do not have enough arrows.", "PLAIN DOWN"];}; //Not enough arrows to create quiver

_qty_quiverarrows = _qty_arrows min 6;

for "_x" from 1 to _qty_quiverarrows do {
	player removeMagazine "WoodenArrow";
};
player addMagazine ["Quiver",_qty_quiverarrows];
cutText [format["You have create a quiver containing %1 arrows.",_qty_quiverarrows], "PLAIN DOWN"];
