require_relative 'card_generator'
require_relative 'player'
require_relative 'turn'
require 'pry'

def start_game
  puts "Welcome to War! (or Peace) This game will be played with 52 cards."
  puts "The players today are #{@player1.name} and #{@player2.name}."
  puts "Type 'GO' to start the game!"
  puts "------------------------------------------------------------------"
  answer = gets.chomp
  if answer.upcase.gsub(" ", "") == "GO"
    x = 1
    while x <= 1000001 do
      take_turn(x)
      x += 1
    end

  else
    puts "You must type 'GO' in order to start the game."
  end
end

def take_turn(x)
  #binding.pry
  turn = Turn.new(@player1, @player2)
  winner = turn.winner
  turn.pile_cards
  turn_type = turn.type
  num_cards = turn.spoils_of_war.count
  turn.award_spoils(winner)
  turn_string = ""
  if turn_type == :basic
    turn_string = ""
  elsif turn_type == :war
    turn_string = "WAR - "
  elsif turn_type == :mutally_assured_destruction
    turn_string = "*mutally assured destruction* "
  end
  if turn.type == :mutally_assured_destruction
    puts "Turn #{x}: #{turn_type}6 cards removed from play"
  else
    puts "Turn #{x}: #{turn_string}#{turn.winner.name} won #{num_cards} cards."
  end
end

card_generator = CardGenerator.new
card_generator.create_cards
card_generator.create_decks
@player1 = Player.new("Jenny", card_generator.deck1)
@player2 = Player.new("Marisa", card_generator.deck2)


start_game
