class Card
attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, '5', 5)
cards = [card1, card2, card3]

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    @cards[location].rank
  end

  def high_ranking_cards
    result_deck = []
    @cards.each do |card|
      if card.rank >= 11
        result_deck << card
      end
    end
    result_deck
  end

  def percent_high_ranking
      number_of_cards = @cards.count
      high_ranking_count = 0

      @cards.each do |c|
        if c.rank >= 11
          high_ranking_count += 1
        end
      end
      calc_results = high_ranking_count.to_f / number_of_cards * 100
      calc_results.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end
end

deck = Deck.new(cards)

require 'pry'; binding.pry
