class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # code here
    # if card rank is higher than oppposing player, return false.
  end
end
