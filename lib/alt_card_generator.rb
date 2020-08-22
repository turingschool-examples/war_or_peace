class AltCardGenerator
  attr_reader :cards

  def initialize
    @cards = []
    generate_cards
  end

  def generate_cards
    ranks = {"2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8,
              "9": 9, "10": 10, "Jack": 11, "Queen": 12, "King": 13, "Ace": 14}
    suits = [:diamond, :club, :heart, :spade]
    suits.each do |suit|
      ranks.each do |rank, value|
        @cards << Card.new(suit, rank, value)
      end
    end
  end

end
