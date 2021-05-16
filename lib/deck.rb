class Deck
  # read the @cards attribute
  attr_reader :cards

  def initialize(cards)
    # returns an array
    @cards = []
  end

  def rank_of_card_at(i)
    # represents an index location of a card to be used
    ranks = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King','Ace']
  end

  def high_ranking_cards
    # returns array of cards in the deck that have a rank of 11 or above
    high_ranking_cards = ['Jack', 'Queen', 'King', 'Ace']
  end

  def percent_high_ranking
    # returns the percentage of cards that are high ranking
    high_ranking_cards.length / ranks.length * 100
  end

  def remove_card
    # remove the top card from the deck
    cards.shift
  end

  def add_card(card)
    # add one card to the bottom of the deck. the bottom of the deck is the end of the deck.
    @cards << card
  end
end

# Scratch work:

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
