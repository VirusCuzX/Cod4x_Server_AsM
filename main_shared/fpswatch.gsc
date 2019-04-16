init()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread fpsWatch2();
    }
}

fpsWatch2()
{
    for (;;)
    {
        self endon( "disconnect" );
        wait 10;
        fps = self GetCountedFPS();
        if (fps > 277)
        {
		wait 15;
		self setClientDvar( "com_maxfps", 250 );
        wait 1;
        }
    }
}