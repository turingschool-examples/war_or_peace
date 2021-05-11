class Deck
  attr_reader :cards

  def initialize(cards=[])
    card_check = cards.any? do |card|
      card.class != Card
    end
    if card_check || cards.class != Array
      @cards = Array.new
    else
      @cards = cards
    end
  end

  def rank_of_card_at(index_of_card=nil)
    if self.cards.length == 0 || index_of_card.class != Integer
      return nil
    else
      output = self.cards[index_of_card]
      return output.rank unless output == nil
    end
  end

  def high_ranking_cards()
    if self.cards.length > 0
      return self.cards.select do |card|
        card.rank >= 11
      end
    else
      return Array.new
    end
  end

  def percent_high_ranking()
    if self.cards.length == 0
      return 0.to_f
    else
      return ((high_ranking_cards.length.to_f / self.cards.length.to_f) * 100).round(2)
    end
  end

  def remove_card()
    return self.cards.shift unless self.cards.length == 0
  end

  def add_card(new_card)
    if new_card.class == Card
      self.cards << new_card
    end
  end

end
