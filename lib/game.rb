class Game
    attr_reader :turn, :cards, :shuffled_cards, :individual_deck, :deck1, :deck2, :player1, :player2, :display_turn_winner

    def initialize ()
        @filename = "cards.txt"
        @cards = CardGenerator.new(@filename).cards
        @shuffled_deck = []
        @individual_deck = []
        @turns = 0
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        @player1 = Player.new('Megan', @deck1)
        @player2 = Player.new('Aurora', @deck2)
        @turn = Turn.new(@player1, @player2)
    end

    def shuffle_cards
        @shuffled_deck = @cards.shuffle
    end

    def split_deck
        @individual_deck = @shuffled_deck.each_slice(26).to_a
        @deck1.cards.concat(@individual_deck[0])
        @deck2.cards.concat(@individual_deck[1])
    end

    def deal_cards
        shuffle_cards
        split_deck
    end

    def start
        puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
        puts "Type 'GO' to start the game!"
        puts "The players today are Megan and Aurora."
        puts '------------------------------------------------------------------'
        answer = gets.chomp
        if answer.upcase == 'GO'
            turn_loop
        else
            puts "Goodbye!"
            sleep(3)
            exit
        end
    end

    def turn_loop
        deal_cards
        until @turn.player1.has_lost? || @turn.player2.has_lost? || @turns == 1_000_000
            display_turn_winner
            display_winner
        end
    end

    def display_turn_winner
        if @turn.type == :mutually_assured_destruction
            @turn.pile_cards
            @turns += 1
            puts "*mutually assured destruction* 6 cards removed from play"
            puts "-----"
        elsif @turn.type == :war
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
            @turns += 1
            puts "Turn #{@turns}: WAR - #{winner.name} won 6 cards Report: #{winner.deck.cards.count}"
            puts "#{@player1.name} has #{@player1.deck.percent_high_ranking.round(2)} high ranking cards in their deck."
            puts "#{@player2.name} has #{@player2.deck.percent_high_ranking.round(2)} high ranking cards in their deck."
            puts "-----"
            # require 'pry'; binding.pry
        elsif @turn.type == :basic
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
            @turns += 1
            # require 'pry'; binding.pry
            puts "Turn #{@turns}: #{winner.name} has won 2 cards Report: #{winner.deck.cards.count}"
            puts "#{@player1.name} has #{@player1.deck.percent_high_ranking.round(2)} high ranking cards in their deck."
            puts "#{@player2.name} has #{@player2.deck.percent_high_ranking.round(2)} high ranking cards in their deck."
            puts "-----"
        end
        # if @turns % 100 == 0
        #     puts 'Guess the winner before the game continues!'
        #     sleep(5)
        # end
        if @turns == 1_000_000
            puts '---- DRAW ----'
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