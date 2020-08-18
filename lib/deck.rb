class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = []
  end

  def rank_of_card_at
    # this method will take one argument that represents the index location of a
    # a card to be used (typically 0 or 2, more on this later) and will return
    # the rank of the card.
  end

  def high_ranking_cards
    # this method will return an array of cards in the deck that have a rank of
    # 11 or above (face cards and aces)
    #  collector_array = []
    # array.each do |card|
    #   if card.rank >= 11
          # collector_array << card
    # end
  end

  def percent_high_ranking
    # this method will return the percentage of cards that a high ranking
    # identify number of cards with high ranking
    # divide no# of high ranking cards with total number of cards
    # output the resulting percentage
  end

  def remove_card
    # this method will remove the top card form the deck
    # array.pop
  end

  def add_card
    # this method will add one card to the bottem (end) of the deck
    # array.insert(0, element)
  end

end
