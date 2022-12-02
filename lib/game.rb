class Game
    attr_reader :turn, :cards, :shuffled_cards, :individual_deck

    def initialize ()
        @cards = []
        @shuffled_deck = []
        @individual_deck = []
        @turns = 0
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        @player1 = Player.new('Megan', @deck1)
        @player2 = Player.new('Aurora', @deck2)
        @turn = Turn.new(@player1, @player2)
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
        # require 'pry'; binding.pry
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
        answer = gets.chomp
        if answer.upcase == 'GO'
            start
        else
            puts "Goodbye!"
            sleep(3)
            exit
        end
    end

    def start
        # require 'pry'; binding.pry
        deal_cards
        until @turn.player1.has_lost? || @turn.player2.has_lost? || @turns == 10000
            turn = Turn.new(@player1, @player2)
            display_turn_winner
            display_winner
        end
        

    end

    def display_turn_winner
        if @turn.type == :mutually_assured_destruction
            # require 'pry'; binding.pry
            # require 'pry'; binding.pry
            @turn.pile_cards
            # require 'pry'; binding.pry
            @turns += 1
            puts "*mutually assured destruction* 6 cards removed from play"
        elsif @turn.type == :war
            # require 'pry'; binding.pry
            winner = @turn.winner
            @turn.pile_cards
            # require 'pry'; binding.pry
            @turn.award_spoils(winner)
            # require 'pry'; binding.pry
            @turns += 1
            puts "Turn #{@turns}: WAR - #{winner.name} won 6 cards Report: #{winner.deck.cards.count}"
        elsif @turn.type == :basic
            # require 'pry'; binding.pry
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
            # require 'pry'; binding.pry
            @turns += 1
            puts "Turn #{@turns}: #{winner.name} has won 2 cards Report: #{winner.deck.cards.count} "
        end
        if @turns == 100
            require 'pry'; binding.pry
            puts 'TEST'
        end
    end

    def display_winner
        if @turn.player1.has_lost?
            puts "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
        elsif @turn.player2.has_lost?
            puts "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
        end
    end
end