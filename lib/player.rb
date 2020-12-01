class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @losses = 0
  end

  def has_lost?

  end


end
