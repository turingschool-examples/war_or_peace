require './lib/deck'
require './lib/player'
require './lib/turn'



class Game

    def initialize(cards)
        @cards = cards.shuffle
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[26..51])
        @player1 = Player.new("Caleb", @deck1)
        @player2 = Player.new("Joslyn", @deck2)
        @turn = Turn.new(@player1, @player2)
    end
end