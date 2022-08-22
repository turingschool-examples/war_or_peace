class Player
  attr_accessor :deck, :has_lost
  attr_reader :name
  
  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end
  
  def has_lost?
    if @deck.cards.count.zero?
      @has_lost = true
    else
      @has_lost
    end
  end
end