require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    attr_reader :full_deck,
                :deck1,
                :deck2,
                :player1,
                :player2,
                :turn

    def initialize(full_deck = [])
        @full_deck = full_deck.shuffle!
        @deck1 = Deck.new(@full_deck[0..25])
        @deck2 = Deck.new(@full_deck[26..51])
        @player1 = Player.new('Sun Tzu', @deck1)
        @player2 = Player.new('Alexander, the Great', @deck2)
        @turn = Turn.new(@player1, @player2)
    end



    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Sun Tzu and Alexander, the Great."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"

        user_input = gets.chomp.upcase
        if user_input == "GO"
            run_game
        else
            start
        end
    end

    def check_game_winner(turn_count)
        if @player1.has_lost? == true
            puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        elsif @player2.has_lost? == true
            puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        elsif turn_count == 1_000_000
            puts "----- DRAW -----"
        end
    end

    def run_game
        turn_count = 0

        until turn_count == 1_000_000 || @player1.has_lost? == true || @player2.has_lost? ==true
            turn_count += 1
            @player1.deck.cards.shuffle!
            @player2.deck.cards.shuffle!
            type = @turn.type
            winner = @turn.winner

            if type == :basic
                puts "Turn #{turn_count}: BASIC - #{winner.name} won 2 cards (#{@player1.deck.cards[0].value} vs #{@player2.deck.cards[0].value})"
                @turn.pile_cards
                @turn.award_spoils(winner)
            elsif type == :war
                puts "Turn #{turn_count}: WAR - #{winner.name} won 6 cards #{@player1.deck.cards[2].value} vs #{@player2.deck.cards[2].value}"
                @turn.pile_cards
                @turn.award_spoils(winner)                
            elsif type == :short_war
                
                puts "Turn #{turn_count}: WAR - #{winner.name} won 4 cards"
                @turn.pile_cards
                @turn.award_spoils(winner)
            elsif type == :mutual_destruction
                
                puts "*mutually assured destruction* 6 cards removed from play"
                @turn.pile_cards
            elsif type == :two_card_stalemate
                @turn.pile_cards
                puts "Turn #{turn_count}: Stalemate - both players discard"
            elsif type == :one_card_stalemate
                @turn.pile_cards
                puts "Turn #{turn_count}: Stalemate - both players discard"
            end

            # @turn.pile_cards
            check_game_winner(turn_count)
            
        end

    end

end

