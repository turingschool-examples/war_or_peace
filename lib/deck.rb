class Deck
  attr_reader :card_list, :high_cards
  def initialize(card_list)
    @card_list = card_list
    @high_cards = []
    @high_count = 0
  end

  # Take index_location and return rank of card at location
  def rank_of_card_at(index_location)
    @card_list[index_location].rank
  end

  # Return an array of cards in deck that have rank >= 11
  def high_ranking_cards
    @high_cards = @card_list.select do |card|
      card.rank >= 11
    end
  end

  # Return percentage of cards that are high ranking (>= 11)
  def percent_high_ranking
    @high_count = @card_list.count do |card|
      card.rank >= 11
    end
    ((@high_count.to_f / @card_list.length.to_f) * 100).round(2)
  end

  # Remove card from top of deck (index location [0])
  def remove_card
    @card_list.shift
  end

  # Add one card to the bottom of deck (index location [-1])
  def add_card(card)
    @card_list.push(card)
  end
end
