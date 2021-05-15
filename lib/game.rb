
class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    # while both player cards are more than 0 and turn count is less than 1,000,000
    turn_count = 0
    while @turn.player1.deck.cards.length >= 0 && @turn.player1.deck.cards.length >= 0 && turn_count <= 1000000
      turn_count += 1

      if @turn.type == :basic
        winner = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner)

        p "Turn #{turn_count}: #{winner.name} won 2 cards"
      elsif @turn.type == :war
        winner = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner)

        p "Turn #{turn_count}: #{winner.name} won 6 cards"
      else
        winner = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(winner)

        p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      end

      if @turn.player1.deck.cards.length == 0 || @turn.player1.deck.cards.length == 0
        end_game
      elsif turn_count == 1000000
        p ' ---- DRAW ----'
      end
    end
  end

  def end_game
    if @turn.player1.has_lost? == true
      p "#{@turn.player2.name} Won"
    else @turn.player2.has_lost? == true
      p "#{@turn.player1.name} Won"
    end
  end
end
