class Player
  attr_reader :player, :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
end
