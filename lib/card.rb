class Card
  attr_reader :suit, :value, :rank, :valid_suits, :valid_values

  def initialize(suit=:joker, value='Joker', rank=0)
    @valid_suits = [:heart, :spade, :diamond, :club]
    @valid_values = {
      'Ace': 14,
      'King': 13,
      'Queen': 12,
      'Jack': 11,
      :numeric => (2..10)
    }
    if @valid_suits.index(suit.to_s.downcase.to_sym) == nil
      invalid_input = true
    elsif @valid_values.keys.index(value.to_s.capitalize.to_sym) == nil && @valid_values[:numeric].include?(value.to_s.to_i) == false
      invalid_input = true
    elsif @valid_values[value.to_s.capitalize.to_sym] != rank.to_s.to_i && value.to_s.to_i != rank.to_s.to_i
      invalid_input = true
    end

    if invalid_input
      @suit = :joker
      @value = 'Joker'
      @rank = 0
    else
      @suit = suit.to_s.downcase.to_sym
      @value = value.to_s.capitalize
      @rank = rank.to_s.to_i
    end
  end

end
