require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'


class Game
    attr_reader :deck, :player1, :player2, :turn, :full_deck
    
    def initialize
        @deck = create_deck
        @player1 = Player.new("William", Deck.new(@deck[0..25]))
        @player2 = Player.new("Alex", Deck.new(@deck[26..51]))
        @turn = Turn.new(@player1, @player2)
     
    end

    def create_deck
        full_deck = []

        full_deck << card1 = Card.new(:heart, '2', 2)
        full_deck << card2 = Card.new(:heart, '3', 3)
        full_deck << card3 = Card.new(:heart, '4', 4)
        full_deck << card4 = Card.new(:heart, '5', 5)
        full_deck << card5 = Card.new(:heart, '6', 6)
        full_deck << card6 = Card.new(:heart, '7', 7)
        full_deck << card7 = Card.new(:heart, '8', 8)
        full_deck << card8 = Card.new(:heart, '9', 9)
        full_deck << card9 = Card.new(:heart, '10', 10)
        full_deck << card12 = Card.new(:heart, 'Jack', 11)
        full_deck << card11 = Card.new(:heart, 'Queen', 12)
        full_deck << card13 = Card.new(:heart, 'King', 13)
        full_deck << card14 = Card.new(:heart, 'Ace', 14)

        full_deck << card15 = Card.new(:spade, '2', 2)
        full_deck << card16 = Card.new(:spade, '3', 3)
        full_deck << card17 = Card.new(:spade, '4', 4)
        full_deck << card18 = Card.new(:spade, '5', 5)
        full_deck << card19 = Card.new(:spade, '6', 6)
        full_deck << card20 = Card.new(:spade, '7', 7)
        full_deck << card21 = Card.new(:spade, '8', 8)
        full_deck << card22 = Card.new(:spade, '9', 9)
        full_deck << card23 = Card.new(:spade, '10', 10)
        full_deck << card24 = Card.new(:spade, 'Jack', 11)
        full_deck << card25 = Card.new(:spade, 'Queen', 12)
        full_deck << card26 = Card.new(:spade, 'King', 13)
        full_deck << card27 = Card.new(:spade, 'Ace', 14)

        full_deck << card28 = Card.new(:diamond, '2', 2)
        full_deck << card29 = Card.new(:diamond, '3', 3)
        full_deck << card30 = Card.new(:diamond, '4', 4)
        full_deck << card31 = Card.new(:diamond, '5', 5)
        full_deck << card32 = Card.new(:diamond, '6', 6)
        full_deck << card33 = Card.new(:diamond, '7', 7)
        full_deck << card34 = Card.new(:diamond, '8', 8)
        full_deck << card35 = Card.new(:diamond, '9', 9)
        full_deck << card36 = Card.new(:diamond, '10', 10)
        full_deck << card37 = Card.new(:diamond, 'Jack', 11)
        full_deck << card38 = Card.new(:diamond, 'Queen', 12)
        full_deck << card39 = Card.new(:diamond, 'King', 13)
        full_deck << card40 = Card.new(:diamond, 'Ace', 14)

        full_deck << card28 = Card.new(:club, '2', 2)
        full_deck << card29 = Card.new(:club, '3', 3)
        full_deck << card30 = Card.new(:club, '4', 4)
        full_deck << card31 = Card.new(:club, '5', 5)
        full_deck << card32 = Card.new(:club, '6', 6)
        full_deck << card33 = Card.new(:club, '7', 7)
        full_deck << card34 = Card.new(:club, '8', 8)
        full_deck << card35 = Card.new(:club, '9', 9)
        full_deck << card36 = Card.new(:club, '10', 10)
        full_deck << card37 = Card.new(:club, 'Jack', 11)
        full_deck << card38 = Card.new(:club, 'Queen', 12)
        full_deck << card39 = Card.new(:club, 'King', 13)
        full_deck << card40 = Card.new(:club, 'Ace', 14)
        full_deck.shuffle
    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards.
        The players today are" + player1.name + " and " + player2.name + ".
        Type 'GO' to start the game!"
        answer = gets
        playing
    end
        

    def playing
        
        turn_count = 1
        loop do
           
            
            if @player1.has_lost? || @player2.has_lost? == true
                p "Congratulations, #{winner} has won the game!"
                break
            end
            
            if turn_count == 1000000
                p "---- DRAW ----"
                break
            end
            if @player1.has_lost? || @player2.has_lost? == false
                turn.type
                winner = turn.winner
                turn.pile_cards
                p "Turn #{turn_count}: #{winner.name} won #{turn.spoils_of_war.length} cards."
                turn.award_spoils(winner)
                turn_count += 1
            end
        end
    end
end