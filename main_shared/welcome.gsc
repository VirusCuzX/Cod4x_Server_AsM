init()
{
    for(;;)
    {
        level waittill("connected", player); // Waits until a new player connects - player stored in "player" variable.
        player thread welcome(); // Execute a new thread for "player".
    }
}

welcome()
{
    // "player" is referenced as "self" now.
    self endon("disconnect"); // If player was connected but left without spawning, thread will lock because of next statement.
    self waittill("spawned_player"); // Waits until the player spawned.
    self iprintlnbold("Welcome " + self.name + " Good Luck & Have Fun!"); // Writes the welcome message bold and centered on the player's screen.
}