class Player
  attr_reader :name,
              :deck
  def initialize(name, deck = [])
    @name = name
    @deck = deck
  end

  # def has_lost?
  #   if deck == []
  #     return true
  #   else
  #     return false
  #   end
  # end

  def has_lost?
    @deck.cards == []
  end
  # Can use lines 9-15 or lines 17-19 for test_has_lost. Anytime a method has a '?', you can assume that is Boolean and will return t/f.
end
