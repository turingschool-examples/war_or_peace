require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/turn'
require_relative 'lib/game'


run = true
until run == false
  game = Game.new
  game.shuffle_deck

  player1 = Player.new('Megan', Deck.new(game.split_deck[0]))
  player2 = Player.new('Aurora', Deck.new(game.split_deck[1]))

  if game.greet(player1, player2).to_s.include?('Error') == false
    puts game.greet(player1, player2)
    prompt = $stdin.gets.chomp.upcase
    if prompt == 'GO'
      game.start(player1, player2)
      2.times { puts '-'*30 }
      puts "Would you like to play again?\nType 'YES' to continue:\n >"
      run = $stdin.gets.chomp.upcase == 'YES'
    end
  end

end
puts "Game exiting... \n Goodbye!"
