require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    def initialize(cards)
        @cards = cards.shuffle
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[26..51])
        @player1 = Player.new("Alex", @deck1)
        @player2 = Player.new("Bob", @deck2)
        @turn = Turn.new(@player1, @player2)
    end

    def start 
       p  "Welcome to War! (or Peace) This game will be played with 52 cards."
       p "The players today are #{@player1.name} and #{@player2.name}."
       p "Type 'GO' to start the game!"
       p "------------------------------------------------------------------"
       
    end


end