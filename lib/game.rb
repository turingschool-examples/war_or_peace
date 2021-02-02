class Game
  attr_reader :turn
  def initialize(t)
    @turn = t
  end

  def start
    # game logic
    turn_counter = 0
    while turn.player1.deck.cards.size > 0 && turn.player2.deck.cards.size > 0 && turn_counter < 1000000
      turn_counter += 1
      the_winner = turn.winner
      if turn.type == :mutually_assured_destruction
        puts "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
      elsif turn.type == :war
        puts "Turn #{turn_counter}: WAR - #{the_winner.name} won 6 cards"
      else
        puts "Turn #{turn_counter}: #{the_winner.name} won 2 cards"
      end

      turn.pile_cards
      turn.award_spoils(the_winner)
      # puts "player1's cards: #{turn.player1.deck.cards.size} || player2's cards: #{turn.player2.deck.cards.size}"
    end

    if turn.winner == 'No Winner' || turn_counter == 1000000
      puts '---- DRAW ----'
    else
      puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
    end
  end
end
