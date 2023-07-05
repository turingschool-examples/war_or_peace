class Player

  attr_reader :name, 
              :deck,
              :no_cards
  def initialize(name, deck)
    @name = name 
    @deck = deck 
    @no_cards = false 
  end

  def has_lost?
    if @deck.cards.length == 0 
      @no_cards = true
    else 
      @no_cards
    end
    # require 'pry'; binding.pry
  end
end