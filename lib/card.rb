class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

#Mike's Ideas:
# suits = [:heart, :club, :diamond, :spade]
# standard_deck = []
# suits.each do |suit|
#   standard_deck << Card.new(suit, "2", 2)
#   standard_deck << Card.new(suit, "2", 2)
#   standard_deck << Card.new(suit, "2", 2)
#   standard_deck << Card.new(suit, "2", 2)
#   standard_deck << Card.new(suit, "2", 2)
# end
#
# deck_1 = Deck.new(standard_deck.shuffle)
# deck_2 = Deck.new(standard_deck.shuffle)

# player_1 = Player.new("Clarissa," Deck.new(standard_deck.shuffle))
# player_2 = Player.new("Ambrose", deck_2)
