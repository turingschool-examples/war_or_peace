# Create a Deck class and an accompanying test file with the following instance methods:
#

# rank_of_card_at: this method will take one argument
#that represents the index location of a card to be used
#(typically 0 or 2 more on this later 😉 ) and will return
#the rank of that card.

# high_ranking_cards: this method will return an array of
#cards in the deck that have a rank of 11 or above
#(face cards and aces)

# percent_high_ranking: this method will return the
# percentage of cards that are high ranking

# remove_card: this method will remove the top card from the deck
#
# add_card: this method will add one card to the bottom
#(end) of the deck

# Use the interaction pattern below to help you build
#your DeckTest and Deck class.
#
# Remember, #<Card:0x00randomletters&nums...> means “A Card Object” or “An Ins



class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = []
  end
end
  # def rank_of_card_at (index)
  #
  #   [index]
  #
  # end
  #
  # def high_ranking_cards
  #
  # end
  #
  # def percent_high_ranking
  #
  # end
  #
  # def remove_card
  #
  # end
  #
  # def add_card
  #
  # end
