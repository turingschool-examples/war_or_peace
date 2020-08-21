require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'minitest/autorun'
require 'minitest/pride'

class TurnTest < MiniTest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_turn

     assert_equal @player1, @turn.player1
     assert_equal @player2, @turn.player2
  end

  def test_type
    war_card1 = Card.new(:heart, 'Jack', 11)
    war_card2 = Card.new(:heart, '10', 10)
    war_card3 = Card.new(:heart, '9', 11)
    war_card4 = Card.new(:diamond, 'Jack', 11)
    war_card5 = Card.new(:heart, '8', 8)
    war_card6 = Card.new(:diamond, 'Queen', 12)
    war_card7 = Card.new(:heart, '3', 3)
    war_card8 = Card.new(:diamond, '2', 2)
    war_deck1 = Deck.new([war_card1, war_card2, war_card5, war_card8])
    war_deck2 = Deck.new([war_card3, war_card4, war_card6, war_card7])
    war_player1 = Player.new("Megan", war_deck1)
    war_player2 = Player.new("Aurora", war_deck2)
    war_turn = Turn.new(war_player1, war_player2)

    mut_card1 = Card.new(:heart, 'Jack', 11)
    mut_card2 = Card.new(:heart, '10', 10)
    mut_card3 = Card.new(:heart, '9', 11)
    mut_card4 = Card.new(:diamond, 'Jack', 10)
    mut_card5 = Card.new(:heart, '8', 8)
    mut_card6 = Card.new(:diamond, 'Queen', 8)
    mut_card7 = Card.new(:heart, '3', 3)
    mut_card8 = Card.new(:diamond, '2', 2)
    mut_deck1 = Deck.new([mut_card1, mut_card2, mut_card5, mut_card8])
    mut_deck2 = Deck.new([mut_card3, mut_card4, mut_card6, mut_card7])
    mut_player1 = Player.new("Megan", mut_deck1)
    mut_player2 = Player.new("Aurora", mut_deck2)
    mutually_assured_destruction_turn = Turn.new(mut_player1, mut_player2)

     assert_equal :basic, @turn.type
     assert_equal :war, war_turn.type
     assert_equal :mutually_assured_destruction, mutually_assured_destruction_turn.type
  end

  def test_winner
    war_card1 = Card.new(:heart, 'Jack', 11)
    war_card2 = Card.new(:heart, '10', 10)
    war_card3 = Card.new(:heart, '9', 11)
    war_card4 = Card.new(:diamond, 'Jack', 11)
    war_card5 = Card.new(:heart, '8', 8)
    war_card6 = Card.new(:diamond, 'Queen', 12)
    war_card7 = Card.new(:heart, '3', 3)
    war_card8 = Card.new(:diamond, '2', 2)
    war_deck1 = Deck.new([war_card1, war_card2, war_card5, war_card8])
    war_deck2 = Deck.new([war_card3, war_card4, war_card6, war_card7])
    war_player1 = Player.new("Megan", war_deck1)
    war_player2 = Player.new("Aurora", war_deck2)
    war_turn = Turn.new(war_player1, war_player2)

    mut_card1 = Card.new(:heart, 'Jack', 11)
    mut_card2 = Card.new(:heart, '10', 10)
    mut_card3 = Card.new(:heart, '9', 11)
    mut_card4 = Card.new(:diamond, 'Jack', 10)
    mut_card5 = Card.new(:heart, '8', 8)
    mut_card6 = Card.new(:diamond, 'Queen', 8)
    mut_card7 = Card.new(:heart, '3', 3)
    mut_card8 = Card.new(:diamond, '2', 2)
    mut_deck1 = Deck.new([mut_card1, mut_card2, mut_card5, mut_card8])
    mut_deck2 = Deck.new([mut_card3, mut_card4, mut_card6, mut_card7])
    mut_player1 = Player.new("Megan", mut_deck1)
    mut_player2 = Player.new("Aurora", mut_deck2)
    mutually_assured_destruction_turn = Turn.new(mut_player1, mut_player2)

    assert_equal @player1, @turn.winner
    assert_equal "No Winner", mutually_assured_destruction_turn.winner
    assert_equal war_player2, war_turn.winner
  end

  def test_pile_cards
    war_card1 = Card.new(:heart, 'Jack', 11)
    war_card2 = Card.new(:heart, '10', 10)
    war_card3 = Card.new(:heart, '9', 11)
    war_card4 = Card.new(:diamond, 'Jack', 11)
    war_card5 = Card.new(:heart, '8', 8)
    war_card6 = Card.new(:diamond, 'Queen', 12)
    war_card7 = Card.new(:heart, '3', 3)
    war_card8 = Card.new(:diamond, '2', 2)
    war_deck1 = Deck.new([war_card1, war_card2, war_card5, war_card8])
    war_deck2 = Deck.new([war_card3, war_card4, war_card6, war_card7])
    war_player1 = Player.new("Megan", war_deck1)
    war_player2 = Player.new("Aurora", war_deck2)
    war_turn = Turn.new(war_player1, war_player2)

    mut_card1 = Card.new(:heart, 'Jack', 11)
    mut_card2 = Card.new(:heart, '10', 10)
    mut_card3 = Card.new(:heart, '9', 11)
    mut_card4 = Card.new(:diamond, 'Jack', 10)
    mut_card5 = Card.new(:heart, '8', 8)
    mut_card6 = Card.new(:diamond, 'Queen', 8)
    mut_card7 = Card.new(:heart, '3', 3)
    mut_card8 = Card.new(:diamond, '2', 2)
    mut_deck1 = Deck.new([mut_card1, mut_card2, mut_card5, mut_card8])
    mut_deck2 = Deck.new([mut_card3, mut_card4, mut_card6, mut_card7])
    mut_player1 = Player.new("Megan", mut_deck1)
    mut_player2 = Player.new("Aurora", mut_deck2)
    mutually_assured_destruction_turn = Turn.new(mut_player1, mut_player2)

    assert_equal [war_card1, war_card3, war_card2, war_card4, war_card5, war_card6], war_turn.pile_cards
    assert_equal [], mutually_assured_destruction_turn.pile_cards
    assert_equal [@card1, @card3], @turn.pile_cards
  end

  def test_award_spoils
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    deck1 = Deck.new([card3, card2])
    deck2 = Deck.new([card1, card4])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    the_winner = turn.winner

    assert_equal [card4, card3, card1], turn.award_spoils(the_winner)
    assert_equal [@card2, @card5, @card8, @card1, @card3], @turn.award_spoils(@player1)
  end

end
