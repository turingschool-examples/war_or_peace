class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  # if @suit == "hearts" || "spades" || "clubs" || "diamonds"
  # else
  # p "This is not a valid suit"
  #end
end
