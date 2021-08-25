class Deck
  attr_reader: cards
  def initialize
    @cards = []
  end

  #not sure
  def rank_of_card_at
    puts @cards[0,2]
  end

  def high_ranking_cards
    cards.each do |cards|
      if cards.rank > 11
      high_cards << cards
      else
      end
    end

#not sure
    def percent_high_ranking
      cards.each.do |cards|
      high_ranking_cards % cards
      return  
    end

    def remove_card
      cards.shift
    end

    def add_card
      cards.pop
    end

  end
