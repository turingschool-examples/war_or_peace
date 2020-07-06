# require './lib/card' <-- For when I had a file to create each deck via enumeration
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
# DeckGenerator is used to create a deck of 52 cards from the card_generator file,
# which is used to create cards out of the cards.txt file
require './lib/deck_generator'

class Game
  attr_reader :player1, :player2, :turn_number, :turn, :spoils_of_war
  $turn_number = -1

  def initialize
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def start

    new_deck_of_cards = DeckGenerator.new
    new_deck_of_cards.return_all_cards
    full_deck = new_deck_of_cards.cards_stacked_here
    shuffled_deck = full_deck.shuffle


    deck1 = Deck.new(shuffled_deck.take(26))
    deck2 = Deck.new(shuffled_deck.drop(26))


    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)



    10000.times{
      # p "Megan's deck size: #{player1.deck.cards.length}"
      # p "Aurora's deck size: #{player2.deck.cards.length}"
      turn = Turn.new(player1, player2)
      turn.type
      winner = turn.winner
      turn.pile_cards
      turn.spoils_of_war
      turn.award_spoils(winner)

      if player1.deck.cards.length <= 3 || player2.deck.cards.length <= 3
        puts "#{turn.winner} won!"
        break
      end
      if turn.winner == "Aurora" || turn.winner == "Megan"
        p "Turn #{$turn_number}: #{turn.type} - #{turn.winner} won #{turn.spoils_of_war.count} cards."
      else
        p "Turn #{$turn_number}: *#{turn.type}* 6 cards removed from play."
      end
      p "Megan's deck size: #{player1.deck.cards.length}"
      p "Aurora's deck size: #{player2.deck.cards.length}"
      # p player2.deck.cards

      $turn_number += 1
      if $turn_number == 10000
        puts "---DRAW---"
        break
      end
     }

  end
end


puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
if gets.chomp!.downcase == 'go'
  new_game = Game.new
  new_game.start
else
  # In case user input's something other than 'go' or 'GO'
  puts "Try putting 'go' or 'GO'."
end
