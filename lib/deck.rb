class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  #Method will take one argument that represents the index location of a card to be used and will return the rank of that card.
  def rank_of_card_at(index)
    cards[index].rank
  end


  #Method will return an array of cards in the deck that have a rank of 11 or above (faces and aces)
  def high_ranking_cards

    cards.find_all do |card|
      card.rank >= 11
    end
  end

  #Method will return the percentage of cards that are high ranking.
  def percent_high_ranking
    ((high_ranking_cards.length.to_f / @cards.count) * 100).round(2)
  end

  #Method will remove the top card from deck.
  def remove_card
    @cards.shift
  end

  #Method adds card 4
  def add_card(card)
    @cards << card
  end
end
