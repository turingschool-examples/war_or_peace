require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game 
    attr_reader :full_deck, :deck1, :deck2

    def initialize
        @full_deck = new_deck.shuffle!
        # @deck1 = Deck.new([@full_deck[0..25]])
        # @deck2 = Deck.new([@full_deck[26..51]])
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        self.deal
        @player1 = Player.new('Megan', @deck1)
        @player2 = Player.new('Aurora', @deck2)
        start
    end 

    def new_deck
        deck = []
        [:diamond, :heart, :spade, :club].each do |suit|
            ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].each do |value|
                deck << Card.new(suit, value, rank_reader(value))
            end 
        end
        deck
    end 

    def rank_reader(value)
        return 14 if value == 'Ace'
        return 13 if value == 'King'
        return 12 if value == 'Queen'
        return 11 if value == 'Jack'
        return value.to_i
    end 

    def shuffle
        @full_deck.shuffle!
    end

    def deal
        52.times do |i|
            # binding.pry
            if i.odd?
                @deck1.add_card(@full_deck.shift)
            else 
                @deck2.add_card(@full_deck.shift)
            end 
        end 
    end

    def start
        puts `clear`
        puts "Welcome to War! (or Peace) This game will be played with 52 cards. \n
            The players today are Megan and Aurora. \n
            Type 'GO' to start the game! \n
            ------------------------------------------------------------------"
        gets.chomp
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

# game.deal 
# puts game.deck1.cards[0].value
# game.full_deck.shuffle
# puts game.full_deck[0].rank 