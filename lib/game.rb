require './lib/turn'
class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
       input = gets.chomp.upcase
       if input == "GO"
         turn_num = 1
         while turn_num < 1000000 && player1.has_lost? == false && player2.has_lost? == false
           turn = Turn.new(player1, player2)
           type = turn.type
           winner = turn.winner
              # binding.pry
            # if player1.deck.cards.count < 4 || player2.deck.cards.count < 4
            #   if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            #     type = :basic
            #     if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            #       # binding.pry
            #       turn.pile_cards
            #       puts "Turn #{turn_num}: #{winner.name} won #{turn.spoils_of_war.length} cards"
            #       # binding.pry
            #       player1.deck.cards << turn.spoils_of_war
            #     elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
            #       # binding.pry
            #       turn.pile_cards
            #       puts "Turn #{turn_num}: #{winner.name} won #{turn.spoils_of_war.length} cards"
            #       # binding.pry
            #       player2.deck.cards << turn.spoils_of_war
            #     end
            #   elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            #     break
            #   end
            if type == :basic #&& (winner = player1 || winner = player2)
              winner
              turn.pile_cards.shuffle!
              # binding.pry
              puts "Turn #{turn_num}: #{winner.name} won #{turn.spoils_of_war.length} cards"
              turn.award_spoils
            elsif type == :war #&& (winner = player1 || winner = player2)

              winner
              turn.pile_cards.shuffle!
              puts "Turn #{turn_num}: WAR - #{winner.name} won #{turn.spoils_of_war.length} cards"
              turn.award_spoils
              # binding.pry
            elsif type == :mutually_assured_destruction #&& winner = "No Winner"
              winner
              turn.pile_cards
              puts "Turn #{turn_num}: *mutually assured destruction* 6 cards removed from play."

            end
            turn_num += 1
            player1.has_lost?
            player2.has_lost?

          end

          if player1.has_lost? == true
            puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
          elsif player2.has_lost? == true
            puts  "*~*~*~* #{player1.name} has won the game! *~*~*~*"
          else
            puts "GAME OVER. NO WINNER."
          end

       else
         puts "I'm afraid I can't do that."
       end
   end

end
