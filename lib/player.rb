class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @losses = 0
  end

  def has_lost?
    if @losses != 0
      true
    else
      false
    end
  end

  def lose
    @losses += 1
  end
end
