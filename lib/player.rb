class Player
  attr_reader :name,
              :deck,
              :lost 

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

end
