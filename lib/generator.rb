class Generator
  attr_reader :deck,
              :suit,
              :value,
              :rank,
              :card
  def initialize
    @deck = []
    @suit = [:club, :diamond, :heart, :spade]
    @value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    @rank = 1..52
    @card = []
  end

  def build_cards
    until @rank == 14
      @rank += 1
        @card << @suit[0]
          # @card << @value
      end
      require "pry"; binding.pry
  end
end
