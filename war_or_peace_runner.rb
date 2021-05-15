require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/turn'
require_relative 'lib/game'


replay = 'YES'
until replay != 'YES'
  game = Game.new

  ## note, card generator is already built in to Game class
  # separate .txt file not required, a shuffled deck of cards is auto-created
  # via Game.new method (`cards` attribute)
  shuffled_cards = game.cards
  split_deck = [
    Deck.new(shuffled_cards[0..25]),
    Deck.new(shuffled_cards[26..52])
  ]

  player1_name = 'Megan'
  player2_name = 'Aurora'

  player1 = Player.new(player1_name, split_deck[0])
  player2 = Player.new(player2_name, split_deck[1])


  replay = "Would you like to play again? \n Type 'YES' to continue:"
  goodbye = "Game exiting... \n Goodbye!"
  if game.greet(player1, player2).to_s.include?('Error') == false
    puts " >"
    prompt = $stdin.gets.chomp

    if prompt == 'GO'
      game.start(player1, player2)
      2.times { puts '-'*30 }
      puts replay
      puts " >"
      replay = $stdin.gets.chomp
    end

  end

end
puts goodbye
