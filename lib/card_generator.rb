class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    File.foreach(filename) { |line| @cards << Card.new(line.chomp.split(", ")) }
  end

end
