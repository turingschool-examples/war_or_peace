class Card
  #creates a method intitizliae that will run when we create a new card temp_variable
  def initialize(suit, value, rank)
    @suit = suit
    @value =  value
    @rank = rank

  end

  def suit
    @suit
  end

  def value
    @value
  end

  def rank
    @rank
  end

end
