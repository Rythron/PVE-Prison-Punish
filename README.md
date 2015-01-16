# PVE-Prison-Punish
PVE killers punish
What does it do?
Punishment for the PVE killers. 
They will sent to prison and must stay there for 10 minutes.
If they escape it will result in death !
After 10 minutes they will be released and put in front of the gate.


I Have the DZE Piggd Banking System 
http://epochmod.com/forum/index.php?/topic/16154-release-dze-piggd-banking-system/?hl=piggd

So after a kill they loose 1 briefcase money
after escape from prison and if they end up death they loose 2 briefcases.

If you don't have DZE Piggd Banking System remove the parts in "escapekill.sqf" that are highlighted in the files with //DZE Piggd Banking System 
And adjust the messages like you want to have them.


Server side.


Place this 

if (_killer isKindOf "Man") then {
   [_killer] execVM "addons\jail\start_punish.sqf"
} else {
   if ((count crew _killer) > 1) then {
     if ((gunner _killer) in (crew _killer)) then {
       [(gunner _killer)] execVM "addons\jail\start_punish.sqf"
     } else {
       [(driver _killer)] execVM "addons\jail\start_punish.sqf"
     };
   } else {
     [(driver _killer)] execVM "addons\jail\start_punish.sqf"
   };
};
"Special thanks to Vampire for this code!"
below 
_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];

in server_playerDied.sqf

The prison it self.
http://epochmod.com/forum/index.php?/topic/6391-pavlovo-prison/?hl=%2Bpavlovo+%2Bprison

add the prison.sqf to your custom maps   
and add this to your server_functions.sqf at the bottom
call compile preProcessFileLineNumbers "\z\addons\dayz_server\CUSTOMMAPS\prison.sqf";

pack your server.pbo

Mission folder.

add these 2
class Vehicles
    {
        items=4; // add + 1 
        class Item3 // your follow up number
        {
            position[]={1348.44,339,4065.91};
            azimut=182.39052;
            id=53;
            side="EMPTY";
            vehicle="HeliHEmpty";
            skill=0.60000002;
            text="jail_center_H";
            description="the jail center point";
        };
       
    };

class Markers
    {
        items=29; // add + 1
        class Item28 // your follow up number
            {
            position[]={1348.44,339,4065.91};
            name="Prison";
            text="Prison";
            type="o_mech_inf";
            colorName="ColorRed";
        };   
   };

in mission.sqm

UPLOAD the directory "jail" in your addons in your mission file.

if you want the messages you have to have "remote_messages" installed

if you don't then add remote_messages.sqf to your custom directory

and place this 
_nil = [] execVM "custom\remote_messages.sqf";

in your init.sqf  in the (!isDedicated) like below
if (!isDedicated) then {
_nil = [] execVM "custom\remote_messages.sqf";
};

EXTRA POSSIBILITY 
If you dont want them to abort in prison place the Pzone.sqf in your mission directory i have it in my safezone directory.
Then add this in your init.sqf add the bottom.
[] ExecVM "addons\Safezone\Pzone.sqf";    


it is activated by the "canbuild" so you cannot abort in a trader city!

And add this part
class Sensors
   {
        items=14; // add + 1
        class Item13 // your follow up number
           {
            position[]={1348.44,339,4065.91};
            a=100;
            b=100;
            activationBy="WEST";
            repeating=1;
            interruptable=0;
            age="UNKNOWN";
            name="Prison";
            expCond="(player distance Prison) < 100;";
            expActiv="inPZone = true;";
            expDesactiv="canbuild = true;inPZone = false;";
            class Effects   
            {
            };
        };
    };
 in your mission.sqm

If you have a suicide script you can add this 
_prison = player distance jail_center_H > 100;
if (_prison) then {
below the following in your suicide script in your fn_selfActions.sqf
private ["_handGun"];
_handGun = currentWeapon player;
And dont forget to close it with a extra bracket };

Download Files

Thats it.

Let's punish those PVE killers

Greetz  Rythron

https://www.youtube.com/watch?v=cUAkJ5pOCY8
