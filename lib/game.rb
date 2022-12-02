class Game
    attr_reader :turn, :cards, :shuffled_cards, :individual_deck

    def initialize (turn)
        @turn = turn
        @cards = []
        @shuffled_deck = []
        @individual_deck = []
        @user_input = ''
    end

    def create_cards
        heart_cards = []
        diamond_cards = []
        spade_cards = []
        club_cards = []

        13.times do |i|
            heart_cards << Card.new(:heart, (i+1).to_s, i+1)
        end

        13.times do |i|
            diamond_cards << Card.new(:diamond, (i+1).to_s, i+1)
        end

        13.times do |i|
            spade_cards << Card.new(:spade, (i+1).to_s, i+1)
        end

        13.times do |i|
            club_cards << Card.new(:club, (i+1).to_s, i+1)
        end

        @cards = [heart_cards, spade_cards, club_cards, diamond_cards].flatten
    end

    def shuffle_cards
        @shuffled_deck = @cards.shuffle
    end

    def split_deck
        @individual_deck = @shuffled_deck.each_slice(26).to_a
        @turn.player1.deck.cards.concat(@individual_deck[0])
        @turn.player2.deck.cards.concat(@individual_deck[1])
    end

    def deal_cards
        self.create_cards
        self.shuffle_cards
        self.split_deck
        
    end

    def ask_for_input
        puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
        puts "Type 'GO' to start the game!"
        puts "The players today are Megan and Aurora."
        puts '------------------------------------------------------------------'
        @user_input = gets.chomp
        if @user_input.upcase == 'GO'
            puts 'Hi'
        else
            exit
        end
    end

    def start
        if @user_input.upcase == 'GO'
            turn_counter = 0
            until @turn.player1.deck.cards.count == 0 || @turn.player2.deck.cards.count == 0

                if @turn.type == :mutually_assured_destruction
                    @turn.pile_cards
                    turn_counter += 1
                    puts "*mutually assured destruction* 6 cards removed from play"
                elsif @turn.type == :war
                    winner = @turn.winner
                    @turn.pile_cards
                    @turn.award_spoils(winner)
                    turn_counter += 1
                    puts "Turn #{turn_counter}: WAR - #{winner.name} won 6 cards"
                elsif @turn.type == :basic
                    winner = @turn.winner
                    @turn.pile_cards
                    @turn.award_spoils(winner)
                    # require 'pry'; binding.pry
                    turn_counter += 1
                    puts "Turn #{turn_counter}: #{winner.name} has won 2 cards"
                end
            end
            if @turn.player1.deck.cards.count == 0
                puts "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
            elsif @turn.player2.deck.cards.count == 0
                puts "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
            end
        end

    end

end