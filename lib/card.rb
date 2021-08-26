require './lib/card'

class Card
  attr_reader :suit,
              :rank,
              :value
  def initialize(:heart, 'Jack', 11)
    @suit = suit
    @rank = rank
    @value = value
  end

  def rank
  end

  def suit
  end

  def value
  end

end
card = Card.new(:heart, 'Jack', 11)

class Deck
end
