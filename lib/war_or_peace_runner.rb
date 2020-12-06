require_relative './card'
require_relative './deck'
require_relative './player'
require_relative './turn'
require_relative './card_generator'

def start
  file_name = './lib/cards.csv'

  cards = CardGenerator.new(file_name).cards
  cards = cards.shuffle
  cards1 = cards[0..26]
  cards2 = cards[27..-1]
  deck1 = Deck.new(cards1)
  deck2 = Deck.new(cards2)
  player1 = Player.new('clarisa', deck1)
  player2 = Player.new('Aurora', deck2)
  counter = 1

  puts "Welcome to War! (or Peace) This game will be played with 52 cards.
       The players today are Megan and Aurora.
       Type 'GO' to start the game!
       ------------------------------------------------------------------"
  input = gets.chomp
  if input == "GO"
    while counter < 100000 do
      turn = Turn.new(player1, player2)
      type = turn.type
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)

      if type == :basic
        puts "Turn #{counter}: #{winner.name} won #{turn.spoils_of_war.length} cards"
      elsif type == :war
        puts "Turn #{counter}: WAR - #{winner.name} won #{turn.spoils_of_war.length} cards"
      else #type == :mutually_assured_destruction
        puts "Turn #{counter}: *mutually assured destruction* #{turn.spoils_of_war.length} cards removed from play"
      end

      counter += 1

      if player1.has_lost? || player2.has_lost?
        puts "*~*~*~* #{winner.name} has won the game! *~*~*~*"
      end
    end
  else
    puts "Okay, lets player agon another time!"
  end
end

start
