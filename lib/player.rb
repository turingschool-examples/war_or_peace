class Player
  attr_reader :name,
              :deck,
              :loser,
              :play_count

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @loser = false
  end

  def play
    play_count += 1
      if play_count == 3
        @loser = true
      end
  end
end
