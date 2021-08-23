require './card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_rankers = []
    @cards.each {|card|
    if card.rank >= 11
      high_rankers << card
    end}
    high_rankers
  end

  def percent_high_ranking
    high_ranking = high_ranking_cards
    ((high_ranking.length / @cards.length.to_f) * 100).round(2)
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

deck.high_ranking_cards

deck.percent_high_ranking

p deck.cards

deck.add_card(card4)

p deck.cards
