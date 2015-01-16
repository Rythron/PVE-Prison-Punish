_unit = _this select 0;
_veh = (vehicle player);
if (driver _veh == _unit) then {
	waitUntil {driver _veh != _unit};
};
_veh = (vehicle _unit);
unassignVehicle _unit;
doGetOut _unit;
sleep 1;
_unit assignAsDriver _veh;
_unit moveInDriver _veh;

_unit action["EngineOn",_veh];
_veh engineOn true; 

if ((local _unit) && (!isServer)) then {

	cutText ["YOU ARE NOW THE PILOT","PLAIN DOWN",2];
	sleep 8;
	cutText ["","PLAIN DOWN",2];
};