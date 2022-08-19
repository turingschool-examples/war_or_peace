## War or Peace

This is the starter repo for the BE Mod1 **War or Peace** project.

bugs: 
1. `Turn#type` is looking at cards in a players deck, regardless of the quantity of cards in the deck; there may be fewer cards than are being assigned to variables....
2. `Turn#winner` returns either a `Player` object, or the String `'No winner'`. Work this into the runner somehow....then get the test to pass again