require './lib/card'

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
end

card1 = Card.new(:diamond, 'Queen', 12)

card2 = Card.new(:spade, '3', 3)

card3 = Card.new(:heart, 'Ace', 14)

cards = [card1, card2, card3]

deck = Deck.new(cards)
