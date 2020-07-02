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
        @player1 = player1
        @player2 = player2
        # generate_deck
        # split_deck
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

    def split_deck
        @deck.cards.shuffle!
        deck1 = Deck.new(deck.cards.slice!(0, 26))
        @player1 = Player.new(@player1, deck1)

        deck2 = Deck.new(deck.cards.slice!(0, 26))
        @player2 = Player.new(@player2, deck2)
    end
    
    def start
        generate_deck
        split_deck

        until player1.has_lost? || player2.has_lost?
        # binding.pry
            turn = Turn.new(player1, player2)
            turn.piles_cards
            winner = turn.winner
            puts "#{winner.name} has won!" 
            turn.award_spoils(winner)
        end
        
    end


end
