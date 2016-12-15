Dota 2 Bot AI
===================================================
This is a general project for Dota 2 Bot AI work. Currently the only working
features is an updated hero selection script.

This work has its permanent home at <http://github.com/somanyrobots/dota_bot_ai>.


HERO SELECTION
===============

FEATURES
------------
* Selects random heroes for bots in a match.
* Implements a delay before picks start, to give any humans time to preempt bots.
* Implements a delay between bot picks, to give humans time to react.
* Alternates picks between teams.
* Does not pick duplicate heroes.
* Has a required_heroes list, where developers can insert heroes they want to
  force the bots to pick (for testing purposes).
* Has a quick_mode option, which eliminates all the delays.

LIMITATIONS
------------
* Currently does not allow humans to pick their own heroes
* Currently only works with a human in a player slot - using a coach or spectator
  slot will break the script.


TODOs
-------------
* Determine which slots have human players, and don't pick for those slots.
* Determine which teams any given slot belongs to - this will enable intelligent
  picking & hero compositions.

USING THIS PROJECT
------------------
* clone this project, then copy or symlink any .lua scripts you want to use into
  dota 2 beta\game\dota\scripts\vscripts\bots
* If you want to revert to standard bot AI at any time, switch branches to the "empty"
  branch, which contains no changes whatsoever. It will run vanilla AIs.
* IMPORTANT: by default, the script assumes the bots will be populating player
  slots 2-11. Different ways of starting matches result in different slot numbers,
  however! You should open up a console to check what slots are being used, and then
  adjust the radiantSlots, direSlots, and maxPlayerID variables in the script
  accordingly.
  * If you boot up the client, then start a game via "practice with bots", then
    you will likely be using 0-9.
  * If you create a lobby, and put your human in a coach slot, you will likely
    be using 2-11.
  * If you create a lobby, start a game, leave it, and then go to "practice with bots",
    you will likely be using 1-10.
  This issue should be fixed as soon as I find ways to address the two TODOs above.
