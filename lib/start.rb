require 'pry'
class Start

attr_reader :start
def initialize(start)
@start =
p   "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
end
end

binding.pry