class Game
  attr_reader :deck,
              :suits,
              :values,
              :ranks

  def initialize
    @deck   = []
    @suits  = [:heart, :diamond, :club, :spade]
    @values = {
                "Ace" => 1, "2" =>  2, "3" => 3, "4"=> 4, "5" => 5, "6" => 6, "7" => 7, "8" => 9,
                "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13
              }
  end

  def create_new_deck
    @suits.each do |suit|
      @values.each do |value, rank|
          card = Card.new(suit, value, rank)
          @deck << card
      end
    end
  end 

  def shuffle 
    @deck.shuffle!
  end
end