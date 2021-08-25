class Card
attr_reader :suit,
            :name,
            :position

  def initialize (suit, name, position)
    @suit     = suit
    @name     = name
    @position = position
  end
end
