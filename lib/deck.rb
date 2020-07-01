class Deck
  attr_reader :suit, :rank, :value

# ??? below
  def initialize(suit = "Default", rank = "Default", value = "Default")
    @suit = suit
    @rank = rank
    @value = value
  end
end
