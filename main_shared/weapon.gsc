init()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread weapon();
    }
}

weapon()
{
    for (;;)
    {
        self endon( "disconnect" );
        wait 10;
        fps = self GetCountedFPS();
        if (fps > 1)
        {
	wait 15;
	self setClientDvar( "cg_weaponcycledelay", 0 );
	self setClientDvar( "compassplayerheight", 18.75 );
	self setClientDvar( "compassplayerwidth", 18.75 );
        wait 1;
        }
    }
}