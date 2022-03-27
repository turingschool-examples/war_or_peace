class Start
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    game_start = gets.chomp

    player1_basic_win = "#{player1.name} won 2 cards"
    player1_war_win = "WAR - #{player1.name} won 6 cards"
    player2_basic_win = "#{player2.name} won 2 cards"
    player2_war_win = "WAR - #{player2.name} won 6 cards"
    no_one_wins_in_war = "*mutually assured destruction* 6 cards removed from play"
    player1_win_game = "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    player2_win_game = "*~*~*~* #{player2.name} has won the game! *~*~*~*"

    if game_start == "GO"
      while player1.has_lost? == false && player2.has_lost? == false do
        turn_index = 0
        turn = Turn(player1, player2)
        p "Turn #{turn_index}:" + ""
      end
    end
  end
end
