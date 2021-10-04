class Deck
  attr_reader :cards

  def initialize(cards = full_deck)
    @cards = cards
  end

  def rank_of_card_at(index)
    return 0 if @cards[index].nil?

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
    @cards.shift if @cards.size > 0
  end

  def add_card(card)
    @cards << card
  end

  def full_deck
    suits = %i[diamond heart spaid club]
    card_names = {
      Two: 2,
      Three: 3,
      Four: 4,
      Five: 5,
      Six: 6,
      Seven: 7,
      Eight: 8,
      Nine: 9,
      Ten: 10,
      Jack: 11,
      Queen: 12,
      King: 13,
      Ace: 14
    }

    full_deck = []
    suits.each do |suit|
      card_names.each do |name, rank|
        full_deck << Card.new(suit, name, rank)
      end
    end
    full_deck
  end

  def shuffle
    @cards = @cards.shuffle
  end
end
