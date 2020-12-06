require 'pry'


class Game
  attr_reader :turns

  def initialize (turns)
    @turns = turns
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
      The players today are Megan and Aurora.
      Type 'GO' to start the game!
      ------------------------------------------------------------------"
    p "=> (type 'GO' when you are ready for WAR!)"
    p gets.chomp
  end
end

  # def game_over
  #   if turns.player1.deck.cards.empty? == true
  #     return print "1*~*~*~* Aurora has won the game! *~*~*~*"
  #   elsif turns.player2.deck.cards.empty? == true
  #     return print "*~*~*~* Megan has won the game! *~*~*~*"
  #   elsif turns.player1.deck.cards.length < 2 && turns.player1.deck.cards[0].rank < turns.player2.deck.cards[0].rank
  #       return print "2*~*~*~* Aurora has won the game! *~*~*~*"
  #   elsif turns.player1.deck.cards.length < 2 && turns.player1.deck.cards[0].rank > turns.player2.deck.cards[0].rank
  #       return print "*~*~*~* Megan has won the game! *~*~*~*"
  #
  #     elsif turns.player2.deck.cards.length < 2 && turns.player2.deck.cards[0].rank < turns.player1.deck.cards[0].rank
  #       return print "*~*~*~* Megan has won the game! *~*~*~*"
  #   elsif turns.player2.deck.cards.length < 2 && turns.player2.deck.cards[0].rank > turns.player1.deck.cards[0].rank
  #     return print "3*~*~*~* Aurora has won the game! *~*~*~*"
  #   elsif turn_index > 1000000
  #     return p "---- DRAW ----"


  # def play
  #   turn_index = 0
  #   10000000.times do
  #       turn_index +=1
  #       # turns = Turn.new(player1, player2)
  #       game = Game.new(turns)
  #     if turns.player1.deck.cards == []
  #       return print "*~*~*~* Aurora has won the game! *~*~*~*"
  #     elsif turns.player2.deck.cards == []
  #       return print "*~*~*~* Megan has won the game! *~*~*~*"
  #     elsif turn_index > 1000
  #       return print "---- DRAW ----"
  #     else
  #       if turns.type == :basic
  #         winner = game.turns.winner
  #         turns.pile_cards
  #         turns.award_spoils(winner)
  #         win_name = winner.name
  #         puts "Turn #{turn_index}: #{win_name} won 2 cards. Megan has #{turns.player1.deck.cards.length}. Auroa has #{turns.player2.deck.cards.length}."
  #       elsif turns.type == :war
  #         winner = game.turns.winner
  #         turns.pile_cards
  #         turns.award_spoils(winner)
  #         win_name = winner.name
  #         puts "Turn #{turn_index}: WAR - #{win_name} won 6 cards. Megan has #{turns.player1.deck.cards.length}. Auroa has #{turns.player2.deck.cards.length}."
  #       elsif turns.type == :mutually_assured_destruction
  #         turns.pile_cards
  #         puts "Turn #{turn_index}: *mutually assured destruction* 6 cards removed from play"
  #       end
  #     end
#     end
#   end
# end
