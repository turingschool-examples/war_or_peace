class Player
  attr_reader :name, :deck #lets you read attributes

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
  end

end
