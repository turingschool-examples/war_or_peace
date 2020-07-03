require_relative "./turn"

class Game
 attr_reader  :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def welcome_message
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}"
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    viewer = get_info
    user_input(viewer)
  end

  def get_info
     gets.chomp.upcase
  end

  def user_input(viewer)
    counter = 0
    loop do
        if viewer == "GO"
          #Start_game
        elsif counter < 3
          p "Invalid entry, please type 'GO' to start"
          get_info
          counter += 1
        else counter == 3
          p "Not today, GOODBYE!"
          break
        end
    end
  end





end
