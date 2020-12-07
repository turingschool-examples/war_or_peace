class PlayGame
  attr_reader :round,
              :turn_number

  def initialize(round)
    @round = round
    @turn_number = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards"
    p "The players today are #{round.player1.name} and #{round.player2.name}."
    p "Type 'GO' to start the game!"
    if gets.chomp.upcase == "GO"
      self.play_game
    else p "Ok, maybe next time!"
    end
  end

  def play_game
    while turn_number < 1000000
      @turn_number += 1

      if round.type == :basic
        p "Turn #{turn_number}: #{round.winner.name} won 2 cards!"
      elsif round.type == :war
        p "WAR - #{round.winner.name} won 6 cards!"
      else
        p "Mutually Assured Destruction - 6 cards removed from play"
      end

      round.pile_cards
      round.award_spoils

      if round.player1.deck.cards.count <= 3
        abort "*~*~*~* #{round.player2.name} has won the game! *~*~*~*"
      elsif round.player2.deck.cards.count <=3
        abort "*~*~*~* #{round.player1.name} has won the game! *~*~*~*"
      end

    end
    if turn_number == 1000000
      abort "---- DRAW ----"
    end
  end

end
