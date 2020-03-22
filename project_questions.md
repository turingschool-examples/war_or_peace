# Questions about improving my project

**How to test edge cases for turn.pile_cards?**
  - What if a player has less than the needed cards? They should lose if the
  turn type is war or mutually_assured_destruction. How can I test this properly?

**How to make my tests easier to be modified?**
  - My turn test in particular relies a lot on specific variables. Is there a
  better way to do my setup so my tests are not so directly coupled to the way
  I use the setup method?

**When testing a class should I be relying on methods in other classes?**
  - For example, in my TurnTest class am I better off calling player.deck.remove_card
  or player.deck.cards.drop()? Does calling .remove_card couple my tests to
  other classes to much?

**Is using a shovel method inside an assertation okay to do?**
  - Example:
    assert_equal (cards_before_turn_player1 << cards_before_turn_player2[0]), @player1_basic.deck.cards

**Is it poor design to have have a call to cascading methods like I do in my
GameSetup class? In my start method I call on make_players, which calls on
make_player_decks, which calls on make_standard_deck. Should this be decoupled?**
