class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)

    target_card  = @cards[index]
    target_card.rank
  end

  def high_ranking_cards

    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking

    high_cards_2 = []

    @cards.each do |card|
      if card.rank >= 11
        high_cards_2 << card
      
      end
    end

    ((high_cards_2.count / (@cards.count).to_f)*100).round(2)
  end

  def remove_card
    @cards.shift
    #require "pry"; binding.pry #does this include everything above it?
  end

  def add_card(card)
    @cards << card
  end

end
