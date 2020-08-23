class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(i)
    cards[i].rank
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

  def generate_standard_deck
    suits = [:heart, :club, :diamond, :spades]
    card_hash = {
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14}
    @cards = []
    suits.each do |suit|
      card_hash.each do |value, rank|
        @cards << Card.new(suit, value, rank)
      end
    end
  end
end
