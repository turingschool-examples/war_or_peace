class Player
  attr_reader :name, :deck
  def initialize(name, deck_obj)
    @name = name
    @deck = deck_obj
  end
end