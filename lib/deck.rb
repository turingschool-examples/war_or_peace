class Deck
  attr_reader :cards

  def initialize(cards = full_deck)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
        card.rank >= 11
    end
  end

  def percent_high_ranking
    high_cards = high_ranking_cards
    high_cards.size.to_f / @cards.size
  end
  
  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

  def full_deck
    suits = %i[diamond heart spaid club]
    card_names = %w[
      Two
      Three
      Four
      Five
      Six
      Seven
      Eight
      Nine
      Ten
      Jack
      Queen
      King
      Ace
    ]

    full_deck = []
    suits.each do |suit|
      card_names.each_with_index do |name, index|
        full_deck << Card.new(suit, name, index + 2)
      end
    end
    full_deck
  end

end
