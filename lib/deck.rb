class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = high_ranking_cards
    ((high_cards.count.to_f / @cards.count) * 100).round(2)
  end

  def remove_card #(using .shift to remove first element from an array)
    @cards.shift
  end

  def add_card(card) #(add one card to bottom/end of deck. can use << or .push
    @cards << card
  end

end
