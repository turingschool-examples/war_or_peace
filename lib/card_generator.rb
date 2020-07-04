class CardGenerator
  attr_reader :cards
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def generate_cards
    File.open(@filename).each do |line|
      contents = line.chomp.split(',')
      @cards << Card.new(contents[1].strip, contents[0], contents[2].to_i)
    end
  end
end
