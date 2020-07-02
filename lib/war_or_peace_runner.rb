require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    attr_reader :deck, :suits, :value, :rank, :player1, :player2
        def initialize(player1, player2)
        @deck = []
        @suits = [:heart, :diamond, :spade, :club]
        @values = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
        @ranks = {2 => '2', 3 => '3', 4 =>'4', 5 =>'5', 6 =>'6', 7 =>'7', 8 =>'8', 9 =>'9', 10 =>'10', 11 =>'Jack', 12 =>'Queen', 13 =>'King', 14 =>'Ace'}
       
        end

    def generate_deck
        @suits.each do |suit|
            @values.each do |value|
              rank = @ranks.key(value)
              @deck << Card.new(suit, value, rank)
            end
        end
        @deck = Deck.new(@deck)
    end

    



end
