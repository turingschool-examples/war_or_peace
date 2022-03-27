class CardGenerator
  def initialize (file)
    @file = file
    @cards = []
  end

  def cards
    File.readlines(@file).each do |line|
      item = line.strip.split(',')
      value = item[0]
      suit = item[1].strip.downcase.to_sym
      rank = item[2].strip.to_i
      @cards << Card.new(suit, value, rank)
    end
    return @cards
  end
end
