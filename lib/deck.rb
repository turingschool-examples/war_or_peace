class Deck

  attr_reader :cards

  def initialize(card)
    @cards = card
  end

  def rank_of_card_at(location)
    if @cards[location] == nil
      return 0
    else
      return @cards[location].rank
    end
  end

  def high_ranking_cards
    #step through each element of my cards array
    #and return a new array with only the cards that contain values >= 11
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        # require 'pry'; binding.pry
        high_cards.push card
      end
    end
    return high_cards
  end

  def percent_high_ranking
    percentage = 0.00
    count = 0.00
    cards.each do |card|
      if card.rank >= 11
        # require 'pry'; binding.pry
        count += 1
      end
    end
    percentage = (count / cards.count) * 100
    # require 'pry'; binding.pry
    return percentage.round(2)

  end

  def remove_card
    cards.shift
    # require 'pry'; binding.pry
  end

  def add_card(card)
    cards.push(card)
    return card
    # require 'pry'; binding.pry
  end




end
