require './lib/card'
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)

    @cards[index].rank
    #rank_of_card_at << @cards.rank
  end

  def high_ranking_cards
    high_ranking = []
    @cards.each do |card|
      if card.rank > 10
        high_ranking << card
      end
    end
    return high_ranking
  end

  def percent_high_ranking
    percent = high_ranking_cards.count.to_f/@cards.count.to_f*100
    return percent.ceil(2)

  end

  def remove_card
    @cards.shift
  end
  #
  # def add_card
  # end

# card = Card.new(:heart, 'Jack', 11)
# deck = Deck.new(cards)
# deck.high_ranking_cards(card)
end
