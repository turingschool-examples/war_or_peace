class Player
  attr_reader :name, :deck, :spoils_of_war

  def initialize(name, deck)
    @name = name
    @deck = deck
  end


  def has_lost?
    if @deck.count == 0
    #
  end
end
