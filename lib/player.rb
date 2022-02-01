class Player
  attr_reader :name, :deck_name

  def initialize(name, deck_name)
    @deck_name = deck_name
    @name = name
  end

end
