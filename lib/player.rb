class Player
  attr_reader:deck

  def name
    @name
  end
  
  def initialize(name, deck)
    @name = name
    @deck = deck
  end


  def has_lost?
    deck.cards.empty?
  end


end
