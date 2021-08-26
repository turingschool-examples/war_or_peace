class Deck
  attr_reader :cards,
              :high_cards
  def initialize
    @cards = []
    @high_cards = high_cards
  end

  def rank_of_card_at
    puts @cards
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
      @high_cards << @card
      else
      end
    end


    def percent_high_ranking
      [high_cards.count /cards.count] * 100
    end

    def remove_card
      @cards.shift
    end

    def add_card
      @cards.pop
    end

  end
