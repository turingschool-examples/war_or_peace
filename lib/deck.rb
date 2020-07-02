class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)

    target_card  = @cards[index]
    target_card.rank
  end

  def high_ranking_cards
#declare accumulator with []
#loop through cards
#if cards.rank >= 11
#add card to accumulator (array)
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking

    high_cards_2 = []
    low_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards_2 << card
      else
        low_cards << card
      end
    end
    ((high_cards_2.count / (high_cards_2.count + low_cards.count).to_f)*100).round(2)
  end

  def remove_card
    


end
