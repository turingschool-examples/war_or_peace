class Player
  attr_reader :deck,
              :name

  def initialize(deck, name)
    @deck = deck
    @name = name
  end
end