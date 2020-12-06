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
    if gets.chomp != "GO"
      p "TRY AGAIN (type GO):"
      p gets.chomp
    end
  end

  def play
    turn_index = 0
    10000000.times do
        turn_index +=1
      if turn_index > 1000000
        return p "---- DRAW ----"
      else
        if turns.type == :basic
          if turns.player1.has_lost? == true
            return print "*~*~*~* Aurora has won the game! *~*~*~*"
          elsif turns.player2.has_lost? == true
            return print "*~*~*~* Megan has won the game! *~*~*~*"
          else
            turns.winner
            winner = turns.winner
            turns.pile_cards
            turns.award_spoils (winner)
            win_name = winner.name
            p "Turn #{turn_index}: #{win_name} won 2 cards."
          end
        elsif turns.type == :war
          if turns.player1.deck.cards.length < 3
            return print "*~*~*~* Aurora has won the game! *~*~*~*"
          elsif turns.player2.deck.cards.length < 3
            return print "*~*~*~* Megan has won the game! *~*~*~*"
          else
            winner = turns.winner
            turns.pile_cards
            turns.award_spoils(winner)
            win_name = winner.name
            puts "Turn #{turn_index}: WAR - #{win_name} won 6 cards."
          end
        else turns.type == :mutually_assured_destruction
          if turns.player1.deck.cards.length < 3
            return print "*~*~*~* Aurora has won the game! *~*~*~*"
          elsif turns.player2.deck.cards.length < 3
            return print "*~*~*~* Megan has won the game! *~*~*~*"
          else
            turns.winner
            turns.pile_cards
            d1 = turns.player1.deck.cards.length
            d2 = turns.player2.deck.cards.length
            puts "Turn #{turn_index}: *mutually assured destruction* 6 cards removed from play. Megan has #{d1}. Aurora has #{d2}"
          end
        end
      end
    end
  end

end
