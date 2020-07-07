require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require "pry"
class Game

    attr_reader :deck, :suits, :value, :rank, :player1, :player2
        def initialize(player1, player2)
            filename = './data/cards.txt'
            @deck = CardGenerator.new(filename).cards
            @suits = [:heart, :diamond, :spade, :club]
            @values = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
            @ranks = {2 => '2', 3 => '3', 4 =>'4', 5 =>'5', 6 =>'6', 7 =>'7', 8 =>'8', 9 =>'9', 10 =>'10', 11 =>'Jack', 12 =>'Queen', 13 =>'King', 14 =>'Ace'}
            @player1 = player1
            @player2 = player2
            # generate_deck ## => My original solution to generate cards without using text file.
            split_deck
        end

    # def generate_deck ## => My original solution to generate cards without using text file.
    #     @suits.each do |suit|
    #         @values.each do |value|
    #           rank = @ranks.key(value)
    #           @deck << Card.new(suit, value, rank)
    #         end
    #     end
    #     @deck = Deck.new(@deck)
    # end

    def split_deck
        @deck.cards.shuffle!
        deck1 = Deck.new(deck.cards.slice!(0, 26))
        @player1 = Player.new(@player1, deck1)

        deck2 = Deck.new(deck.cards.slice!(0, 26))
        @player2 = Player.new(@player2, deck2)
    end
    
    def start 
        turn_counter = 0

        puts  "Welcome to War! (or Peace)"
        puts "This game will be played with 52 cards."
        puts "The players today are #{player1.name} and #{player2.name}."
        puts
        puts "Type 'Go' to start the game!" 
        x = gets.chomp.upcase
        puts '-------------------------------------------------'

        until player1.has_lost? || player2.has_lost? || turn_counter >= 1000000

            turn = Turn.new(player1, player2)
            turn_counter += 1

                if turn.type == :basic
                    winner = turn.winner
                    turn.piles_cards
                    
                    puts "Turn #{turn_counter}: #{winner.name} won #{turn.spoils_of_war.count} cards!"
                    turn.award_spoils(winner)
                
                elsif turn.type == :mutually_assured_destruction
                    winner = turn.winner
                    turn.piles_cards

                    puts "Turn #{turn_counter}: *Mutually Assured Destruction* #{turn.cards_removed.count} cards removed from play" 

                elsif turn.type == :war
                    winner = turn.winner
                    turn.piles_cards
                    puts "Turn #{turn_counter}: WAR - #{winner.name} won #{turn.spoils_of_war.count} cards!" 
                    turn.award_spoils(winner)
                else 
                    turn.piles_cards
                end
        end
        p "#{player1.name}: #{player1.deck.cards.count}, #{player2.name}: #{player2.deck.cards.count}"
        if turn_counter >= 1000000 
            return puts "---- DRAW ----"
        end
        puts "*~*~*~* #{winner.name} has won the game *~*~*~*"
    end

end