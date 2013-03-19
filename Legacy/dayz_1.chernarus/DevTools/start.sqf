hint "Dev tools loaded, press scroll lock!";
closedialog 0;
    cutText ['','PLAIN',0];
    endloadingscreen;

    TAG_onKeyDown =
{
     private ["_key", "_return"];
     _shift = _this select 2;
     _key = _this select 1;
     _return = false;
     if (_key == 70) then //Scroll lock
     {

    _nill= execvm "DevTools\start2.sqf";

               _shift = nil;

     };
    _return
};


waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["keyDown", "_this call TAG_onKeyDown"];