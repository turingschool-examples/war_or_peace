require './lib/card'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(n)
    @cards[n].rank
  end

  def high_ranking_cards
    high_rank_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    return high_rank_cards
  end

  def percent_high_ranking
    high_rank_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    (high_rank_cards.length.to_f / @cards.length.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, '5', 5)
cards = [card1, card2, card3]

deck = Deck.new(cards)
p deck.cards
# puts deck.rank_of_card_at(2)
# p deck.high_ranking_cards
# p deck.high_ranking_cards.length
# p deck.percent_high_ranking
# p deck.remove_card
# p deck.add_card(card4)
