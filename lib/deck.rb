class Deck
  attr_reader :cards, :card1
  def initialize(cards = [])
    @cards = cards
  end
  def rank_of_card_at(index)
    @cards[index].rank
    # require 'pry'; binding.pry
  end

  def high_ranking_cards
    high_ranked = []
    cards.each do |card|
      if card.rank >= 11 && high_ranked.include?(card) == false
        high_ranked << card
      end
    end
    return high_ranked
  end

  def percent_high_ranking
    ((high_ranking_cards.length().to_f / cards.length().to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
    if high_ranking_cards.include?(cards[0]) == false
      high_ranking_cards.shift
    end
  end

  def add_card(new_card)
    cards << new_card
  end

  def create_cards
    @cards.tap do |cards|
      [:club, :spade, :heart, :diamond].each do |suit|
        {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14}.each do |value, rank|
          cards << Card.new(suit, value, rank)
        end
      end
    end
  end



  # def make_deck
  #   52.times do

end
