Class Game
  attr_accessor :player1, :olayer2

  def initialize
  end

  def start
  p "Welcome to War! (or Peace) This game will be played with 52 cards."
  p "The players today are #{player1.name} and #{player2.name}."
  p "Type 'GO' to start the game!"
  p "---------------------------------------------------------------------"
  lets_begin = gets.chomp

    if lets_begin = 'GO'
      take_turn
    else
      puts "Until next time..."
    end
  end

def take_turn
  if type == :basic
    turn.pile_cards
    turn.award_spoils

end
