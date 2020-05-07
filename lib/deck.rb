class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(num_param)
    @cards[num_param].rank
  end

  def high_ranking_cards
    high_ranked_cards = []

    @cards.each do |card|
      if card.rank > 11
        high_ranked_cards << card
      end
    end

    high_ranked_cards
  end

  def percent_high_ranking
    total_card_count = @cards.count
    high_ranked_cards = []

    @cards.each do |card|
      if card.rank > 11
        high_ranked_cards << card
      end
    end

    high_ranked_card_count = high_ranked_cards.count
    result = high_ranked_card_count.to_f / total_card_count.to_f
    percent = result * 100
    percent.round(2)
  end

  def remove_card
    @cards.shift
    @cards
  end






  def add_card(new_card)
    @cards << new_card
  end








end
