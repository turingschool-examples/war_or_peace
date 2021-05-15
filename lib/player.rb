class Player
  attr_reader :name

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
  end

end
