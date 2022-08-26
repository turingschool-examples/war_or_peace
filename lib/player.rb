class Player
  attr_reader :name, :has_lost  
  attr_accessor :deck 

  def initialize(name, deck)
    @name = name
    @deck = deck
    
  end 
  
  def has_lost?
    if @deck.cards.count == 0
      true 
    else
      false 
    end  
  end 

end