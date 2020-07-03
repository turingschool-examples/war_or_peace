require './lib/deck'
require './lib/card'

class Player
attr_reader :name, :deck

  def initialize(name_param, deck_param)
    @name = name_param
    @deck = deck_param
  end

end
