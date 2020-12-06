require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '3', 3)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_type_basic
    assert_equal :basic, @turn.type
  end

  def test_type_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card7, @card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :basic, @turn.type
  end

  def test_type_mutually_assured_destruction
    deck1 = Deck.new([@card1, @card2, @card8, @card5])
    deck2 = Deck.new([@card4, @card3, @card7, @card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_winner_basic
    assert_equal @player1, @turn.winner
  end

  def test_winner_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card7, @card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_winner_mutual
    deck1 = Deck.new([@card1, @card2, @card8, @card5])
    deck2 = Deck.new([@card4, @card3, @card7, @card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_nil turn.winner
  end

  def test_pile_of_cards_basic
    @turn.pile_cards

    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_pile_of_cards_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card7, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [card1, card2, card5, card4, card3, card7], turn.spoils_of_war
  end

  def test_pile_of_cards_mutual
    deck1 = Deck.new([@card1, @card2, @card8, @card5])
    deck2 = Deck.new([@card4, @card3, @card7, @card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [@card5], player1.deck.cards
    assert_equal [@card6], player2.deck.cards
  end

  def test_reward_spoils
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card7, card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner
    turn.pile_cards
    turn.reward_spoils(winner)
    #[card8, card1, card2, card5, card4, card3, card7]
    assert_equal [card8, card1, card2, card5, card4, card3, card7], player1.deck.cards
    assert_equal [card6], player2.deck.cards
  end
end
