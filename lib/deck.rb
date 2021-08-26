class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def rank_of_card_at(position)
    @position = position
    cards[position.to_i].rank
  end

  def high_ranking_cards
    high_card_array = []
    cards.each do |card|
      if card.rank >= 11
        high_card_array << card
      end
    end
    high_card_array
  end

  def percent_high_ranking
    number_of_high_rank_cards = high_ranking_cards.count
    number_of_cards = cards.count
    percent_high_rank = number_of_high_rank_cards.to_f / number_of_cards.to_f * 100
    percent_high_rank.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
