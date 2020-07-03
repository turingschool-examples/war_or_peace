class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_card = []
    cards.each do |card|
      if card.rank >= 11
        high_card << card
      end
    end
    high_card
  end

  def percent_high_ranking
    percent = ((high_ranking_cards.length.to_f / cards.length.to_f) * 100).round(2)
    p "#{percent} percent of the deck is high ranking cards."
  end

  def remove_card
    cards.shift
    # removed return as I updated turn.rb
    # cards
  end

  def add_card(card)
    cards << card
  end
end
