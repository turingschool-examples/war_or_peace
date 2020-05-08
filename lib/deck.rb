class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    @cards[location].rank
  end

  def high_ranking_cards
    result_deck = []
    @cards.each do |card|
      if card.rank >= 11
        result_deck << card
      end
    end
    result_deck
  end

  def percent_high_ranking
      number_of_cards = @cards.count
      high_ranking_count = 0

      @cards.each do |c|
        if c.rank >= 11
          high_ranking_count += 1
        end
      end
      calc_results = high_ranking_count.to_f / number_of_cards * 100
      calc_results.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end
end

deck = Deck.new(cards)
