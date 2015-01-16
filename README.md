# PVE-Prison-Punish
PVE killers punish
What does it do?
Punishment for the PVE killers. 
They will sent to prison and must stay there for 10 minutes.
If they escape it will result in death !
After 10 minutes they will be released and put infront of the gate.


I Have the DZE Piggd Banking System installed

So after a kill they loose 1 briefcase money
after escape from prison and if they end up death they loose 2 briefcases.

If you don't have DZE Piggd Banking System remove the parts in "escapekill.sqf" that have been highlited in the files with //DZE Piggd Banking System 
And ajust the messages like you want to.

Server side.


Place this 

[code]if (_killer isKindOf "Man") then {
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
};[/code]
"Special thanks to Vampire for this code!"
below 
[code]_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];
[/code]
in server_playerDied.sqf

add the prison.sqf to your custom maps   
and add this to your server_functions.sqf at the bottom
[code]call compile preProcessFileLineNumbers "\z\addons\dayz_server\CUSTOMMAPS\prison.sqf";
[/code]
pack your server.pbo

Mission folder.

add these 2
[code]class Vehicles
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
[/code]
in mission.sqm

UPLOAD the directory "jail" in your addons in your mission file.

if you want the messages you have to have "remote_messages" installed

if you don't then add remote_messages.sqf to your custom directory

and place this 
[code]_nil = [] execVM "custom\remote_messages.sqf";[/code]

in your init.sqf  in the (!isDedicated) like below
[code]if (!isDedicated) then {
_nil = [] execVM "custom\remote_messages.sqf";
};[/code]

EXTRA POSSIBILITY 
If you dont want them to abort in prison place the Pzone.sqf in your mission directory i have it in my safezone directory.
Then add this in your init.sqf add the bottom.
[code][] ExecVM "addons\Safezone\Pzone.sqf";    [/code]


it is activated by the "canbuild" so you cannot abort in a trader city!

And add this part
[code]class Sensors
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
    };[/code]
 in your mission.sqm

If you have a suicide script you can add this 
[code]_prison = player distance jail_center_H > 100;
if (_prison) then {[/code]
below the following in your suicide script in your fn_selfActions.sqf
[code]private ["_handGun"];
_handGun = currentWeapon player;[/code]
And dont forget to close it with a extra bracket };

Download Files

Thats it.

Let's punish those PVE killers

Greetz  Rythron
