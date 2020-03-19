class Player
  attr_reader :name,
              :deck,
              :winner,
              :play_count

  def initialize(name, deck)
    @name = name
    @deck = deck
    @loser = false
    @play_count = 0
  end

  def has_lost?
    @loser
  end

  def play
    @play_count += 1
    @loser = true if play_count == 3
  end
end
