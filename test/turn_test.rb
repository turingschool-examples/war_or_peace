# Write out test script
require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'
# Forgot to add this require
require './lib/turn'

class TurnTest < Minitest::Test

  # First test to see if it exists
  # Write the class slowly as you write this test
  def test_it_exists
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:club, 'Queen', 12)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)

    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])

    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    # require 'pry'; binding.pry
    # pry showed the error is in the Turn below...
    # OMG... I think I forgot to link the Class file to the test file!


    # current (correct) error because I haven't begun writing the Turn class
    # hmmm... new error after creating class...

    # testing with pry
    # require 'pry'; binding.pry

    turn = Turn.new(player_1, player_2)
    # SUCCESS!!!

    # require 'pry'; binding.pry
    # Write a test to check two players
      # Do I really need to write this as a seperate test?
      # Can I just use pry in my it_exists test
      # created a attr_accessor
      # [1] pry(#<TurnTest>)> turn.player_1
      # => #<Player:0x00007fee9d81e078
      #  @deck=
      #   #<Deck:0x00007fee9d81e2d0
      #    @cards=
      #     [#<Card:0x00007fee9d81eca8 @rank=11, @suit=:club, @value="Jack">,
      #      #<Card:0x00007fee9d81eb68 @rank=2, @suit=:spade, @value="Two">,
      #      #<Card:0x00007fee9d81e8c0 @rank=8, @suit=:heart, @value="Eight">,
      #      #<Card:0x00007fee9d81e5a0 @rank=14, @suit=:spade, @value="Ace">]>,
      #  @name="Priya">
      # [2] pry(#<TurnTest>)> turn.player_2
      # => #<Player:0x00007fee9d81dfb0
      #  @deck=
      #   #<Deck:0x00007fee9d81e190
      #    @cards=
      #     [#<Card:0x00007fee9d81ec08 @rank=7, @suit=:heart, @value="Seven">,
      #      #<Card:0x00007fee9d81ea50 @rank=13, @suit=:diamond, @value="King">,
      #      #<Card:0x00007fee9d81e780 @rank=12, @suit=:club, @value="Queen">,
      #      #<Card:0x00007fee9d81e460 @rank=3, @suit=:diamond, @value="Three">]>,
      #  @name="Ricky">
      # [3] pry(#<TurnTest>)> turn.spoils_of_war
      # => []
  end

  # Write a test to check type method
  def test_what_type_of_turn
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:club, 'Queen', 12)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)
    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)


    turn = Turn.new(player_1, player_2)

    # assert_equal :basic, turn.type
      # for basic, card_1 and card_2 are NOT the same
      # WORKS!

    # assert_equal :war, turn.type
      # for war, card_1 and card_2 MUST be the same
      # Works!

    # assert_equal :mutually_assured_destruction, turn.type
      # for mutual, card_1 and card_2 must equal AND card_5 and card_6 must match
      # realized order of if statement was IMPORTANT!!

    # TESTED EDGE CASE to ensure that mutually assured and war don't interfere
  end


  # Write a test to check winner method
  def test_winner_returns_correct_player
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:club, 'Queen', 12)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)
    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    turn = Turn.new(player_1, player_2)

    assert_equal "Priya won 2 cards :)", turn.winner
    # assert_equal 'WAR! - Ricky won 6 cards. *\(^o^)/*', turn.winner
    # assert_equal "No Winner. DUN DUN DUUUUUNNNN!", turn.winner
    # Tested as many cases as I could think of
    # (changed card numbers and tested for 'errors'),
    # works :)
  end

  # Write a test to check pile_cards method
  def test_pile_cards_sends_correct_cards
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:club, 'Queen', 12)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)
    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    turn = Turn.new(player_1, player_2)

    # :basic will be card_1 = 11; card_2 = 7 ==> winner Priya
    # :basic will be card_1 = 7; card_2 = 11 ==> winner Ricky
    # assert_equal "type = :basic AND Priya won 2 cards :)", turn.pile_cards
    assert_equal [card_1, card_2], turn.pile_cards

    # :war will be (card_1 = 7; card_2 = 7)
      #AND (card_5 = 8, card_6 = 12) ==> winner Ricky
    # :war will be (card_1 = 7; card_2 = 7)
      #AND (card_5 = 12, card_6 = 8) ==> winner Priya
    # assert_equal 'type = :war AND WAR! - Ricky won 6 cards. *\(^o^)/*', turn.pile_cards
    # assert_equal [card_1, card_2, card_3, card_4, card_5, card_6], turn.pile_cards

    # :mutual will be (card_1 = 7; card_2 = 7)
      #AND (card_5 = 12, card_6 = 12) ==> winner NONE
    # assert_equal 'type = :mutual AND Mutually Assured Destruction! 6 cards removed from the deck. (;_;)', turn.pile_cards
    # assert_equal [player_1.deck, player_2.deck], turn.pile_cards
  end
  # Write a test to check award_spoils method

  # card_1 = Card.new(:club, 'Jack', 11)
  # card_2 = Card.new(:heart, 'Seven', 7)
  # card_3 = Card.new(:spade, 'Two', 2)
  # card_4 = Card.new(:diamond, 'King', 13)
  # card_5 = Card.new(:heart, 'Eight', 8)
  # card_6 = Card.new(:club, 'Queen', 12)
  # card_7 = Card.new(:spade, 'Ace', 14)
  # card_8 = Card.new(:diamond, 'Three', 3)
  # deck_1 = Deck.new([card_1, card_3, card_5, card_7])
  # deck_2 = Deck.new([card_2, card_4, card_6, card_8])
  # player_1 = Player.new('Priya', deck_1)
  # player_2 = Player.new('Ricky', deck_2)
  # turn = Turn.new(player_1, player_2)

  # assert_equal spoils_of_war = [card_1, card_2], turn.kkkkkkkk

end
