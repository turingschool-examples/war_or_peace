class Game
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
end

def start
  number_of_turns = 1

  while num_of_turns < 1000000
    if player1.has_lost?
      winner = player2
    elsif player2.has_lost?
      winner = player1
    else
      number_of_turns += 1
    end
    # go through turn.type branches and announce winner of cards,
    # turn.pile_cards and turn.award_spoils(winner)
    # Then if after 1,000,000 turns of the above and no one has
    # an empty hand, declare it a draw.
  end
end
