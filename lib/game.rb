class Game

    def initialize(cards)
        #require 'pry'; binding.pry
        @cards = cards.shuffle!
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[26..51])
        @player1 = Player.new("Caleb", @deck1)
        @player2 = Player.new("Joslyn", @deck2)
        @turn = Turn.new(@player1, @player2)

    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Caleb and Joslyn. Type 'GO' to start the game!"

        if gets.chomp.upcase == "GO"
            
            #main loop
        end
    end
    
    def main_loop
       #use display_turn
    end

    def display_turn
        winner = @turn.winner
        count = 0 
        count += 1
        if type == :basic
            @turn.pile_cards
            @turn.award_spoils(winner)
            puts "Turn #{count}: #{winner.name} won 2 cards."

           elsif type == :war
               @turn.pile_cards
               @turn.award_spoils(winner)
               puts "Turn #{count}: #{winner.name} won #{award_spoils.count} cards"
           else 
               @turn.pile_cards
               puts "Turn #{count}: *mutually assured destruction* #{turn.pile_cards} removed from play"
               end
        puts winner
        "#{winner} has won "
    end


end