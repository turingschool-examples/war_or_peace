require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_instance_of(Turn, turn)
  end

  def test_it_has_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal(player1, turn.player1)
    assert_equal(player2, turn.player2)
    assert_equal([], turn.spoils_of_war)
  end

  def test_turn_has_a_basic_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal(:basic, turn.type)
  end

  def test_basic_turn_has_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal(player1, turn.winner)

  end

  def test_basic_turn_can_pile_cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    turn.pile_cards

    assert_equal([card1, card3], turn.spoils_of_war)

  end

  def test_basic_turn_can_award_spoils_to_winner

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    turn.pile_cards

    turn.awards_spoils(winner)

    assert_equal(deck1 ,player1.deck)
    assert_equal(5, player1.deck.cards.length)
    assert_equal(deck2 ,player2.deck)
    assert_equal(3, player2.deck.cards.length)

  end

  def test_war_turn_has_a_winner
    pry(main)> card1 = Card.new(:heart, 'Jack', 11)
#=> #<Card:0x007fc42a170fe8 @rank=11, @suit=:heart, @value="Jack">
pry(main)> card2 = Card.new(:heart, '10', 10)
#=> #<Card:0x007fc42a0f1b58 @rank=10, @suit=:heart, @value="10">
pry(main)> card3 = Card.new(:heart, '9', 9)
#=> #<Card:0x007fc42aa85a98 @rank=9, @suit=:heart, @value="9">
pry(main)> card4 = Card.new(:diamond, 'Jack', 11)
#=> #<Card:0x007fc42a205508 @rank=11, @suit=:diamond, @value="Jack">
pry(main)> card5 = Card.new(:heart, '8', 8)
#=> #<Card:0x007fc42a2149e0 @rank=8, @suit=:heart, @value="8">
pry(main)> card6 = Card.new(:diamond, 'Queen', 12)
#=> #<Card:0x007fc42a1e4790 @rank=12, @suit=:diamond, @value="Queen">
pry(main)> card7 = Card.new(:heart, '3', 3)
#=> #<Card:0x007fc42a1b4c98 @rank=3, @suit=:heart, @value="3">
pry(main)> card8 = Card.new(:diamond, '2', 2)
#=> #<Card:0x007fc42a1580d8 @rank=2, @suit=:diamond, @value="2">

pry(main)> deck1 = Deck.new([card1, card2, card5, card8])
#=> #<Deck:0x007fc42a05a258 @cards=[#<Card:0x007fc42a170fe8...>, #<Card:0x007fc42a0f1b58...>, #<Card:0x007fc42a2149e0...>, #<Card:0x007fc42a1580d8...>]>

pry(main)> deck2 = Deck.new([card4, card3, card6, card7])
#=> #<Deck:0x007fc42a248678 @cards=[#<Card:0x007fc42a205508...>, #<Card:0x007fc42aa85a98...>, #<Card:0x007fc42a1e4790...>, #<Card:0x007fc42a1b4c98...>]>

pry(main)> player1 = Player.new("Megan", deck1)
#=> #<Player:0x007fc42a113000 @deck=#<Deck:0x007fc42a05a258...>, @name="Megan">

pry(main)> player2 = Player.new("Aurora", deck2)
#=> #<Player:0x007fc42aab6b70 @deck=#<Deck:0x007fc42a248678...>, @name="Aurora">

pry(main)> turn = Turn.new(player1, player2)
#=> #<Turn:0x007fc42a20d488 @player1=#<Player:0x007fc42a113000 @deck=#<Deck:0x007fc42a05a258...>, @name="Megan">, @player2=#<Player:0x007fc42aab6b70 @deck=#<Deck:0x007fc42a248678...>, @name="Aurora">, @spoils_of_war=[]>

pry(main)> turn.type
#=> :war
end

end
