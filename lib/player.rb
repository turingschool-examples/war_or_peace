class Player
  attr_reader :deck, :name

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
    if @deck == []
      @has_lost = true
    else
      @has_lost
    end
  end
end
