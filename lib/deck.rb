class Deck
  attr_reader :cards # allows reading of individual cards

  def initialize(card_array) # creates an array of cards
    @cards = card_array
  end

  def rank_of_card_at(position) # determines the rank of a given card
    @cards[position.to_i].rank
  end

  def high_ranking_cards # returns all high ranking cards (Jacks or higher)
    high_card_array = []
    cards.each do |card|
      if card.rank >= 11
        high_card_array << card
      end
    end
    high_card_array
  end

  def percent_high_ranking # returns what percentage of cards are high ranking
    number_of_high_rank_cards = high_ranking_cards.count
    number_of_cards = cards.count
    percent_high_rank = number_of_high_rank_cards.to_f / number_of_cards.to_f * 100
    percent_high_rank.round(2)
  end

  def remove_card # removes the top (first) card from a deck
    cards.shift
  end

  def add_card(card) # adds a card to the bottom (end) of a deck
    @cards << card
  end
end
