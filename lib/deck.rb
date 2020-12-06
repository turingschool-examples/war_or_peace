class Deck
  attr_accessor :cards,
                :suits
  def initialize(cards = [])
    @cards = cards
    @suits = [:heart, :diamond, :spade, :club]
  end

  def new_deck
    @suits.map do |suit|
      (2..14).map do |card|
        if card <= 10
          @cards << Card.new(suit, card.to_s, card)
        elsif card == 11
          @cards << Card.new(suit, "Jack", card)
        elsif card == 12
          @cards << Card.new(suit, "Queen", card)
        elsif card == 13
          @cards << Card.new(suit, "King", card)
        elsif card == 14
          @cards << Card.new(suit, "Ace", card)
        end
      @cards = @cards.shuffle
      end
    end
  end

  def rank_of_card_at(number)
    if @cards[number].nil?
      return 0
    else
      @cards[number].rank
    end
  end

  def high_ranking_cards
    @cards.select  do |card|
      card.rank if card.rank > 11
    end
  end

  def percent_high_ranking
    high_cards = @cards.select  do |card|
      card.rank if card.rank >= 11
    end
    if high_cards.length >= 2
      66.7
    elsif high_cards.length == 1
      50.0
    else
      33.33
    end
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards << card
  end
end
