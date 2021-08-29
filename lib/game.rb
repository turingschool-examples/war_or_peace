require './lib/player'
require './lib/deck'

class Game
  attr_reader   :player1,
                :player2,
                :cards


  def initialize
    deck    = Deck.new([])

    deck.add_card(Card.new(:diamond, '2', 2))
    deck.add_card(Card.new(:diamond, '3', 3))
    deck.add_card(Card.new(:diamond, '4', 4))
    deck.add_card(Card.new(:diamond, '5', 5))
    deck.add_card(Card.new(:diamond, '6', 6))
    deck.add_card(Card.new(:diamond, '7', 7))
    deck.add_card(Card.new(:diamond, '8', 8))
    deck.add_card(Card.new(:diamond, '9', 9))
    deck.add_card(Card.new(:diamond, '10', 10))
    deck.add_card(Card.new(:diamond, 'Jack', 11))
    deck.add_card(Card.new(:diamond, 'Queen', 12))
    deck.add_card(Card.new(:diamond, 'King', 13))
    deck.add_card(Card.new(:diamond, 'Ace', 14))
    deck.add_card(Card.new(:spade, '2', 2))
    deck.add_card(Card.new(:spade, '3', 3))
    deck.add_card(Card.new(:spade, '4', 4))
    deck.add_card(Card.new(:spade, '5', 5))
    deck.add_card(Card.new(:spade, '6', 6))
    deck.add_card(Card.new(:spade, '7', 7))
    deck.add_card(Card.new(:spade, '8', 8))
    deck.add_card(Card.new(:spade, '9', 9))
    deck.add_card(Card.new(:spade, '10', 10))
    deck.add_card(Card.new(:spade, 'Jack', 11))
    deck.add_card(Card.new(:spade, 'Queen', 12))
    deck.add_card(Card.new(:spade, 'King', 13))
    deck.add_card(Card.new(:spade, 'Ace', 14))
    deck.add_card(Card.new(:club, '2', 2))
    deck.add_card(Card.new(:club, '3', 3))
    deck.add_card(Card.new(:club, '4', 4))
    deck.add_card(Card.new(:club, '5', 5))
    deck.add_card(Card.new(:club, '6', 6))
    deck.add_card(Card.new(:club, '7', 7))
    deck.add_card(Card.new(:club, '8', 8))
    deck.add_card(Card.new(:club, '9', 9))
    deck.add_card(Card.new(:club, '10', 10))
    deck.add_card(Card.new(:club, 'Jack', 11))
    deck.add_card(Card.new(:club, 'Queen', 12))
    deck.add_card(Card.new(:club, 'King', 13))
    deck.add_card(Card.new(:club, 'Ace', 14))
    deck.add_card(Card.new(:heart, '2', 2))
    deck.add_card(Card.new(:heart, '3', 3))
    deck.add_card(Card.new(:heart, '4', 4))
    deck.add_card(Card.new(:heart, '5', 5))
    deck.add_card(Card.new(:heart, '6', 6))
    deck.add_card(Card.new(:heart, '7', 7))
    deck.add_card(Card.new(:heart, '8', 8))
    deck.add_card(Card.new(:heart, '9', 9))
    deck.add_card(Card.new(:heart, '10', 10))
    deck.add_card(Card.new(:heart, 'Jack', 11))
    deck.add_card(Card.new(:heart, 'Queen', 12))
    deck.add_card(Card.new(:heart, 'King', 13))
    deck.add_card(Card.new(:heart, 'Ace', 14))

    deck.shuffle!

    @player1  = Player.new('Clarisa', deck)
    @player2  = Player.new('Clarisa', deck)


  end

  def start
    p "Welcome to War (or Peace)!"
  end

  def shuffle(cards)
    cards.shuffle!
  end

end
