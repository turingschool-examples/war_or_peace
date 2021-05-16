class Deck
  # read the @cards attribute
  attr_reader :cards

  def initialize(cards)
    # returns an array
    @cards = []
  end

  def rank_of_card_at(i)
    # represents an index location of a card to be used
  end

  def high_ranking_cards
    # returns array of cards in the deck that have a rank of 11 or above
  end

  def percent_high_ranking
    # returns the percentage of cards that are high ranking
  end

  def remove_card
    # remove the top card from the deck
  end

  def add_card
    # add one card to the bottom of the deck. the bottom of the deck is the end of the deck.
  end
end

#   @faces.each do |face|
#     if face.class == Integer
#       value = face
#     elsif face.class == 'Jack'
#       value = 11
#     elsif face.class == 'Queen'
#       value = 12
#     elsif face.class == 'King'
#       value = 13
#     elsif face.class == 'Ace'
#       value = 14
#   end
