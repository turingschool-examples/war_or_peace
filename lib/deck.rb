class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end


  def high_ranking_cards
    @high_ranking_cards = @cards.find_all do |card|
      card.rank >= 11
    end
  end

#receiving error 'count' is undefined method
  def percent_high_ranking
    (high_ranking_cards.count.fdiv(@cards.count) * 100).round(2)
  end


  def remove_card
    #removes the top(first) card from our deck
    @cards.shift
  end

  def add_card(new_card)
    #the comment version isnt specific of its location
    #it only adds the new card to the array rather than to the bottom
    #of the deck
    # @cards << new_card

    #error because of 'new_card' not sure what to use here
    #error fixed by adding it as a parameter?
    @cards.insert(-1, new_card)
  end
end
