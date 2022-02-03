require "./lib/card"
require "./lib/deck"
require "./lib/player"



class Player
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
  
  def has_lost?
    if (@deck.cards.count) >= 1 
      false
      
    end   
  end 
  
  
  
  
  
  
  
end
