class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def print_info
    puts "[suit: #{suit}, value: #{value}, rank: #{rank}]"
  end
end
