class DeckBuilder
  attr_accessor :number, :suit, :value, :new_deck

    def initialize(number = "", suit = "", value = 0)
      @number = number
      @suit = suit
      @value = value
      @new_deck = []
    end

    def to_s
      "#{@number} of #{@suit}"
    end

    def build_deck
      @new_deck << Card.new("Spades", "A", 1)
      @new_deck << Card.new("Spades", "2", 2)
      @new_deck << Card.new("Spades", "3", 3)
      @new_deck << Card.new("Spades", "4", 4)
      @new_deck << Card.new("Spades", "5", 5)
      @new_deck << Card.new("Spades", "6", 6)
      @new_deck << Card.new("Spades", "7", 7)
      @new_deck << Card.new("Spades", "8", 8)
      @new_deck << Card.new("Spades", "9", 9)
      @new_deck << Card.new("Spades", "10", 10)
      @new_deck << Card.new("Spades", "J", 11)
      @new_deck << Card.new("Spades", "Q", 12)
      @new_deck << Card.new("Spades", "K", 13)
      @new_deck << Card.new("Hearts", "A", 1)
      @new_deck << Card.new("Hearts", "2", 2)
      @new_deck << Card.new("Hearts", "3", 3)
      @new_deck << Card.new("Hearts", "4", 4)
      @new_deck << Card.new("Hearts", "5", 5)
      @new_deck << Card.new("Hearts", "6", 6)
      @new_deck << Card.new("Hearts", "7", 7)
      @new_deck << Card.new("Hearts", "8", 8)
      @new_deck << Card.new("Hearts", "9", 9)
      @new_deck << Card.new("Hearts", "10", 10)
      @new_deck << Card.new("Hearts", "J", 11)
      @new_deck << Card.new("Hearts", "Q", 12)
      @new_deck << Card.new("Hearts", "K", 13)
      @new_deck << Card.new("Diamonds", "A", 1)
      @new_deck << Card.new("Diamonds", "2", 2)
      @new_deck << Card.new("Diamonds", "3", 3)
      @new_deck << Card.new("Diamonds", "4", 4)
      @new_deck << Card.new("Diamonds", "5", 5)
      @new_deck << Card.new("Diamonds", "6", 6)
      @new_deck << Card.new("Diamonds", "7", 7)
      @new_deck << Card.new("Diamonds", "8", 8)
      @new_deck << Card.new("Diamonds", "9", 9)
      @new_deck << Card.new("Diamonds", "10", 10)
      @new_deck << Card.new("Diamonds", "J", 11)
      @new_deck << Card.new("Diamonds", "Q", 12)
      @new_deck << Card.new("Diamonds", "K", 13)
      @new_deck << Card.new("Clubs", "A", 1)
      @new_deck << Card.new("Clubs", "2", 2)
      @new_deck << Card.new("Clubs", "3", 3)
      @new_deck << Card.new("Clubs", "4", 4)
      @new_deck << Card.new("Clubs", "5", 5)
      @new_deck << Card.new("Clubs", "6", 6)
      @new_deck << Card.new("Clubs", "7", 7)
      @new_deck << Card.new("Clubs", "8", 8)
      @new_deck << Card.new("Clubs", "9", 9)
      @new_deck << Card.new("Clubs", "10", 10)
      @new_deck << Card.new("Clubs", "J", 11)
      @new_deck << Card.new("Clubs", "Q", 12)
      @new_deck << Card.new("Clubs", "K", 13)
    end

end
