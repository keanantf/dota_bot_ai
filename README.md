HERO SELECTION
===================================================
This is a hero selection file for Dota 2 Bot AI work.

This work has its permanent home at <http://github.com/somanyrobots/dota_bot_ai>.

Features
------------
* Selects random heroes for bots in a match.
* Implements a delay before picks start, to give any humans time to preempt bots.
* Implements a delay between bot picks, to give humans time to react.
* Alternates picks between teams.
* Does not pick duplicate heroes.
* Has a required_heroes list, where developers can insert heroes they want to
  force the bots to pick (for testing purposes).
* Has a quick_mode option, which eliminates all the delays.

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
