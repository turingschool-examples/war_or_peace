require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :count
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    # @count = 0
  end

   def type
     if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
       return :basic
     elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
       if player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
       return :mutually_assured_destruction
       else return :war
       end

     end
   end

   def winner
     if type == :basic
       if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
         return player1
       else player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
         return player2
       end
     elsif type == :war
       if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
         return player1
       else player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
         return player2
       end
     else type == :mutually_assured_destruction
       return 'No Winner'
     end

   end

   def pile_cards
     @spoils_of_war << player1.deck.cards[0]
     player1.deck.cards.shift
     @spoils_of_war << player2.deck.cards[0]
     player2.deck.cards.shift
   end

   def award_spoils(winner)
     winner.deck.cards << spoils_of_war
   end

   def start
     puts "Welcome to War! (or Peace) This game will be played with 52 cards."
     puts "The players today are #{player1.name} and #{player2.name}"
     puts "Type 'GO' to start the game!"
     ARGV.clear
     user_input = gets.chomp.upcase
     if user_input == 'GO'
       # until player1.deck.cards == [] || player2.deck.cards == [] || @count == 1000000
       #   turn.pile_cards
       #   turn.winner
       #   winner = turn.winner
       #   turn.award_spoils(winner)
       #   tunr.count += 1
       # end

     else
        puts "Incorrect input, type 'GO' to start the game!"
     end

   end
end
