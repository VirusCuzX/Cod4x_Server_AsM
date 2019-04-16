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
warntime = 6;
    for (;;)
    {
        self endon( "disconnect" );
        fps = self GetCountedFPS();
        if (fps > 330)
        {
		warnTime--;
		self iPrintLnBold( "^1Client Violation : ^7333 FPS is not allowed.You will be kicked after " + warnTime + " times warning" );
		self.lastWarnTime = getTime();
	}
		
		else if( warnTime < 6 && isDefined( self.lastWarnTime ) && getTime() - self.lastWarnTime > 300000  ) 
{
		warnTime = 6;
}
		if( warnTime == 0 )
		{
		exec( "kick " + self getEntityNumber() + " 333 FPS is not allowed" );
		IprintLnBold(self," ^1is using 333fps! ^7Kicking...");
		}	
		wait 1;
	}
}
