class Card
  attr_reader :suit, :value, :rank

  def initialize(suit=:joker, value='Joker', rank=0)
    valid_suits = [:heart, :spade, :diamond, :club]

    valid_values = {
      'Ace': 14,
      'King': 13,
      'Queen': 12,
      'Jack': 11,
      :numeric => (2..10)
    }

    suit_check = suit.to_s.downcase.to_sym
    value_check_str = value.to_s.capitalize.to_sym
    value_check_int = value.to_s.to_i
    rank_check = rank.to_s.to_i

    if valid_suits.index(suit_check) == nil
      invalid_input = true
    elsif valid_values.keys.index(value_check_str) == nil && valid_values[:numeric].include?(value_check_int) == false
      invalid_input = true
    elsif valid_values[value_check_str] != rank_check && value_check_int != rank_check
      invalid_input = true
    end

    if invalid_input
      @suit = :joker
      @value = 'Joker'
      @rank = 0
    else
      @suit = suit_check
      @value = value.to_s.capitalize
      @rank = rank_check
    end
  end

end
