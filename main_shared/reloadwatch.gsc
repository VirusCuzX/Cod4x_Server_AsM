//SCRIPT START
init()
{
    for(;;)
    {
        level waittill("connected",player);        
	player thread watchReload(); 
    }
}
watchReload()
{
self endon("disconnect");

while(1)
{
self waittill("spawned_player");
self thread watch_weapon_change();
}
}

watch_weapon_change()
{
self endon("death");
self endon("disconnect");

while(1)
{
self waittill("weapon_change",MyWeapon);
if(MyWeapon == "none") continue;// Climbing ladder or mantling.
if(WeaponIsBoltAction(MyWeapon)) continue;// Exempt Bolt-Action Rifles and Pump Shotguns to avoid long empty reload.

self thread watch_reload(MyWeapon);
}
}

watch_reload(MyWeapon)
{
self endon( "death" );
self endon( "disconnect" );
self endon( "weapon_change");

while(1)
{
self waittill("reload_start");

AmmoClip = self GetWeaponAmmoClip(MyWeapon);
self SetWeaponAmmoClip(MyWeapon,0);

AmmoStock = self GetWeaponAmmoStock(MyWeapon);
self setWeaponAmmoStock(MyWeapon,(AmmoStock + AmmoClip));
}
}