require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game 
    attr_reader :deck, :deck1, :deck2

    def initialize
        @deck = CardGenerator.new('cards.txt').cards
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        @player1 = Player.new('Megan', @deck1)
        @player2 = Player.new('Aurora', @deck2)
        start
    end 

    def deal 
        @deck.shuffle!
        26.times do
            @deck1.add_card(@deck.shift)
            @deck2.add_card(@deck.shift)
        end 
    end 

    def start
        puts `clear`
        puts "Welcome to War! (or Peace) This game will be played with 52 cards. \n
            The players today are Megan and Aurora. \n
            Type 'GO' to start the game! \n
            ------------------------------------------------------------------"

        until gets.chomp == 'GO' do 
            puts '*womp, womp* try again'
        end

        deal
        i = 0
        until @player1.has_lost? || @player2.has_lost? || i == 1000000 do 
            i += 1
            turn = Turn.new(@player1, @player2)
            winner = turn.winner
            

            print "Turn #{i}: "
            if turn.type == :mutually_assured_destruction
                puts "*mutually assured destruction* 6 cards removed from play"
            elsif turn.type == :war
                puts "WAR - #{winner.name} won 6 cards"
            else
                puts "#{winner.name} won 2 cards"
            end
            
            turn.pile_cards
            turn.award_spoils(winner)

        end 
        return puts "---- DRAW ----" if i == 1000000
        winner = [@player1, @player2].find { |player| player.has_lost? == false }
        puts "*~*~*~* #{winner.name} has won the game! *~*~*~*"
    end 
end 

game = Game.new