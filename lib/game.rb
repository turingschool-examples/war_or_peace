require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game 
    MAX_TURNS = 1_000_000
    # CARD_MAP = {
    #         2 => "2",
    #         3 => "3",
    #         4 => "4",
    #         5 => "5",
    #         6 => "6",
    #         7 => "7",
    #         8 => "8",
    #         9 => "9",
    #         10 => "10",
    #         11 => "Jack",
    #         12 => "Queen",
    #         13 => "King",
    #         14 => "Ace"
    #     }
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
    end

    def welcome_to_war   
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are #{@player1.name} and #{@player2.name}."
        p "Type 'GO' to start the game!"
        "------------------------------------------------------------------"
    end
    
    def start_game(input)
        if input.upcase == "GO"
         
        # starting_deck = [:diamond, :heart, :spade, :club].flat_map do |suit|
        #     (2..14).to_a.map do |rank|
        #         value = CARD_MAP[rank]
        #         card = Card.new(suit, value, rank)
        #     end
        # end

        # shuffled_deck = starting_deck.shuffle!

        #     deck1 = shuffled_deck.first(26)
        #     deck2 = shuffled_deck.last(26)

        #     player1 = Player.new("Megan", Deck.new(deck1))
        #     player2 = Player.new("Aurora", Deck.new(deck2))

            turn = Turn.new(@player1, @player2)
            turn_counter = 0

            until @player1.has_lost? || @player2.has_lost? || turn_counter == MAX_TURNS
            turn.pile_cards
            turn_counter += 1

                case turn.type 
                when :mutually_assured_destruction
                    p "~~~Turn #{turn_counter}~~~"
                    p "Mutually Assured Destruction! Both players lose!"
                when :war
                    winner = turn.winner
                    turn.award_spoils(winner)
                    p "~~~Turn #{turn_counter}~~~"
                    p "War! #{turn.winner.name} wins the war!"
                when :basic
                    winner = turn.winner
                    turn.award_spoils(winner)
                    p "~~~Turn #{turn_counter}~~~"
                    p "#{turn.winner.name} gains 2 cards!"
                    turn.award_spoils(winner)
                end

                if @player1.has_lost? 
                p "#{@player2.name} is victorious! Nice try #{@player1.name}"
                elsif @player2.has_lost? 
                p "#{@player1.name} is victorious! Nice try #{@player2.name}"
                elsif turn_counter == MAX_TURNS
                p "~~~DRAW~~~"
                end            
            end
        else
            p "Try again."
        end
    end
end
