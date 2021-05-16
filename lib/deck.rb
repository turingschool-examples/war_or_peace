class Deck
  # read the @cards attribute
  attr_reader :cards

  def initialize(cards)
    # returns an array of cards
    @cards = cards
  end

  def rank_of_card_at(index)
    # represents an index location of a card to be used
    rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    rank.fetch(index)
  end

  def high_ranking_cards
    # returns array of cards in the deck that have a rank of 11 or above
    high_ranking_cards = [11, 12, 13, 14]
  end

  def percent_high_ranking
    # returns the percentage of cards that are high ranking in the deck
    # remember the deck refers to the cards in a player's hand, not the whole deck
    # as it would br IRL - this isn't all 52 cards
    # percent_high_ranking = (high_ranking_cards.length) / (cards.length) * (100)
    # nope. repseudocode this...

    # cards in hand with high rank divided by card in hand total
    # How many cards are in the deck?
    # set the length equal to a variable to make calculation easier in the future
    # @cards << cards
    # b = @cards.length
    # Are there any high ranking cards in the deck?
    # Keep in mind cards with a value greater than 11 are considered high ranking

    # create an empty array for the high rnking (high value) cards
    high_value_cards = []
    # put the high cards in the deck (referred to as deck) into the array
    # find cards in hand with high rank and put into another array
    # Calculate the number of elements in this array (call it high_value_cards
    @cards.each do |card|
      if rank == [11, 12, 13, 14]
        high_value_cards << card
      end

      high_value_cards.length
    end

    # Calculate the number of elements in this array and set equal to a variable to make calculation easier
    # a = high_value_cards.length

    # divide a by b and multiply the resulting number by 100.0 to get a number reprewsenting a percentage
    # round to one decimal place for accuracy. Or not...
    # (a / b)

    percent_high_ranking = (high_value_cards.length).div(@cards.length)
  end

  def remove_card
    # remove the top card from the deck
    @cards.shift
  end

  def add_card(card)
    # add one card to the bottom of the deck. the bottom of the deck is the end of the deck.
    cards << @cards.shift
  end
end

# Scratch work: nope nope nope  - I need to try another approach

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
