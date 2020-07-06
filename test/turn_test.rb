require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player_1 = Player.new('Calvin', deck)
    player_2 = Player.new('Hobbes', deck)

  end

  def test_created_with_two_players
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player_1 = Player.new('Calvin', deck)
    player_2 = Player.new('Hobbes', deck)
    turn = Turn.new(player_1, player_2)

    assert_equal ['Calvin', 'Hobbes'], [player_1.name, player_2.name]
  end

  def test_it_knows_winner_of_turn

#setup for player_1 winning basic turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "3", 3)
    card4 = Card.new(:spade, "Ace", 14)
    card5 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    assert_equal player_1, turn.winner_of_turn

#set up for player_2 winning basic turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "3", 3)
    card4 = Card.new(:spade, "Ace", 14)
    card5 = Card.new(:heart, "2", 2)
    cards2 = [card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    assert_equal player_2, turn.winner_of_turn

#set up for player_1 winning war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "Queen", 12)
    card4 = Card.new(:spade, "Ace", 14)
    card5 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)
    assert_equal player_1, turn.winner_of_turn

    require "pry"; binding.pry

#set up for mutually_assured_destruction
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "Queen", 12)
    card5 = Card.new(:spade, "Ace", 14)
    card4 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    assert_equal "No Winner", turn.winner_of_turn
  end

  def test_it_can_pile_cards

    #pile for :basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "3", 3)
    card4 = Card.new(:spade, "Ace", 14)
    card5 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    assert_equal [card1, card3], turn.pile_cards

    #pile for :war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card4 = Card.new(:club, "Queen", 12)
    card5 = Card.new(:spade, "Ace", 14)
    card6 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    # assert_equal [card1, card2, card3, card4, card5, card6], turn.pile_cards

    #pile for :mutually_assured_destruction
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "Queen", 12)
    card5 = Card.new(:spade, "Ace", 14)
    card4 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    assert_equal [], turn.pile_cards

  end

  def test_it_properly_awards_spoils

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck1 = Deck.new(cards)
    player_1 = Player.new('Calvin', deck1)
    card3 = Card.new(:club, "3", 3)
    card4 = Card.new(:spade, "Ace", 14)
    card5 = Card.new(:heart, "2", 2)
    cards2 = [card3, card4, card5]
    deck2 = Deck.new(cards2)
    player_2 = Player.new('Hobbes', deck2)
    turn = Turn.new(player_1, player_2)

    turn.pile_cards
    assert_equal [card1, card3], turn.award_spoils(player_1)
  end
end
