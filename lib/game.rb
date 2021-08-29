require './lib/player'

class Game
  def initialize(player1, player2)
  end

  def shuffle_deck
    full_deck.shuffle
    26.times do
      deck1 << full_deck
      deck2 << full_deck
    end
  end
end
