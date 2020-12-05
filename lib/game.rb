class Game
  def initialize
  end

  def welcome
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
  #prints welcome to the screen
  input = gets.chomp
  #gets users input and checks for lowercase
  if input.upcase != 'GO'
    p "Please type 'GO!' --- Game has reset."
  elsif input.upcase == 'GO'
    self.start
  end
end

  def start
    # require "pry"; binding.pry
  end
end
