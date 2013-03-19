_Hack = _this select 0;
_Name = _this select 1;
_Script = _this select 2;
_Type = _this select 3;

//hint format ["%1 , %2 , %3 , %4",_Hack,_Name,_Script,_Type];

if (_Type == "SQS" ) then { [_Name,_Hack] exec format["%1",_Script];};
if (_Type == "SQF" ) then { [_Name,_Hack] execVM format["%1",_Script];};