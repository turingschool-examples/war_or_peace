require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/gameplay'
require 'pry'


card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, 'Jack', 11)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '9', 9)
card8 = Card.new(:diamond, '2', 2)

deck1 = Deck.new([card1, card2, card3, card4])
deck2 = Deck.new([card5, card6, card7, card8])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

turn = Turn.new(player1, player2)
# binding.pry
turn_counter = 0
until player1.has_lost? == true || player2.has_lost? == true || turn_counter == 1000000 do

turn_counter += 1
turn.spoils_of_war.clear
# binding.pry
  if turn.type == :mutually_assured_destruction && turn.type != :basic
    turn.pile_cards
    puts "kjhjbhfkhfjwefcjkhskfhkjefhkfkhsfkjsdkjhffskdksd"
    binding.pry
  elsif turn.type == :war
    turn.winner
    turn.pile_cards
    puts "Turn #{turn_counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.length} cards"
    turn.award_spoils
  elsif turn.type == :basic && turn.type != :mutually_assured_destruction
    turn.winner
    if turn.winner == player1
      puts "Turn #{turn_counter}: #{player1.name} won #{turn.spoils_of_war.length} cards"
    elsif turn.winner == player2
      puts "Turn #{turn_counter}: #{player2.name} won #{turn.spoils_of_war.length} cards"
    end
    turn.pile_cards
    turn.award_spoils
  end
end

puts "game over"
