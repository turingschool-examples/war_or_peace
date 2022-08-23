class Card
  # Suit (:spades, :hearts, :diamonds, :clubs)
  # Value ('Ace', 'King', 'Queen', 'Jack', 'Numbered')
  # Rank (1-13)
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

# I dont want to make every card by hand...
# cards = []
# suits = [:spades, :hearts, :diamonds, :clubs]
# values_ranks = [[13, 'Ace'], [12, 'King'], [11, 'Queen'], [10, 'Jack'], [9, 'Ten'], [8, 'Nine'], [7, 'Eight'], [6, 'Seven'], [5, 'Six'], [4, 'Five'], [3, 'Four'], [2, 'Three'], [1, 'Two']]

# values_ranks.each do |card|
#   cards << [suits[0], card].flatten
#   cards << [suits[1], card].flatten
#   cards << [suits[2], card].flatten
#   cards << [suits[3], card].flatten
# end

# cards.shuffle!

# class Card
#   # Suit (:spades, :hearts, :diamonds, :clubs)
#   # Value ('Ace', 'King', 'Queen', 'Jack', 'Numbered')
#   # Rank (1-13)
#   attr_reader :suit, :value, :rank
#   def initialize(suit, value, rank)
#     @suit = suit
#     @value = value
#     @rank = rank
#   end
# end

# all_cards = (1..52).map do |number|
#   Card.new(cards[number - 1][0], cards[number - 1][1], cards[number - 1][2])
# end

# p all_cards
