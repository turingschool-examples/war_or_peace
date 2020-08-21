class AltCardGenerator
  attr_reader :cards, :ranks, :suits

  def initialize
    @cards = []
    @ranks = {"2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8,
              "9": 9, "10": 10, "Jack": 11, "Queen": 12, "King": 13, "Ace": 14}
    @suits = [:diamond, :club, :heart, :spade]
    generate_cards
  end

  def generate_cards
    @suits.each do |suit|
      @ranks.each do |rank, value|
        @cards << Card.new(suit, rank, value)
      end
    end
  end

end
