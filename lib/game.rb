class Game

  attr_accessor :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  # Write start method here
  def start
    # I know I need a get chomp to get player names
    # I will need a get chomp to start the game
    p "Welcome to War! (or Peace). This game will be played with 52 cards."
    p "Player 1, enter your name"
    puts "> "
    player_1 = $stdin.gets.chomp
    p "Player 2, enter your name"
    puts "> "
    player_2 = $stdin.gets.chomp
    p "The players today are #{player_1} and #{player_2}"
    p "Type 'GO' to start the game!"
    p "-------------------------------------------------"
    user_input_start = ""
    user_input_start = gets.chomp
    if user_input_start.upcase == "GO"
      # start game
      p "#{player_1} and #{player_2} declare WAR!"
      user_start
    else
      # start welcome message over
      p "Misfire... read the instructions next time :)"
      start
    end

  end

end
