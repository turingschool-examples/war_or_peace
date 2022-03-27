require './lib/deck'

class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    card_data = []
    File.foreach(@filename) { |line|
      line.split(",")}
  end
end
