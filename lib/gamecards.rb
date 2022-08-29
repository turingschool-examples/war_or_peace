require './lib/card'

class GameCards < Card
  def initialize()
    @suit  = [:diamond, :spade,:heart, :club]
    @rank = [1..13]
    @value = []
  end

  def start
  end
    
  def deck
    @value = []
    # { card1 = [suit => :, value => "", rank=> integer ]  
  

  end

end