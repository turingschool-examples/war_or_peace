class AltCardGenerator
  attr_reader :cards, :ranks, :symbols

  def initialize
    @cards = []
    @ranks = {"2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8,
              "9": 9, "10": 10, "Jack": 11, "Queen": 12, "King": 13, "Ace": 14}
    @symbols = [:diamond, :club, :heart, :spade]
  end

  def generate_cards
    @symbols.each do |symbol|
      @ranks.each do |rank, value|
        cards << Card.new(symbol, rank, value)
      end
    end
  end

end
