require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    attr_reader :cards,
        :deck1,
        :deck2,
        :player1,
        :player2,
        :turn,
        :round_winner

    def initialize
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)
        @turn = Turn.new(@player1, @player2)
        @round_winner = ""
    end

    def deal
        fresh_pack = []

        fresh_pack << card1 = Card.new(:diamond, '2', 2)
        fresh_pack << card15 = Card.new(:heart, '2', 2)
        fresh_pack << card27 = Card.new(:spade, '2', 2)
        fresh_pack << card40 = Card.new(:club, '2', 2)
        fresh_pack << card2 = Card.new(:diamond, '3', 3)
        fresh_pack << card16 = Card.new(:heart, '3', 3)
        fresh_pack << card28 = Card.new(:spade, '3', 3)
        fresh_pack << card41 = Card.new(:club, '3', 3)
        fresh_pack << card3 = Card.new(:diamond, '4', 4)
        fresh_pack << card17 = Card.new(:heart, '4', 4)
        fresh_pack << card29 = Card.new(:spade, '4', 4)
        fresh_pack << card42 = Card.new(:club, '4', 4)
        fresh_pack << card4 = Card.new(:diamond, '5', 5)
        fresh_pack << card18 = Card.new(:heart, '5', 5)
        fresh_pack << card30 = Card.new(:spade, '5', 5)
        fresh_pack << card43 = Card.new(:club, '5', 5)
        fresh_pack << card5 = Card.new(:diamond, '6', 6)
        fresh_pack << card19 = Card.new(:heart, '6', 6)
        fresh_pack << card31 = Card.new(:spade, '6', 6)
        fresh_pack << card44 = Card.new(:club, '6', 6)
        fresh_pack << card6 = Card.new(:diamond, '7', 7)
        fresh_pack << card20 = Card.new(:heart, '7', 7)
        fresh_pack << card32 = Card.new(:spade, '7', 7)
        fresh_pack << card45 = Card.new(:club, '7', 7)
        fresh_pack << card7 = Card.new(:diamond, '8', 8)
        fresh_pack << card21 = Card.new(:heart, '8', 8)
        fresh_pack << card33 = Card.new(:spade, '8', 8)
        fresh_pack << card46 = Card.new(:club, '8', 8)
        fresh_pack << card8 = Card.new(:diamond, '9', 9)
        fresh_pack << card22 = Card.new(:heart, '9', 9)
        fresh_pack << card34 = Card.new(:spade, '9', 9)
        fresh_pack << card47 = Card.new(:club, '9', 9)
        fresh_pack << card9 = Card.new(:diamond, '10', 10)
        fresh_pack << card23 = Card.new(:heart, '10', 10)
        fresh_pack << card35 = Card.new(:spade, '10', 10)
        fresh_pack << card48 = Card.new(:club, '10', 10)
        fresh_pack << card10 = Card.new(:diamond, 'Jack', 11)
        fresh_pack << card24 = Card.new(:heart, 'Jack', 11)
        fresh_pack << card36 = Card.new(:spade, 'Jack', 11)
        fresh_pack << card49 = Card.new(:club, 'Jack', 11)
        fresh_pack << card11 = Card.new(:diamond, 'Queen', 12)
        fresh_pack << card25 = Card.new(:heart, 'Queen', 12)
        fresh_pack << card37 = Card.new(:spade, 'Queen', 12)
        fresh_pack << card50 = Card.new(:club, 'Queen', 12)
        fresh_pack << card12 = Card.new(:diamond, 'King', 13)
        fresh_pack << card26 = Card.new(:heart, 'King', 13)
        fresh_pack << card38 = Card.new(:spade, 'King', 13)
        fresh_pack << card51 = Card.new(:club, 'King', 13)
        fresh_pack << card13 = Card.new(:diamond, 'Ace', 14)
        fresh_pack << card27 = Card.new(:heart, 'Ace', 14)
        fresh_pack << card39 = Card.new(:spade, 'Ace', 14)
        fresh_pack << card52 = Card.new(:club, 'Ace', 14)

        26.times do
            @player1.deck.cards << fresh_pack.sample
            @player2.deck.cards << fresh_pack.sample
        end
    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
       
        "GO" == gets.chomp

        1000000.times do
            if @player1.has_lost? || @player2.has_lost? == true
                "--------This game is a draw...--------"
                break
           else
                
            
           end
                

    end



# user types go, and game starts

    
        # define play as a method to do multiple iterations?
    

end
