class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # cards.each do |card|
    # if card.rank = 14
    # return false
    # end
  end
end
