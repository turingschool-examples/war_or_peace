class Game
  attr_reader :deck,
              :suits,
              :value,
              :rank

  def initialize
    @deck = []
    @suits = [:hearts, :diamonds, :clubs, :spades]
    @value = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  end
end 