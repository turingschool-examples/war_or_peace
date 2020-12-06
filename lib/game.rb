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
