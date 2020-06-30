class Deck
attr_reader  :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    initial_percent = (high_ranking_cards.count) / (@cards.count).to_f

    secondary_percent = initial_percent * 100

    percent = secondary_percent.round(2)

  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end



end
