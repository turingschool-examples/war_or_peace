class Player
  attr_reader :name,
  :deck,

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost
    if deck.length == 0
      return true
    else
      return false
    end
  end
end

player = Player.new('Clarisa','deck_1')
