SUITS = [:diamond, :heart, :spade, :club]

RANKS = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "Jack" => 11,
  "Queen" => 12,
  "King" => 13,
  "Ace" => 14,
}

class Card
  attr_reader :suit, :value

  def initialize(suit, value, rank = nil)
    validate_suit(suit)
    validate_value(value.to_s)

    @suit = suit
    @value = value.to_s
    # We're ignoring the rank, since we can calculate it.
  end

  def rank
    RANKS[@value]
  end

  private

  def validate_suit(suit)
    raise ArgumentError, "#{suit} is not a valid suit" unless SUITS.include?(suit)
  end

  def validate_value(value)
    raise ArgumentError, "#{value} is not a valid value" unless RANKS.keys.include?(value)
  end
end
