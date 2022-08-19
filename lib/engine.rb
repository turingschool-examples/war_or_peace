class Engine
  def start(player1, player2)
    puts ""
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    input = gets.chomp.upcase
    until input == "GO"
      puts "That's not 'GO'; try again"
      input = gets.chomp
    end
    puts "here we go!"
  end
end