class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    #change from [] to 'cards' - want to have state defining attribute
    # represent the argument that is being passed through the method.
  end

  def rank_of_card_at(index)
    card_rank = cards[index].rank
  end

  def high_ranking_cards
      cards.find_all do |card|
        card.rank >= 11
      end
  end

  def percent_high_ranking
    ((high_ranking_cards.length.to_f / cards.length) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.push(card)
  end

end
