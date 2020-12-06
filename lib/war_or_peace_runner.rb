require_relative './card'
require_relative './deck'
require_relative './player'
require_relative './turn'
require_relative './card_generator'

def start
  card1 = Card.new('2', 'Heart', 2)
  card2 = Card.new('3', 'Heart', 3)
  card3 = Card.new('4', 'Heart', 4)
  card4 = Card.new('5', 'Heart', 5)
  card5= Card.new('6', 'Heart', 6)
  card6 = Card.new('7', 'Heart', 6)
  card7 = Card.new('8', 'Heart', 8)
  card8 = Card.new('9', 'Heart', 9)
  card9 = Card.new('0', 'Heart', 10)
  card10 = Card.new('Jack', 'Heart', 11)
  card11= Card.new('Queen', 'Heart', 12)
  card12 = Card.new('King', 'Heart', 13)
  card13 = Card.new('Ace', 'Heart', 14)
  cards1 = [card12, card10, card6, card7, card11, card13]
  cards2 = [card2, card4, card5, card8, card3, card1]

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
    while counter < 10000 do
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
