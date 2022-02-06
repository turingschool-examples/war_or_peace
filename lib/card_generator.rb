class  CardGenerator
  def initialize
    @cards = []
    @suits = [:diamond, :heart, :clubs, :spade]
    @values_and_ranks = {values: ['2', '3','4', '5', '6', '7' , '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'], ranks: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}
  end
end
