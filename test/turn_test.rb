require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'



class TurnTest < Minitest::Test
  def test_turn_exists_with_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
    assert_equal "Megan", turn.player1.name
    assert_equal deck1, turn.player1.deck
    assert_equal "Aurora", turn.player2.name
    assert_equal deck2, turn.player2.deck
  end

  def test_all_methods
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:club, '8', 8)
    card10 = Card.new(:club, '8', 8)
    card11 = Card.new(:heart, 'Ace', 14)
    card12 = Card.new(:club, 'Ace', 14)
    card13 = Card.new(:heart, '7', 7)
    card14 = Card.new(:spade, '7', 7)
    deck1 = Deck.new([card1, card2, card5, card8, card9, card11, card13])
    deck2 = Deck.new([card3, card4, card6, card7, card10, card12, card14])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war

    assert_equal :basic, turn.type
    assert_equal player1, turn.winner
    turn.award_spoils
    assert_equal 8, turn.player1.deck.cards.count

    assert_equal :war, turn.type
    assert_equal player2, turn.winner
    turn.award_spoils
    assert_equal 9, turn.player2.deck.cards.count


    assert_equal :mutually_assured_destruction, turn.type
    assert_equal "nobody wins this round!", turn.winner
    turn.pile_cards
    assert_equal 0, turn.spoils_of_war.count

  end
end
