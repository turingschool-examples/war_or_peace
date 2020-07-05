# require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require './lib/deck_generator'

class Game
  attr_reader :player1, :player2, :turn_number, :turn, :spoils_of_war, :cards_won
  $turn_number = -1

  def initialize
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @cards_won = cards_won
  end

  def start

    new_deck = DeckGenerator.new
    new_deck.print_cards
    full_deck = new_deck.cards_here
    shuffled_deck = full_deck.shuffle


    deck1 = Deck.new(shuffled_deck.take(26))
    deck2 = Deck.new(shuffled_deck.drop(26))


    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)



    10000.times{
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
      # p '------------------------player 1'
      # p turn.player1.deck.cards[0]
      # p turn.player1.deck.rank_of_card_at(0)
      # p '----------------------------player 2'
      # p turn.player2.deck.cards[0]
      # p turn.player2.deck.rank_of_card_at(0)
      # p "type"
      # p turn.type
      # p "winner"
      # p turn.winner
      # p turn.pile_cards
      # turn.award_spoils("Megan")
      # p player1.deck.cards.length
      # p 'Player 1 cards'
      # p player1.deck.cards
      # p 'Player 2 cards'
      # p player2.deck.cards
      # p player1.deck.cards.length
      # p player2.deck.cards.length
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
  puts "Try putting 'go' or 'GO'."
end
