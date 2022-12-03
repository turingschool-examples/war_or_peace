
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class Game
    attr_reader :deck1, 
                :deck2,
                :cards,
                 :turn,
                 :player1,
                 :player2

    def initialize
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        @cards = cards
        @player1 = Player.new("Megan", deck1)
        @player2 = Player.new("Amy", deck2)
        @turn = Turn.new(player1, player2)
        
        @unshuffled_deck = [
        Card.new(:diamond, '2', 2),
        Card.new(:diamond, '3', 3),
        Card.new(:diamond, '4', 4),
        Card.new(:diamond, '5', 5),
        Card.new(:diamond, '6', 6),
        Card.new(:diamond, '7', 7),
        Card.new(:diamond, '8', 8),
        Card.new(:diamond, '9', 9),
        Card.new(:diamond, '10', 10),
        Card.new(:diamond, 'Jack', 11),
        Card.new(:diamond, 'Queen', 12),
        Card.new(:diamond, 'King', 13),
        Card.new(:diamond, 'Ace', 14),
        Card.new(:spade, '2', 2),
        Card.new(:spade, '3', 3),
        Card.new(:spade, '4', 4),
        Card.new(:spade, '5', 5),
        Card.new(:spade, '6', 6),
        Card.new(:spade, '7', 7),
        Card.new(:spade, '8', 8),
        Card.new(:spade, '9', 9),
        Card.new(:spade, '10', 10),
        Card.new(:spade, 'Jack', 11),
        Card.new(:spade, 'Queen', 12),
        Card.new(:spade, 'King', 13),
        Card.new(:spade, 'Ace', 14),
        Card.new(:club, '2', 2),
        Card.new(:club, '3', 3),
        Card.new(:club, '4', 4),
        Card.new(:club, '5', 5),
        Card.new(:club, '6', 6),
        Card.new(:club, '7', 7),
        Card.new(:club, '8', 8),
        Card.new(:club, '9', 9),
        Card.new(:club, '10', 10),
        Card.new(:club, 'Jack', 11),
        Card.new(:club, 'Queen', 12),
        Card.new(:club, 'King', 13),
        Card.new(:club, 'Ace', 14),
        Card.new(:heart, '2', 2),
        Card.new(:heart, '3', 3),
        Card.new(:heart, '4', 4),
        Card.new(:heart, '5', 5),
        Card.new(:heart, '6', 6),
        Card.new(:heart, '7', 7),
        Card.new(:heart, '8', 8),
        Card.new(:heart, '9', 9),
        Card.new(:heart, '10', 10),
        Card.new(:heart, 'Jack', 11),
        Card.new(:heart, 'Queen', 12),
        Card.new(:heart, 'King', 13),
        Card.new(:heart, 'Ace', 14)]
    end


    def deal
        deck1 = Deck.new([])
        deck2 = Deck.new([])
        
        shuffled_deck = @unshuffled_deck.shuffle!
        
        shuffled_deck.each_with_index do |value, index|
            
            if index.even?
                deck1.cards << value
            else
                deck2.cards << value
            end
        end

        deck1
        deck2
        
    end
       
    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
        "GO" == gets.chomp
      
        Turn.new(player1, player2)
        p turn.winner
        
        

    end
end
    


