require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/cards'

class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def populate_cards
    File.foreach(@filename) { |line| put line }
  end


    # File.foreach(filename) { |line| array = line.slice.to_a}
end
