require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

full_deck = CardGenerator.new("cards.txt")

shuffled = full_deck.cards.shuffle.each_slice(full_deck.cards.length / 2).to_a

player_1_deck = Deck.new(shuffled[0])
player_2_deck = Deck.new(shuffled[1])

player_1 = Player.new("Geordie", player_1_deck)
player_2 = Player.new("Riker", player_2_deck)

turn = Turn.new(player_1, player_2)
turn_counter = 0

puts "Welcome to War! (Or Peace) This game will be played with #{full_deck.cards.length} cards."
puts "The players today are #{turn.player1.name} and #{turn.player2.name}."
puts "Type GO to start the game!"
puts "--------------------------------------------"
turn.start


until turn.player1.has_lost == true || turn.player2.has_lost == true do
  turn_counter += 1
  turn.winner?
  turn.pile_cards
  puts "Turn #{turn_counter}: #{turn.turn_type} - #{turn.winner.name} won #{turn.spoils_of_war.length} cards."
  turn.award_spoils(turn.winner)
  puts "#{turn.player1.name} has #{turn.player1.deck.cards.length} cards in their deck"
  puts "#{turn.player2.name} has #{turn.player2.deck.cards.length} cards in their deck"

  turn.player1.has_lost?
  turn.player2.has_lost?

  break if turn_counter == 1000000
end

if turn.player1.has_lost == true || turn.player2.has_lost == true
  puts "* * * * GAME OVER * * * *"
  puts "#{turn.winner.name} has won the war!"
else
  puts "-----DRAW-----"
end
