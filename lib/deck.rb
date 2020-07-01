class Deck

  attr_reader :cards

  def initalize(cards)
    @cards = %w[1 2 3 4 5 6 7 8 9 10 J Q K A]
  end

  def rank_of_card_at
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
    if cards.rank >= 11
    high_cards << cards
  end

  def percent_high_ranking
    cards.each do |card|
      if card > 9 
  end

  def remove_card

  end

  def add_card
  end
end
