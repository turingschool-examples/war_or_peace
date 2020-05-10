class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    @cards[index_location].rank
  end



  def high_ranking_cards
    # high_ranking_cards_array = []

    @cards.find_all do |card|
      card.rank >= 11
    end

    # @cards.each do |card|
    #   if card.rank >= 11
    #     high_ranking_cards_array << card
    #   end
    # end
  end



  def percent_high_ranking
    divide = (high_ranking_cards.count.to_f / @cards.count.to_f)

    divide.round(4) * 100
  end


  def remove_card
    cards.shift
  end


  def add_card (new_card)
    @cards << new_card
  end


end
