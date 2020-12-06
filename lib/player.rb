class Player 
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def card_count
    @deck.cards.length
  end

  def has_lost?
    if @deck.cards.empty?
      @has_lost = true
    else
      @has_lost
    end
  end
end