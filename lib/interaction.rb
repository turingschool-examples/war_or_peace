class Interaction
  def initialize
  end

  def intro
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
         The players today are Megan and Aurora.
         Type 'GO' to start the game!
         ------------------------------------------------------------------"
  end

  def basic
    puts "Turn #{counter}: #{winner.name} won #{turn.spoils_of_war.length} cards"
  end

  def war
    puts "Turn #{counter}: WAR - #{winner.name} won #{turn.spoils_of_war.length} cards"
  end

  def mutually_assured_destruction
    puts "Turn #{counter}: *mutually assured destruction* #{turn.spoils_of_war.length} cards removed from play"
  end

  def win_game
    puts "Turn #{counter}: #{winner.name} won #{turn.spoils_of_war.length} cards
         *~*~*~* #{winner.name} has won the game! *~*~*~*"
  end

  def draw
    puts "Turn #{counter}: #{winner.name} won #{turn.spoils_of_war.length} cards
         ---- Draw ----"
  end
end
