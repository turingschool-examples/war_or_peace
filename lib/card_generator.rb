class CardGenerator
  def initialize
    @cards = []
    @suits = [:diamond, :heart, :clubs, :spade]
    @values_and_ranks = {values: ['2', '3','4', '5', '6', '7' , '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'], ranks: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}
  end

  def add_card(card)
    @cards << card
  end

  def create_standard_deck
    @suits.each do |suit|
      13.times do |num|
        value = @values_and_ranks[:values].at(num)
        rank = @values_and_ranks[:ranks].at(num)
        add_card(Card.new(suit.to_sym), value, rank)
      end
    end
  end
end
