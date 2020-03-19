class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @game_status = false
  end

  def has_lost?
    @game_status
  end
end
