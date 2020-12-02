class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at(i) (cards)
    @cards[i].rank
  end

  def test
      cards.class
      cards.each do |card|
        p card.class
      end
  end

  def high_ranking_cards
    cards.select {|card| card.rank >=12}
  end

  def percent_high_ranking
    #return an array of cards in the deck rank >=11
    numer = cards.select {|card| card.rank >=12}.count
    dem = cards.count
    result = (numer.to_f / dem.to_f) * 100
    result.round(2)
  end

  def remove_card
    new_deck = cards.delete_at(1)
    return new_deck
    #remove top card from deck
  end

  def add_card
    #add card to end of Deck
  end

end
