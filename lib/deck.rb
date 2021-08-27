class Deck
  attr_reader :cards, :high_rank_cards

  #initialize method with array as argument
  def initialize(cards)
    @cards = cards
  end

  #rank_of_card_at provides index location of card
  def rank_of_card_at(index)
    cards[index].rank
  end

  #high_ranking_cards returns an array of cards in the deck that are 11 or higher
  def high_ranking_cards

    cards.find_all do |card|
     card.rank >= 11
    end
  end

  #percent of cards in deck that are ranked higher than 11
  def percent_high_ranking
    ((high_ranking_cards.count.to_f / @cards.count.to_f) * 100).round(2)
  end

  #remove card from deck
  def remove_card
    @cards.shift
  end

  #add card to deck
  def add_card(card)
    @cards.push
  end
end
