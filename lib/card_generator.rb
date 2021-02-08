class CardGenerator
  attr_reader :cards_file, :cards

  def initialize(cards_file)
    @cards_file = cards_file
    @cards = []
    content = File.readlines (@cards_file)
    cards_array = content.map {|line| line.split(',')}
    cards_array.size.times {|n| cards << Card.new(cards_array[n][0], cards_array[n][1], cards_array[n][2].to_i)}
  end

end
