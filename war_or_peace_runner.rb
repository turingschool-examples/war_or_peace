require './lib/player'
require './lib/card'
require './lib/deck'
require './lib/turn'

class Game
  def initialize

    suits = [:diamond, :heart, :spade, :club]
    deck52 = Deck.new([])

    suits.each do |suit|
      for i in 2..10 do
        deck52.add_card(Card.new(suit, i.to_s, i))
      end

      deck52.add_card(Card.new(suit, 'Jack', 11))
      deck52.add_card(Card.new(suit, 'Queen', 12))
      deck52.add_card(Card.new(suit, 'King', 13))
      deck52.add_card(Card.new(suit, 'Ace', 14))
    end

    deck52.cards.shuffle!

    deck1 = Deck.new(deck52.cards[0..25])
    deck2 = Deck.new(deck52.cards[26..51])

    player1 = Player.new('Trish', deck1)
    player2 = Player.new('Lua', deck2)
  end

  def start

  end

end

game = Game.new
game.start
