private ["_unit"];

_unit = _this select 0;
_unit setdir 140;
cutText ['','black'];
_ebayrandomspawn = [[1383.84,4060.98,6.7], [1365.49,4018.96,0.001], [1354.59,4029.89,0.001], [1377.01,4063.66,0.001], [1342.9,4052.88,0.001], [1387.26,4052.39,0.001], [1376.87,4069.25,6.583], [1396.61,4046.41,6.606], [1360.35,4017.93,6.558],
 [1350.47,4029.77,6.557], [1344.58,4041.73,0.001], [1384.24,4055.02,0.001], [1384.24,4055.02,0.001], [1348.86,4110.56,0.001]] call BIS_fnc_selectRandom;
_unit setPosATL _ebayrandomspawn;
cutText ['','black in', 5];

customRemoteMessage = ['globalChat', "I have been sent to jail, somebody coming to visit me?", _unit];
publicVariable "customRemoteMessage";

sleep 10;

customRemoteMessage = ['titleCut', "You will be released after 10 minutes of Jail time.\nDo not try to escape you will be shot!", _unit];
publicVariable "customRemoteMessage";

sleep 600;
_unit allowDamage false;

customRemoteMessage = ['titleCut', "You will be released from Jail now\nDo not kill Players any more!", _unit];
publicVariable "customRemoteMessage";
sleep 10;
inJail=false;
isKiller=false;
terminate shield;
terminate escapee;
terminate escapekill;
_unit setDir 180;
cutText ['','black'];
_unit setPos [1361.91,3979.33,0.001];
cutText ['','black in', 5];

sleep 5;
customRemoteMessage = ['globalChat', "I have been released from jail, can somebody pick me up?", _unit];
publicVariable "customRemoteMessage";
sleep 65;
_unit allowDamage true;