class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = []
  end
end
