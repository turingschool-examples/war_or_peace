class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = Card
  end

  def rank_of_card_at
    cards.each do |card|
      p card.rank
    end
  end

  def high_ranking_cards
    cards.each do |card|
      if card.rank >= 11
        p card
      end
    end

def percent_high_ranking

high_count = 0

  cards.each do |card|
    if card.rank >= 11
      high_count += 1
    end

  p 100 * (high_count.to_f/(cards.length))
end

def remove_card
  card.shift
end

def add_card
  cards.push(card4)
end

end


card1 = Card.new(:diamond, 'Queen', 12)
card2=  Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card4 = Card.new(:club, '8', 8)

cards = ['card1', 'card2', 'card3']

deck = Deck.new(cards)
