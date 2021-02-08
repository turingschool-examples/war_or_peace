require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
#TODO: rename this class to whatever the file is called because this class encompasses
#all of the functions.
class WarOrPeace
    attr_reader :player1, :player2, :cards, :turn

    def initialize
        @cards = File.foreach('lib/cards.txt').map { |line| line.chomp.split(', ') }
        @player1
        @player2
        #@deck = turn.player1.deck.cards
        @turn = turn 
        
    end

    def cards_generator
        @deck = @cards.map { |card| Card.new(card[1],card[0],card[2].to_i)}
    end

    def shuffle_and_deal
        cards_generator
        deck = @deck.shuffle
        @deck1 = Deck.new(@deck[0..5])
        @deck2 = Deck.new(@deck[0..5])
        p @deck1
        p @deck2
        puts "Player 1's name:"
        input = gets.chomp
        @player1 = Player.new(input, @deck1)
        puts "Player 2's name:"
        input = gets.chomp
        @player2 = Player.new(input, @deck2)
        @turn = Turn.new(@player1,@player2)
    end

    def set_up_game
        self.shuffle_and_deal
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are #{@player1} and #{@player2}."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
        input = gets
        if input.chomp == 'GO'
            turn_clock = 0
            while turn_clock < 1
                p @turn.type
                if turn_clock == 999999
                    p "Turn #{turn_clock+1}: This is a tie! ..weird"
                    return
                elsif @turn.type == :basic || @turn.type == :war
                    @turn.pile_cards
                    p "Turn #{turn_clock+1}: #{@turn.winner.name} has won #{@turn.spoils_of_war.length} cards!"
                    @turn.award_spoils
                elsif @turn.type == :mad
                    @turn.pile_cards
                    p "Turn #{turn_clock + 1}: *mutually assured destruction* 6 cards removed from play"
                    @turn.turn_counter
                elsif @turn.type == :game_over

                end
                if @turn.player1.has_lost? || @turn.player2.has_lost?
                    p "Turn #{turn_clock+1}: game over! #{@turn.winner_of_game.name} has won the game"
                    break
                end
                turn_clock += 1
            end        

        end
    end
end

war = WarOrPeace.new
war.set_up_game