# frozen_string_literal: true

class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{@turn.player1.name} and #{@turn.player2.name}. Type 'GO' to start the game!"

    play_game = gets.chomp
    if play_game.downcase == 'go'
      run_game
    else
      p 'Some other time maybe'
    end
  end

  def run_game
    # While both player's cards are more than 0 and turn count is less than 1,000,000
    turn_count = 0
    while @turn.player1.deck.cards.length.positive? && @turn.player2.deck.cards.length.positive? && turn_count < 1_000_000
      turn_count += 1

      case @turn.type
      when :basic
        winner = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner)

        p "Turn #{turn_count}: #{winner.name} won 2 cards"
        break if @turn.player1.has_lost? || @turn.player2.has_lost?
      when :war
        winner = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner)

        p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
        break if @turn.player1.has_lost? || @turn.player2.has_lost?
      else
        @turn.pile_cards

        p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      end

      break if @turn.player1.has_lost? || @turn.player2.has_lost?
    end
    end_game
  end
end

def end_game
  if @turn.player1.has_lost? == true
    p "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~* ---- #{@turn.player2.name} won #{@turn.player2_win_count} hands and #{@turn.player1.name} won #{@turn.player1_win_count} hands"
  elsif @turn.player2.has_lost? == true
    p "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~* ---- #{@turn.player1.name} won #{@turn.player1_win_count} hands and #{@turn.player2.name} won #{@turn.player2_win_count} hands"
  else
    p '---- DRAW ----'
  end
end
