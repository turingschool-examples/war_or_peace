#'./lib/game'

class Game

  def start(deck1,deck2)
    #create 2 decks to pass to players
    player1_deck = Deck.new(deck1)
    player2_deck = Deck.new(deck2)

    #create 2 players
    player1 = Player.new('Megan', player1_deck)
    player2 = Player.new('Aurora', player2_deck)

    # Take a turn
    turn_count = 0
    turn = Turn.new(player1, player2)

    while ((player1.deck.cards).length >= 0) &&
        ((player2.deck.cards).length >= 0) &&
        turn_count < 100000

      player1_deck_size = player1.deck.cards.length
      player2_deck_size = player2.deck.cards.length

    p player1_deck_size
    p player2_deck_size

      if player1_deck_size == 0 || player2_deck_size == 0
        break
      end

      turn_count += 1
      round_type = turn.type
      round_winner = turn.winner
      turn.pile_cards

      if round_winner != "No Winner"
        turn.award_spoils(round_winner)
      else
        puts "No winner this turn"
      end

      if round_type == :basic
        puts "Turn #{turn_count}: #{round_winner.name} won 2 cards #{round_type}"
      elsif round_type == :war
        puts "Turn #{turn_count}: WAR - #{round_winner.name} won 6 cards #{round_type}"
      elsif round_type == :mutually_assured_destruction
        puts "Turn #{turn_count}: *mutually_assured_destruction* 6 cards removed from play"
      end
    end

    if player1_deck_size == 0
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2_deck_size == 0
     puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    elsif turn_count == 100000
     puts "---- DRAW ----"
    end
  end
end
