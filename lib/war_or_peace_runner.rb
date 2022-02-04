require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'


def create_deck

  deck = []
  possible_suits = [:diamond, :heart, :spade, :club]
  possible_value = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King', 'Ace']
  value_index = 0
  suits_index = 0
  rank = 2

  until deck.length() == 52
    4.times do
      value_index = 0
      rank = 2
      13.times do
        deck << Card.new(possible_suits[suits_index], possible_value[value_index], rank)
        value_index += 1
        rank += 1
      end
      suits_index += 1
    end
  end

  deck.shuffle!()
  deck = Deck.new(deck)
  return deck

end

def start (player1, player2)

  @player1 = player1
  @player2 = player2
  turn_counter = 1

  puts "Welcome to War1 (or Peace) This game will be played with 52 cards."
  puts "The players today are #{player1.name} and #{player2.name}"
  puts "Type 'GO' to start the game!"
  puts "------------------------------------------------------------------"
  user_in = gets.chomp()

  if user_in == "GO"
    until turn_counter == 1000000000 || player1.has_lost? == true || player2.has_lost? == true
      turn = Turn.new(player1, player2)
      winner = turn.winner
      if turn.turn_type == :basic
        puts "Turn #{turn_counter}: #{winner.name} won 2 cards"
        turn.pile_cards
        turn.award_spoils(winner)
      elsif turn.turn_type == :war
        puts "Turn #{turn_counter}: WAR #{winner.name} won 6 cards"
        turn.pile_cards
        turn.award_spoils(winner)
      elsif turn.turn_type == :mutually_assured_destruction
        puts "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
        turn.pile_cards
      end

      turn_counter += 1
    end

    if turn_counter == 1000000000
      puts "---- DRAW -----"
    elsif player1.has_lost? == true
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost? == true
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    end
  else
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    user_in = gets
  end

end

deck1 = create_deck
deck2 = create_deck

player1 = Player.new("Maven", deck1)
player2 = Player.new("Adam", deck2)

start(player1, player2)
