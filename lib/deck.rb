class Deck
  attr_reader :cards

  # take one argument - an array of cards
  def initialize(cards)
    @cards = cards
  end

  # take one argument that represents the index location of a card to be used and return the rank of that card
  def rank_of_card_at(index)
    # @cards = cards = [card1, card2, card3] = Card.new("diamond", 'Queen', '12') = (suit, value, rank)
    @cards[index].rank
    # => rank_of_cards(0) returns 12, (1) returns 3, (2) returns 14
  end

  # return an array of cards in the deck that have a rank of 11 or above (face cards or aces)
  def high_ranking_cards
    #   'Jack' = 11
    #   'Queen' = 12
    #   'King' = 13
    #   'Ace' = 14
    high_ranking_cards = []

    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards << card
      end
    end

    high_ranking_cards

  end

  # return the percentage of cards that are high ranking
  def percent_high_ranking
    cards = @cards
    total_number_of_cards = cards.length

    high_cards = []

    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end

    high_cards

    number_of_high_cards = high_cards.length

    # total_number_of_cards = 0
    #
    # @cards.each do |card|
    #   total_number_of_cards += 1
    # end
    #
    # total_number_of_cards

    # number_of_high_cards = 0

    # @cards.each do |card|
      # if card.rank >= 11
        # number_of_high_cards += 1
      # end
    # end

    # number_of_high_cards

    percentage_of_high_ranking_cards = number_of_high_cards / total_number_of_cards * 100.00
  end
  # 2 / 3 => 66.67, 1 / 2 = 50.0, 1 / 3 = 33.33
  # passes test but returning 0 in pry???

  # remove top card from the deck
  def remove_card
    card = @cards
    card.shift()
  end

  # add one card to bottom of the deck
  def add_card(card)
    @cards << card
  end
  # not sure if this is supposed to return the new array in pry???

end
