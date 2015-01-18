_unit = _this select 0;

if (!alive _unit) exitWith {};

isKiller = true;

jail = [_unit] execVM "addons\jail\killer.sqf";
shield =[_unit] execVM "addons\jail\shield.sqf";
sleep 12;
escapee = [_unit] execVM "addons\jail\escapee.sqf";
escapekill = [_unit] execVM "addons\jail\escapekill.sqf";

s_player_suicide = -1;
s_player_suicide_confirm = -1;



