class Deck
  attr_reader :cards, :deck_size

  def initialize(cards)
    @cards = cards
    @deck_size = cards.size
  end

  def rank_of_card_at(card_ind)
    cards[card_ind].rank
  end

  def high_ranking_cards(deck)
    deck.cards.each do |card_rank|
      if card_rank.rank < 11
        deck.cards.delete(card_rank)
      end
    end
  end

  def percent_high_ranking(deck)
    high_rank = high_ranking_cards(deck).size
    percent = high_rank.to_f / deck.deck_size.to_f
    percent = percent * 100
    percent.round(2)
  end

  def remove_card(deck)
    deck.cards.shift
  end

  def add_card(deck, card)
    deck.cards << card
  end

end
